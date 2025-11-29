<?php

use Liki\Plantillas\Plantilla;
use App\Personas\Reprecentante;



return new class {
  public static function run($p) {
    
    extract($p);
 $r   = (new Reprecentante)->consultar([
      "campos"=>['cedula'],
    "where"=>[
        ["campo"=>'cedula',"operador"=>'LIKE',
        "valor"=>$buscar_ci.'%']
    ]
    ]);

    
      foreach ($r as $key => $dato) {
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['cedula'],
            "contenido"=>$dato['cedula']
        ]);
      }
    
  }
};
