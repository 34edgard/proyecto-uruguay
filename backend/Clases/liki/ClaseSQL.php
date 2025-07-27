<?php


interface iSql {
    // La firma de generar_sql ahora incluye una referencia a $parametros para que la clase lo modifique.
    public function generar_sql(array $propiedades, array &$parametros): string;
}

abstract class SentenciasSql {
    protected $sql = '';
    protected array $parametros = []; // Nuevo array para almacenar los parámetros

    protected function añadirCampo(string $campo): void {
        $this->sql .= " $campo ";
    }

    // Este método ya no es necesario para construir SQL directamente
    // Se usará para añadir los valores a los parámetros.
    protected function añadirParametro(string $nombre, mixed $valor): string {
        // Puedes usar marcadores de posición con nombre (preferido) o posicionales.
        // Usaremos ":nombre" para mayor legibilidad y flexibilidad.
        $paramName = ":" . str_replace('.', '_', $nombre); // Reemplazar puntos si vienen en el nombre del campo
        $this->parametros[$paramName] = $valor;
        return $paramName; // Retorna el marcador de posición
    }

    protected function añadirPropiedades(array $propiedades, string $nombrePropiedad): void {
        if (!isset($propiedades[$nombrePropiedad]) || !is_array($propiedades[$nombrePropiedad])) {
            return;
        }

        $longitud = count($propiedades[$nombrePropiedad]);
        foreach ($propiedades[$nombrePropiedad] as $indice => $contenido) {
            if ($nombrePropiedad === 'campos') {
                $this->añadirCampo((string) $contenido);
            } elseif ($nombrePropiedad === 'valores_para_insertar') { // Nuevo nombre para distinguir de campos
                $this->sql .= $this->añadirParametro("val_" . $indice, $contenido); // Marcador de posición
            } elseif ($nombrePropiedad === 'orderBy') { // Si necesitas parámetros en ORDER BY (raro)
                 $this->sql .= "`$contenido`"; // ORDER BY generalmente no necesita parámetros para los nombres de columnas
            }
            // Agrega más lógica si otras propiedades necesitan manejo especial de parámetros

            if ($indice < $longitud - 1) {
                $this->sql .= ', ';
            }
        }
    }

    protected function añadirWhere(array $condiciones): void {
        if (empty($condiciones)) {
            return;
        }

        $this->sql .= " WHERE ";
        $this->añadirCondiciones($condiciones, 'AND');
    }

    protected function añadirCondiciones(array $condiciones, string $operadorLogico): void {
        $partes = [];
        foreach ($condiciones as $condicion) {
            if (is_array($condicion) && isset($condicion['operador'])) {
                $partes[] = $this->generarCondicionEspecial($condicion);
            } elseif (is_array($condicion) && count($condicion) === 1 && isset($condicion['OR'])) {
                $orPartes = [];
                foreach ($condicion['OR'] as $orCondicion) {
                    // Si es una condición compleja dentro de OR
                    if (is_array($orCondicion) && isset($orCondicion['operador'])) {
                        $orPartes[] = $this->generarCondicionEspecial($orCondicion);
                    } else {
                        // Asume formato 'campo' => 'valor' para OR simple
                        foreach ($orCondicion as $campo => $valor) {
                            $paramName = $this->añadirParametro("where_" . str_replace('.', '_', $campo) . "_" . uniqid(), $valor);
                            $orPartes[] = "`$campo` = $paramName";
                        }
                    }
                }
                $partes[] = "(" . implode(" OR ", $orPartes) . ")";
            } else {
                // Condición simple 'campo' => 'valor'
                foreach ($condicion as $campo => $valor) {
                    $paramName = $this->añadirParametro("where_" . str_replace('.', '_', $campo) . "_" . uniqid(), $valor);
                    $partes[] = "`$campo` = $paramName";
                }
            }
        }
        $this->sql .= implode(" $operadorLogico ", array_filter($partes));
    }

    protected function generarCondicionEspecial(array $condicion): string {
        switch (strtoupper($condicion['operador'])) {
            case 'BETWEEN':
                if (!isset($condicion['campo'], $condicion['valor1'], $condicion['valor2'])) {
                    throw new Exception("Condición BETWEEN incompleta.");
                }
                $campo = $condicion['campo'];
                $paramName1 = $this->añadirParametro("between_" . str_replace('.', '_', $campo) . "_1_" . uniqid(), $condicion['valor1']);
                $paramName2 = $this->añadirParametro("between_" . str_replace('.', '_', $campo) . "_2_" . uniqid(), $condicion['valor2']);
                return "`$campo` BETWEEN $paramName1 AND $paramName2";
            case 'IN':
                if (!isset($condicion['campo'], $condicion['valores']) || !is_array($condicion['valores'])) {
                    throw new Exception("Condición IN incompleta o valores no es un arreglo.");
                }
                $campo = $condicion['campo'];
                $inParams = [];
                foreach ($condicion['valores'] as $idx => $val) {
                    $inParams[] = $this->añadirParametro("in_" . str_replace('.', '_', $campo) . "_" . $idx . "_" . uniqid(), $val);
                }
                return "`$campo` IN (" . implode(", ", $inParams) . ")";
            case 'LIKE':
                if (!isset($condicion['campo'], $condicion['valor'])) {
                    throw new Exception("Condición LIKE incompleta.");
                }
                $campo = $condicion['campo'];
                // Para LIKE, los comodines (%) deben ser parte del valor del parámetro, no del SQL
                $paramName = $this->añadirParametro("like_" . str_replace('.', '_', $campo) . "_" . uniqid(), '%' . $condicion['valor'] . '%');
                return "`$campo` LIKE $paramName";
            case 'IN_SUBQUERY':
                // Para subconsultas, la subconsulta ya debería ser segura (generada por otra iSql)
                if (!isset($condicion['campo'], $condicion['subquery'])) {
                    throw new Exception("Condición IN_SUBQUERY incompleta.");
                }
                $campo = $condicion['campo'];
                // Las subconsultas no reciben parámetros directamente de la consulta padre
                // Asegúrate de que la subconsulta maneje sus propios parámetros internamente.
                $subquerySql = $this->obtenerSqlSubconsulta($condicion['subquery']);
                return "`$campo` IN ($subquerySql)";
            case 'EXISTS':
                // Similar a IN_SUBQUERY, la subconsulta maneja sus propios parámetros.
                if (!isset($condicion['subquery'])) {
                    throw new Exception("Condición EXISTS incompleta.");
                }
                $subquerySql = $this->obtenerSqlSubconsulta($condicion['subquery']);
                return "EXISTS ($subquerySql)";
            default:
                // Operadores estándar
                if (!isset($condicion['campo'], $condicion['valor'])) {
                    throw new Exception("Condición de operador estándar incompleta.");
                }
                $campo = $condicion['campo'];
                $paramName = $this->añadirParametro("op_" . str_replace('.', '_', $campo) . "_" . uniqid(), $condicion['valor']);
                return "`$campo` " . $condicion['operador'] . " $paramName";
        }
    }

    protected function obtenerSqlSubconsulta(mixed $subquery): string {
        if ($subquery instanceof iSql) {
            // Si es una instancia de una sentencia SQL (ej. Consultar), generar su SQL
            // ¡IMPORTANTE! Las subconsultas deben manejar sus propios parámetros internamente.
            // Esto significa que $subquery->generar_sql() DEBE agregar sus parámetros
            // al array de parámetros de la propia instancia de subquery, NO a $this->parametros.
            // Si la subconsulta es compleja, esto podría requerir un manejo más avanzado
            // o que la subconsulta sea un objeto Consultar completamente independiente.
            $subqueryParams = []; // La subconsulta tendrá sus propios parámetros
            return $subquery->generar_sql([], $subqueryParams); // Genera SQL de la subconsulta
        } elseif (is_string($subquery)) {
            // Si es una cadena, asumimos que es SQL ya formado (¡asegúrate de que sea seguro!)
            return $subquery;
        } else {
            throw new Exception("Subconsulta no válida. Debe ser una instancia iSql o una cadena SQL.");
        }
    }

    protected function añadirTabla(string $tabla): void {
        $this->sql .= " `$tabla` ";
    }

    // Nuevo método para pasar los parámetros generados
    public function obtenerParametros(): array {
        return $this->parametros;
    }
}

class Consultar extends SentenciasSql implements iSql {
    protected array $joins = [];
    protected array $groupBy = [];
    protected array $having = [];
    protected ?array $unionClause = null;

    public function addJoin(string $type, string $table, string $onCondition): self {
        // Los JOINS generalmente no necesitan parámetros en la condición ON si los campos son fijos.
        // Si la condición ON puede variar por datos del usuario, necesitarías marcadores de posición aquí también.
        $this->joins[] = [
            'type' => strtoupper($type),
            'table' => $table,
            'on' => $onCondition
        ];
        return $this;
    }

    public function setGroupBy(array $columns): self {
        $this->groupBy = $columns;
        return $this;
    }

    public function setHaving(array $conditions): self {
        $this->having = $conditions;
        return $this;
    }

    public function setUnion(string $type, mixed $query): self {
        if (!in_array(strtoupper($type), ['UNION', 'UNION ALL'])) {
            throw new Exception("Tipo de UNION no válido. Use 'UNION' o 'UNION ALL'.");
        }
        if (!($query instanceof iSql) && !is_string($query)) {
            throw new Exception("La consulta de UNION debe ser una instancia de iSql o una cadena SQL.");
        }
        $this->unionClause = ['type' => strtoupper($type), 'query' => $query];
        return $this;
    }

    // Ahora recibe $parametros por referencia
    public function generar_sql(array $propiedades, array &$parametros): string {
        // Reinicia los parámetros para esta consulta específica
        $this->parametros = [];
        $this->sql = "SELECT ";

        if (isset($propiedades['campos']) && is_array($propiedades['campos']) && !empty($propiedades['campos'])) {
            $this->añadirPropiedades($propiedades, 'campos');
        } else {
            $this->sql .= " * ";
        }

        if (empty($propiedades['tabla'])) {
            throw new Exception('Seleccione una tabla');
        }

        $this->sql .= " FROM ";
        $this->añadirTabla($propiedades['tabla']);

        // Añadir JOINS
        foreach ($this->joins as $join) {
            $this->sql .= " " . $join['type'] . " JOIN `" . $join['table'] . "` ON " . $join['on'];
        }

        // Cláusula WHERE
        if (isset($propiedades['where']) && is_array($propiedades['where'])) {
            $this->añadirWhere($propiedades['where']);
        }

        // Añadir GROUP BY
        if (!empty($this->groupBy)) {
            $this->sql .= " GROUP BY " . implode(", ", array_map(fn($col) => "`$col`", $this->groupBy));
        }

        // Añadir HAVING
        if (!empty($this->having)) {
            $this->sql .= " HAVING ";
            $this->añadirCondiciones($this->having, 'AND'); // Reutiliza la lógica de condiciones
        }

        // Cláusula ORDER BY
        if (isset($propiedades['orderBy']) && is_array($propiedades['orderBy'])) {
            $this->sql .= " ORDER BY ";
            // Aquí se asume que 'campo' y 'direccion' son nombres de columnas y no necesitan parámetros.
            // Si 'campo' o 'direccion' pudieran ser datos de usuario, necesitarías validación estricta (whitelist).
            $campo = $propiedades['orderBy']['campo'];
            $direccion = isset($propiedades['orderBy']['direccion']) ? strtoupper($propiedades['orderBy']['direccion']) : 'ASC';
            $this->sql .= "`$campo` $direccion";
        }

        // Cláusula LIMIT
        if (isset($propiedades['limit'])) {
            $limit = (int)$propiedades['limit'];
            $offset = isset($propiedades['offset']) ? (int)$propiedades['offset'] : 0;
            // LIMIT y OFFSET son generalmente enteros y no necesitan ser parametrizados,
            // pero siempre es buena práctica castearlos a int.
            $this->sql .= " LIMIT $limit";
            if ($offset > 0) {
                $this->sql .= " OFFSET $offset";
            }
        }

        // Añadir UNION
        if ($this->unionClause !== null) {
            $unionQuerySql = $this->obtenerSqlSubconsulta($this->unionClause['query']);
            $this->sql .= " " . $this->unionClause['type'] . " ($unionQuerySql)";
        }

        // Pasa los parámetros generados por referencia al array de parámetros global
        $parametros = $this->parametros;
           //echo $this->sql;
        return trim($this->sql);
    }
}

class Registrar extends SentenciasSql implements iSql {
    // Ahora recibe $parametros por referencia
    public function generar_sql(array $propiedades, array &$parametros): string {
        // Reinicia los parámetros para esta consulta específica
        $this->parametros = [];
        if (empty($propiedades['tabla'])) {
            throw new Exception('Seleccione una tabla');
        }
        if (empty($propiedades['campos']) || empty($propiedades['valores'])) {
            throw new Exception('Campos y valores no pueden estar vacíos para la inserción');
        }
        if (count($propiedades['campos']) !== count($propiedades['valores'])) {
            throw new Exception('La cantidad de campos no coincide con la cantidad de valores');
        }

        $this->sql = "INSERT INTO ";
        $this->añadirTabla($propiedades['tabla']);
        $this->sql .= " (";
        // Añadir campos (nombres de columnas, no se parametrizan)
        $this->añadirPropiedades($propiedades, 'campos');
        $this->sql .= ") VALUES (";

        $marcadores = [];
        foreach ($propiedades['valores'] as $index => $valor) {
            $marcadores[] = $this->añadirParametro("insert_val_" . $index . "_" . uniqid(), $valor);
        }
        $this->sql .= implode(", ", $marcadores);
        $this->sql .= ")";

        // Pasa los parámetros generados por referencia
        $parametros = $this->parametros;

        return $this->sql;
    }
}

class Editar extends SentenciasSql implements iSql {
    // Ahora recibe $parametros por referencia
    public function generar_sql(array $propiedades, array &$parametros): string {
        // Reinicia los parámetros para esta consulta específica
        $this->parametros = [];
        if (empty($propiedades['tabla'])) {
            throw new Exception('Seleccione una tabla');
        }
        if (!isset($propiedades['campos']) || !isset($propiedades['valores']) || count($propiedades['campos']) !== count($propiedades['valores'])) {
            throw new Exception('Los valores no coinciden con los campos');
        }

        $this->sql = "UPDATE ";
        $this->añadirTabla($propiedades['tabla']);
        $this->sql .= " SET ";

        $setParts = [];
        foreach ($propiedades['campos'] as $index => $campo) {
            $paramName = $this->añadirParametro("update_val_" . str_replace('.', '_', $campo) . "_" . uniqid(), $propiedades['valores'][$index]);
            $setParts[] = "`$campo` = $paramName";
        }
        $this->sql .= implode(", ", $setParts);

        // Cláusula WHERE
        if (isset($propiedades['where']) && is_array($propiedades['where'])) {
            $this->añadirWhere($propiedades['where']);
        }

        // Pasa los parámetros generados por referencia
        $parametros = $this->parametros;

        return $this->sql;
    }
}

class Eliminar extends SentenciasSql implements iSql {
    // Ahora recibe $parametros por referencia
    public function generar_sql(array $propiedades, array &$parametros): string {
        // Reinicia los parámetros para esta consulta específica
        $this->parametros = [];
        if (empty($propiedades['tabla'])) {
            throw new Exception('Seleccione una tabla');
        }

        $this->sql = "DELETE FROM ";
        $this->añadirTabla($propiedades['tabla']);

        // Cláusula WHERE (obligatoria para seguridad)
        if (isset($propiedades['where']) && is_array($propiedades['where'])) {
            $this->añadirWhere($propiedades['where']);
        } else {
            throw new Exception('La cláusula WHERE es obligatoria para la eliminación.');
        }

        // Pasa los parámetros generados por referencia
        $parametros = $this->parametros;

        return $this->sql;
    }
}


