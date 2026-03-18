<?php

$startMem = memory_get_usage();
$inicio = microtime(true); // Guarda el tiempo actual como un número flotante

include "./conf.php";
include "./backend/autoload.php";



use Liki\Routing\Ruta;



Ruta::group('app/Docente');

Ruta::group('app/Plantel');



Ruta::group('liki/toolsDep');


/*


Ruta::group('app/Estudiante',true);

Ruta::group('app/Reprecentante',true);

Ruta::group('app/Direccion',true);
Ruta::group('app/Reportes',true);



Ruta::group('app/Admin',true);

*/
Ruta::group('app/Paginas');

Ruta::group('liki/builders');

Ruta::group('app/Sesiones');

Ruta::group('app/Usuario');

// Run the router 
Ruta::dispatch();
 $fin = microtime(true); // Guarda el tiempo final
 $tiempo_total = $fin - $inicio; // Calcula la diferencia     
 $sm = file_get_contents('./logs/rendimiento.log') ;
 $sm .= "------------------------------------\n";
 $sm .= 'url: '. $_SERVER['REQUEST_URI']."\n";
 $sm .= "El proceso tomó: " .round($tiempo_total,6) . " segundos.\n";
 $sm .= "Memoria usada: " . round((memory_get_usage() - $startMem) / 1024 / 1024, 2) . " MB\n\n";
 
 file_put_contents('./logs/rendimiento.log',$sm);
 