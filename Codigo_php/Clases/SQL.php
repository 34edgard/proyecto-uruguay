<?php


interface iSql {
  public function generar_sql(array $propiedades, array $datos): string;

}

abstract class SentenciasSql {
    protected $sql = '';

    protected function añadirCampo(string $campo): void {
        $this->sql .= " `$campo` ";
    }

    protected function añadirValor(mixed $valor): void {
        $this->sql .= $this->determinarTipo($valor);
    }

    protected function determinarTipo(mixed $valor): string {
        if (is_null($valor)) {
            return " NULL";  // Para valores nulos
        }
        return is_numeric($valor) ? " $valor" : " '" . addslashes($valor) . "'";
    }


    protected function añadirPropiedades(array $propiedades, string $nombrePropiedad): void {
        if (!isset($propiedades[$nombrePropiedad]) || !is_array($propiedades[$nombrePropiedad])) {
            return; // Evitar errores si la propiedad no existe o no es un array
        }

        $longitud = count($propiedades[$nombrePropiedad]);
        foreach ($propiedades[$nombrePropiedad] as $indice => $contenido) {
            $this->añadirCampoORNumericORString($nombrePropiedad, $contenido);
            if ($indice < $longitud - 1) {
                $this->sql .= ', ';
            }
        }
    }

    protected function añadirCampoORNumericORString(string $tipo, mixed $contenido): void {
        if ($tipo === 'campos') {
            $this->añadirCampo((string) $contenido); // Asegurarse de que el contenido sea string
        } elseif ($tipo === 'valores') {
            $this->añadirValor($contenido);
        }
    }

    protected function añadirTabla(string $tabla): void {
        $this->sql .= " `$tabla` ";
    }

    // Métodos para las nuevas cláusulas

    protected function añadirWhere(array $condiciones): void {
        if (!empty($condiciones)) {
            $this->sql .= " WHERE ";
            $primeraCondicion = true;
            foreach ($condiciones as $condicion) {
                if (!$primeraCondicion) {
                    $this->sql .= " AND "; // Puedes cambiar 'AND' por 'OR' si es necesario
                }
                $this->sql .= $this->formatearCondicion($condicion);
                $primeraCondicion = false;
            }
        }
    }

    protected function formatearCondicion(array $condicion): string {
        $campo = $condicion['campo'] ?? null;
        $operador = $condicion['operador'] ?? '=';
        $valor = $condicion['valor'] ?? null;

        if ($campo === null || $valor === null) {
            return ''; // O lanzar una excepción, dependiendo de tu manejo de errores
        }

        $campoFormateado = "`" . addslashes($campo) . "`";
        $valorFormateado = $this->determinarTipo($valor);

        if ($operador === 'LIKE') {
            $valorFormateado = " '%" . addslashes(str_replace("'", "", $valor)) . "%'"; //escape single quotes
            return "{$campoFormateado} LIKE {$valorFormateado}";
        }

        return "{$campoFormateado} {$operador} {$valorFormateado}";
    }

    protected function añadirOrderBy(string $campo, string $direccion = 'ASC'): void {
        $direccion = strtoupper($direccion); // Asegurarse de que la dirección sea mayúscula
        if ($direccion !== 'ASC' && $direccion !== 'DESC') {
            $direccion = 'ASC'; // Valor por defecto si la dirección no es válida
        }
        $this->sql .= " ORDER BY `$campo` $direccion";
    }

    protected function añadirLimit(int $limit, int $offset = 0): void {
        if ($offset > 0) {
            $this->sql .= " LIMIT $offset, $limit";
        } else {
            $this->sql .= " LIMIT $limit";
        }
    }

    public function getSql(): string {
        return $this->sql;
    }
}

class Consultar extends SentenciasSql implements iSql {
    public function generar_sql(array $propiedades = ['tabla' => '', 'campos' => ['*']], array $datos = []): string {
        if (empty($propiedades['tabla'])) {
            throw new \Exception('Seleccione una tabla');
        }

        $this->sql = 'SELECT ';
        $this->añadirPropiedades($propiedades, 'campos');
        $this->sql .= " FROM ";
        $this->añadirTabla($propiedades['tabla']);

        // Cláusulas adicionales
        if (isset($propiedades['where']) && is_array($propiedades['where'])) {
            $this->añadirWhere($propiedades['where']);
        }

        if (isset($propiedades['orderBy']) && is_array($propiedades['orderBy'])) {
             $this->añadirOrderBy($propiedades['orderBy']['campo'], $propiedades['orderBy']['direccion'] ?? 'ASC');
        }

        if (isset($propiedades['limit'])) {
            $offset = $propiedades['offset'] ?? 0;
            $this->añadirLimit($propiedades['limit'], $offset);
        }



        return $this->sql;
    }
}

class Registrar extends SentenciasSql implements iSql {
    public function generar_sql(array $propiedades, array $datos = []): string {
        if (empty($propiedades['tabla'])) {
            throw new \Exception('Seleccione una tabla');
        } else if (!isset($propiedades['campos']) || !isset($propiedades['valores']) || count($propiedades['campos']) !== count($propiedades['valores'])) {
            throw new \Exception('Los valores no coinciden con los campos');
        }

        $this->sql = "INSERT INTO ";
        $this->añadirTabla($propiedades['tabla']);
        $this->sql .= " (";
        $this->añadirPropiedades($propiedades, 'campos');
        $this->sql .= ") VALUES (";
        $this->añadirPropiedades($propiedades, 'valores');
        $this->sql .= ") ";

        return $this->sql;
    }
}

class Editar extends SentenciasSql implements iSql {
    public function generar_sql(array $propiedades, array $datos = []): string {
        if (empty($propiedades['tabla'])) {
            throw new \Exception('Seleccione una tabla');
        }

        if (!isset($propiedades['campos']) || !isset($propiedades['valores']) || count($propiedades['campos']) !== count($propiedades['valores'])) {
              throw new \Exception('Los valores no coinciden con los campos');
        }

        $this->sql = "UPDATE ";
        $this->añadirTabla($propiedades['tabla']);
        $this->sql .= " SET ";

        foreach ($propiedades['campos'] as $index => $campo) {
            $this->añadirCampo($campo);
            $this->sql .= " = ";
            $this->añadirValor($propiedades['valores'][$index]);
            if ($index < count($propiedades['campos']) - 1) {
                $this->sql .= ", ";
            }
        }

        // Cláusula WHERE
       if (isset($propiedades['where']) && is_array($propiedades['where'])) {
            $this->añadirWhere($propiedades['where']);
        }


        return $this->sql;
    }
}

class Eliminar extends SentenciasSql implements iSql {
    public function generar_sql(array $propiedades, array $datos = []): string {
        if (empty($propiedades['tabla'])) {
            throw new \Exception('Seleccione una tabla');
        }

        $this->sql = "DELETE FROM ";
        $this->añadirTabla($propiedades['tabla']);

        // Cláusula WHERE (obligatoria para seguridad)
        if (isset($propiedades['where']) && is_array($propiedades['where'])) {
            $this->añadirWhere($propiedades['where']);
        } else {
            throw new \Exception('La cláusula WHERE es obligatoria para la eliminación.');
        }

        return $this->sql;
    }
}



