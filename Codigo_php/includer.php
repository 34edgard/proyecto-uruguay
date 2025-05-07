<?php

function listarArchivosEnDirectorio($directorio) {
    // Verificar si el directorio existe
    if (!is_dir($directorio)) {
        return "El directorio no existe.";
    }

    // Inicializar un arreglo para almacenar los nombres de los archivos
    $archivos = [];

    // Abrir el directorio
    if ($gestor = opendir($directorio)) {
        while (false !== ($archivo = readdir($gestor))) {
            // Ignorar los directorios '.' y '..'
            if ($archivo !== '.' && $archivo !== '..') {
                $rutaArchivo = $directorio . '/' . $archivo;

                if (is_file($rutaArchivo) && pathinfo($archivo, PATHINFO_EXTENSION) === 'php') {
                    $archivos[] = $archivo;
                } elseif (is_dir($rutaArchivo)) {
                    $subArchivos = listarArchivosEnDirectorio($rutaArchivo);
                    if (!empty($subArchivos)) {
                        $archivos[$archivo] = $subArchivos;
                    }
                }
            }
        }
        closedir($gestor);
    }

    return $archivos;
}

function incluirArchivos($archivos, $url) {
    foreach ($archivos as $indice => $archivo) {
        if (is_string($archivo)) {
            include $url . $archivo;
        } elseif (is_array($archivo)) {
            incluirArchivos($archivo, $url . $indice . '/');
        }
    }
}
$p =__DIR__.'/';
$urlF = $p . 'Funciones/';
$urlConf = $p . 'Configuracion/';
$urlC = $p . 'Clases/';
//echo $urlC;
$clases = listarArchivosEnDirectorio($urlC);
$conf = listarArchivosEnDirectorio($urlConf);
$funciones = listarArchivosEnDirectorio($urlF);

incluirArchivos($conf,$urlConf);
incluirArchivos($clases,$urlC);
incluirArchivos($funciones,$urlF);





// Este objeto se usa para manejar peticiones como post o get 
//$PETICION = new Peticion();
