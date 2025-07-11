<?php



interface Rutas_Server {
    public static function validar_metodo(string $metodo): bool;
    public static function validar_parametros(array $parametros_esperados, array $parametros_recibidos): bool;
    public static function get(string $url_pattern, callable $funcion, array $parametros_extra = []);
    public static function post(string $url_pattern, callable $funcion, array $parametros_extra = []);
    public static function put(string $url_pattern, callable $funcion, array $parametros_extra = []);
    public static function delete(string $url_pattern, callable $funcion, array $parametros_extra = []);
    public static function dispatch(): void;
}

class Ruta implements Rutas_Server {

    private static array $routes = [];

    /**
     * Valida si los parámetros esperados están presentes en los parámetros recibidos.
     *
     * @param array $parametros_esperados Nombres de los parámetros que se esperan.
     * @param array $parametros_recibidos Parámetros recibidos (e.g., $_GET, $_POST).
     * @return bool True si todos los parámetros esperados están presentes, false de lo contrario.
     */
    public static function validar_parametros(array $parametros_esperados, array $parametros_recibidos): bool {
        foreach ($parametros_esperados as $parametro) {
            if (!isset($parametros_recibidos[$parametro])) {
                return false;
            }
        }
        return true;
    }

    /**
     * Valida si el método de la solicitud actual coincide con el método dado.
     *
     * @param string $metodo El método HTTP a validar (e.g., 'GET', 'POST').
     * @return bool True si los métodos coinciden, false de lo contrario.
     */
    public static function validar_metodo(string $metodo): bool {
        return $_SERVER['REQUEST_METHOD'] === $metodo;
    }

    /**
     * Convierte un patrón de URL con segmentos dinámicos a una expresión regular.
     * Ejemplo: /users/{id} -> #^/users/(\d+)$#
     *
     * @param string $url_pattern El patrón de URL con segmentos dinámicos.
     * @return string La expresión regular resultante.
     */
    private static function compile_route_pattern(string $url_pattern): string {
        // Escapa caracteres especiales de regex y reemplaza {param} con grupos de captura.
        $pattern = preg_replace('/\{([a-zA-Z0-9_]+)\}/', '([a-zA-Z0-9_]+)', $url_pattern);
        return '#^' . $pattern . '$#';
    }

    /**
     * Registra una ruta para un método HTTP específico.
     *
     * @param string $method El método HTTP (GET, POST, PUT, DELETE).
     * @param string $url_pattern El patrón de URL (puede incluir segmentos dinámicos como /users/{id}).
     * @param callable $handler La función de callback a ejecutar cuando la ruta coincide.
     * @param array $parametros_esperados Parámetros esperados en la data global (GET, POST, etc.).
     * @param array $funcion_extra Parámetros adicionales para la función de callback.
     */
    private static function add_route(string $method, string $url_pattern, callable $handler, array $parametros_esperados = [], array $funcion_extra = []): void {
        self::$routes[] = [
            'method' => $method,
            'url_pattern' => $url_pattern,
            'handler' => $handler,
            'parametros_esperados' => $parametros_esperados,
            'funcion_extra' => $funcion_extra,
            'regex_pattern' => self::compile_route_pattern($url_pattern) // Compila el patrón para regex
        ];
    }

    /**
     * Registra una ruta para solicitudes GET.
     */
    public static function get(string $url_pattern, callable $funcion, array $parametros_esperados = [], array $funcion_extra = []): void {
        self::add_route('GET', $url_pattern, $funcion, $parametros_esperados, $funcion_extra);
    }

    /**
     * Registra una ruta para solicitudes POST.
     */
    public static function post(string $url_pattern, callable $funcion, array $parametros_esperados = [], array $funcion_extra = []): void {
        self::add_route('POST', $url_pattern, $funcion, $parametros_esperados, $funcion_extra);
    }

    /**
     * Registra una ruta para solicitudes PUT.
     */
    public static function put(string $url_pattern, callable $funcion, array $parametros_esperados = [], array $funcion_extra = []): void {
        self::add_route('PUT', $url_pattern, $funcion, $parametros_esperados, $funcion_extra);
    }

    /**
     * Registra una ruta para solicitudes DELETE.
     */
    public static function delete(string $url_pattern, callable $funcion, array $parametros_esperados = [], array $funcion_extra = []): void {
        self::add_route('DELETE', $url_pattern, $funcion, $parametros_esperados, $funcion_extra);
    }

    /**
     * Procesa la solicitud entrante y despacha a la función de callback correspondiente.
     */
    public static function dispatch(): void {
        $request_uri = strtok($_SERVER['REQUEST_URI'], '?'); // Obtiene la URL sin la query string
        $request_method = $_SERVER['REQUEST_METHOD'];

        // Manejar datos de entrada para PUT/DELETE
        $input_data = [];
        if (in_array($request_method, ['PUT', 'DELETE'])) {
            parse_str(file_get_contents("php://input"), $input_data);
        } elseif ($request_method === 'POST') {
            $input_data = $_POST;
        } elseif ($request_method === 'GET') {
            $input_data = $_GET;
        }

        foreach (self::$routes as $route) {
            if ($route['method'] === $request_method && preg_match($route['regex_pattern'], $request_uri, $matches)) {
                // Elimina el primer elemento de $matches (la cadena completa)
                array_shift($matches);
                $dynamic_params = $matches; // Parámetros extraídos de la URL dinámica

                // Combina los parámetros dinámicos con los datos de entrada
                $all_params = array_merge($input_data, $dynamic_params);

                // Validar parámetros esperados (si los hay)
                if (!empty($route['parametros_esperados']) && !self::validar_parametros($route['parametros_esperados'], $all_params)) {
                    // Si faltan parámetros esperados, se podría lanzar una excepción o devolver un error 400
                    http_response_code(400);
                    echo "Error: Faltan parámetros requeridos.";
                    return;
                }

                try {
                    // Prepara los argumentos para la función de callback
                    $args = [];
                    if (!empty($all_params)) {
                        $args[] = $all_params; // Pasa todos los parámetros (GET/POST/PUT/DELETE + dinámicos)
                    }
                    if (!empty($route['funcion_extra'])) {
                        $args[] = $route['funcion_extra']; // Pasa parámetros extra definidos en la ruta
                    }

                    // Llama a la función de callback con los argumentos preparados
                    call_user_func_array($route['handler'], $args);
                    return; // Se encontró y ejecutó la ruta, salir.
                } catch (\Exception $e) {
                    http_response_code(500);
                    error_log($e->getMessage()); // Registrar el error en los logs del servidor
                    echo "Error interno del servidor.".$e->getMessage();
                    print($e);
                    return;
                }
            }
        }

        // Si ninguna ruta coincide
        http_response_code(404);
        echo "404 Not Found";
    }
}

