<?php

use App\Controladores\Plantel\Secciones;
use Liki\Database\FlowDB;
use Liki\Plantillas\Flow;

return new class {
  public static function run() {
     $niveles = FlowDB::conf('Secciones')->campos(['nombre_seccion','id_seccion'])->get();

    
    foreach ($niveles as $key => $dato) {
      $num_docentes = 0;
      $num_niños =0;
    
    Flow::html("componentes/option",[
        "value"=>$dato['id_seccion'],
        "contenido"=>$dato['nombre_seccion']
    ]);
     }
  }
};
