<?php


interface ConexionesBaseDatos {
    public function crearConexion(): ?PDO;
    public function validarConexion(PDO $conexion): ?PDO;
    public function cerrarConexion(PDO $conexion): void;
}

class ConexionesBD implements ConexionesBaseDatos {
    protected $dsn = DSN; // Suponiendo que DSN está definido globalmente o en un archivo de configuración
    protected $usuario = usuario_BD; // Suponiendo que usuario_BD está definido
    protected $contrasena = contraceña_BD; // Suponiendo que contraceña_BD está definido

    public function crearConexion(): ?PDO {
        try {
            $conexion = new PDO($this->dsn, $this->usuario, $this->contrasena);
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $conexion->setAttribute(PDO::ATTR_EMULATE_PREPARES, false); // Desactivar la emulación de prepares para mayor seguridad
            return $this->validarConexion($conexion);
        } catch (PDOException $e) {
            throw new Exception("Error conectando a la base de datos: " . $e->getMessage());
        }
    }

    public function validarConexion(PDO $conexion): ?PDO {
        // En este caso, no se necesita validar la conexión adicionalmente.
        return $conexion;
    }

    public function cerrarConexion(PDO $conexion): void {
        $conexion = null;
    }
}

class ConsultasBD extends ConexionesBD {

    /**
     * Ejecuta una consulta SQL preparada (INSERT, UPDATE, DELETE).
     *
     * @param string $sql La consulta SQL con marcadores de posición.
     * @param array $parametros Un array asociativo de parámetros para vincular.
     * @return int El número de filas afectadas.
     * @throws Exception Si hay un error en la conexión o al ejecutar la consulta.
     */
    public function ejecutarConsulta(string $sql, array $parametros = []): int {
        $conexion = $this->crearConexion();
        if (!$conexion) {
            throw new Exception('Error en la conexión a la base de datos.');
        } 
     
        
        try {
            $stmt = $conexion->prepare($sql); // Prepara la consulta
            $stmt->execute($parametros); // Ejecuta la consulta con los parámetros vinculados
            return $stmt->rowCount(); // Retorna el número de filas afectadas
        } catch (PDOException $e) {
            throw new Exception("Fallo al ejecutar la consulta: " . $e->getMessage());
        } finally {
            $this->cerrarConexion($conexion);
        }
    }

    /**
     * Consulta registros de la base de datos usando una consulta preparada.
     *
     * @param string $sql La consulta SQL con marcadores de posición.
     * @param array $parametros Un array asociativo de parámetros para vincular.
     * @return array Un array de arrays asociativos con los resultados.
     * @throws Exception Si hay un error en la consulta.
     */
    public function consultarRegistro(string $sql, array $parametros = []): array {
        $conexion = $this->crearConexion();
        if (!$conexion) {
            return [];
        }

        $arreglo = [];
        try {
            $stmt = $conexion->prepare($sql); // Prepara la consulta
            $stmt->execute($parametros); // Ejecuta la consulta con los parámetros vinculados
            $arreglo = $stmt->fetchAll(PDO::FETCH_ASSOC); // Obtiene todos los resultados
        } catch (PDOException $e) {
            throw new Exception("Error en la consulta: " . $e->getMessage());
        } finally {
            $this->cerrarConexion($conexion);
        }

        return $arreglo;
    }
}


