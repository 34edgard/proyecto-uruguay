<?php
namespace Funciones;

class Edad {
    
    /**
     * Convierte una fecha en formato YYYY-MM-DD a un array
     */
    public static function fechaToArray(string $fecha): array {
        if (strlen($fecha) < 10) {
            throw new \InvalidArgumentException("Formato de fecha inválido");
        }
        
        return [
            (int) substr($fecha, 0, 4), // Año
            (int) substr($fecha, 5, 2), // Mes
            (int) substr($fecha, 8, 2)  // Día
        ];
    }
    
    /**
     * Calcula la edad basada en una fecha de nacimiento
     */
    public static function calcularEdad(string $fechaNacimiento, ?string $fechaReferencia = null): int {
        [$anoNac, $mesNac, $diaNac] = self::fechaToArray($fechaNacimiento);
        
        if ($fechaReferencia === null) {
            $anoRef = (int) date("Y");
            $mesRef = (int) date("m");
            $diaRef = (int) date("d");
        } else {
            [$anoRef, $mesRef, $diaRef] = self::fechaToArray($fechaReferencia);
        }
        
        $edad = $anoRef - $anoNac - 1;
        
        if ($mesRef > $mesNac || ($mesRef == $mesNac && $diaRef >= $diaNac)) {
            $edad++;
        }
        
        return $edad;
    }
    
    /**
     * Convierte fecha de formato YYYY-MM-DD a DD-MM-YYYY
     */
    public static function invertirFecha(string $fecha): string {
        [$ano, $mes, $dia] = self::fechaToArray($fecha);
        return sprintf("%02d-%02d-%04d", $dia, $mes, $ano);
    }
    
    // Métodos estáticos con nombres anteriores para mantener compatibilidad
    public static function Fecha(string $fecha): array {
        return self::fechaToArray($fecha);
    }
    
    public static function Edad(string $fecha, $fecha_actual = false): int {
        $fechaRef = ($fecha_actual === false) ? null : $fecha_actual;
        return self::calcularEdad($fecha, $fechaRef);
    }
    
    public static function Fecha_invertida(string $fecha): string {
        return self::invertirFecha($fecha);
    }
}