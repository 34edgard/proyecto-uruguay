<?php

namespace Funciones\ManejoDatosExtras;

use Liki\Plantillas\Flow;
use App\Controladores\DatosMedicos\Discapacidad;




class ConsultarDiscapacidad{
    
  public static function consultarDiscapacidad(){
    $datos = (new Discapacidad)->consultar(["campos"=>['id_discapacidad','nombre_discapacidad']]);
  // print_r($datos);
    foreach ($datos as $dato){
      Flow::html("componentes/option",[
          "value"=>$dato['id_discapacidad'],
          "contenido"=>$dato['nombre_discapacidad']
      ]);
      
    }
  }
  }