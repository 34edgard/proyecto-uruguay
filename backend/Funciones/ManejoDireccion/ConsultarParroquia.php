<?php

namespace Funciones\ManejoDireccion;

use Liki\Plantillas\Plantilla;
use App\Direccion\Parroquia;


class ConsultarParroquia{

  public static function consultarParroquia() {
    $Extras = func_get_args();
    extract($Extras[0]);
   $id_parro = $estado ?? 1;
    $pars = (new Parroquia())->consultar([
      "campos" => ["id_parroquia", "nombre_parroquia"],
      "where"=>[
        ["campo"=>"id_municipio","operador"=>'=',"valor"=>$id_parro]
      ]
    ]);
    foreach ($pars as $dato) {
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['id_parroquia'],
            "contenido"=>$dato['nombre_parroquia']
        ]);
        
    }
  }
  
}
