<?php

namespace Liki\Plantillas;

class Plantilla {
    
    // Configuración de rutas base
    private static $basePaths = [
        'html' => './frontend/Html/',
        'js' => './frontend/js/',
        'paginas' => './frontend/Paginas/'
    ];
    
    // Extensión por defecto
    private static $defaultExtension = '.php';
    
    /**
     * Renderiza una plantilla HTML
     */
    public static function HTML(string $nombre, array $datos = []): void {
        self::render('html', $nombre, $datos);
    }
    
    /**
     * Renderiza una plantilla JavaScript
     */
    public static function JS(string $nombre, array $datos = []): void {
        self::render('js', $nombre, $datos);
    }
    
    /**
     * Renderiza una página completa
     */
    public static function paginas(string $nombre, array $datos = []): void {
        self::render('paginas', $nombre, $datos);
    }
    
    /**
     * Método principal de renderizado
     */
    private static function render(string $tipo, string $nombre, array $datos = []): void {
        // Normalizar el nombre del archivo
        $nombre = self::normalizarNombreArchivo($nombre);
        
        // Obtener la ruta completa del archivo
        $rutaArchivo = self::obtenerRutaArchivo($tipo, $nombre);
        
        // Verificar si el archivo existe
        if (!self::verificarArchivo($rutaArchivo)) {
            throw new \Exception("La plantilla '{$nombre}' no existe en el directorio '{$tipo}'");
        }
        
        // Extraer variables de forma segura
        $variablesExtraidas = self::extraerVariables($datos);
        extract($variablesExtraidas);
        // Incluir la plantilla
        include $rutaArchivo;
    }
    
    /**
     * Normaliza el nombre del archivo
     */
    private static function normalizarNombreArchivo(string $nombre): string {
        return str_replace('—', '/', $nombre);
    }
    
    /**
     * Obtiene la ruta completa del archivo
     */
    private static function obtenerRutaArchivo(string $tipo, string $nombre): string {
        if (!isset(self::$basePaths[$tipo])) {
            throw new \Exception("Tipo de plantilla '{$tipo}' no válido");
        }
        
        return self::$basePaths[$tipo] . $nombre . self::$defaultExtension;
    }
    
    /**
     * Verifica si el archivo existe y es legible
     */
    private static function verificarArchivo(string $rutaArchivo): bool {
        return file_exists($rutaArchivo) && is_readable($rutaArchivo);
    }
    
    /**
     * Extrae variables de forma segura
     */
    private static function extraerVariables(array $datos): array {
        $variablesExtraidas = [];
        
        foreach ($datos as $key => $value) {
            if (is_string($key) && !empty($key)) {
                $variablesExtraidas[$key] = $value;
            }
        }
        
        extract($variablesExtraidas, EXTR_SKIP);
        return $variablesExtraidas;
    }
    
    /**
     * Método para escapar output de forma segura
     */
    public static function escapar(string $texto): string {
        return htmlspecialchars($texto, ENT_QUOTES | ENT_HTML5, 'UTF-8');
    }
    
    /**
     * Método para incluir partials/reutilizables
     */
    public static function incluir(string $partial, array $datos = []): void {
        self::HTML($partial, $datos);
    }
    
    /**
     * Cambiar rutas base en tiempo de ejecución
     */
    public static function configurarRuta(string $tipo, string $nuevaRuta): void {
        if (isset(self::$basePaths[$tipo])) {
            // Asegurar que la ruta termine con /
            self::$basePaths[$tipo] = rtrim($nuevaRuta, '/') . '/';
        }
    }
    
    /**
     * Obtener todas las rutas configuradas
     */
    public static function obtenerRutas(): array {
        return self::$basePaths;
    }
}