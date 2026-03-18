<?php


namespace Funciones\ManejoDireccion;

use Liki\Plantillas\Flow;
use App\Controladores\Direccion\Parroquia;


class ConsultarParroquias{

 public static function consultarParroquias() {
    $Extras = func_get_args();
    extract($Extras[0]);
    
    $id = $Municipio1 ?? $Municipio2 ?? $id_municipio;
    $pars = (new Parroquia())->consultar([
      "campos" => ["id_municipio", "id_parroquia", "nombre_parroquia"],
      "where"=>[
       [ "campo"=>'id_municipio',"operador"=>'=',"valor"=>$id]
      ]
      
    ]);
    foreach ($pars as $dato) {
        Flow::html("componentes/option",[
            "value"=>$dato['id_parroquia'],
            "contenido"=>$dato['nombre_parroquia']
        ]);
        
    }

  }
  
}
