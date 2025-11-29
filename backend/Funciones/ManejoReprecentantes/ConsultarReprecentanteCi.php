<?php

use Liki\Plantillas\Plantilla;
use App\Personas\Reprecentante;



return new class {
  public static function run($p) {
    
    extract( $p);
 $r   = (new Reprecentante)->consultar([
      "campos"=>['cedula']
    ]);

    
      foreach ($r as $key => $dato) {
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['cedula'],
            "contenido"=>$dato['cedula']
        ]);
      }
    
  }
};
