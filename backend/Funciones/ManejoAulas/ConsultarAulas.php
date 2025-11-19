<?php

use Liki\Plantillas\Plantilla;
use App\Plantel\Aulas;


return new class {
  public static function run() {
    //$extras = func_get_args();
   // extract($extras[0]);
 $periodos   = (new Aulas)->consultar([
      "campos"=>['id_aula','nombre_aula']
    ]);

    
      foreach ($periodos as $key => $dato) {
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['id_aula'],
            "contenido"=>$dato['nombre_aula']
        ]);
      }

  }
};
