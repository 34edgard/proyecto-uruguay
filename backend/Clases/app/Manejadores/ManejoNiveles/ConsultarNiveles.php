<?php

use App\Controladores\Plantel\TipoNivel;
use Liki\Plantillas\Flow;
use Liki\Database\FlowDB;


 return new class {
  public static function run() {
     $niveles = FlowDB::conf('TipoNivel')
    ->campos(['nombre_nivel','id_tipo_nivel'])
    ->get();

    
    foreach ($niveles as $key => $nivel) {
      $num_docentes = 0;
      $num_niños =0;
    Flow::html("componentes/option",[
        "value"=>$nivel['id_tipo_nivel'],
        "contenido"=>$nivel['nombre_nivel']
    ]);
     }
    
  
  }
};
