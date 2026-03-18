<?php

namespace Funciones\ManejoDatosExtras;

use Liki\Plantillas\Flow;
use App\Controladores\Inscripcion\Nacionalidad;

class ConsultarNacionalidad{
  public static function consultarNacionalidad(){
    $datos = (new Nacionalidad)->consultar(["campos"=>['id_nacionalidad','nombre_nacionalidad']]);
  // print_r($datos);
    foreach ($datos as $dato){
      Flow::html("componentes/option",[
          "value"=>$dato['id_nacionalidad'],
          "contenido"=>$dato['nombre_nacionalidad']
      ]);
      
    }
  }
  
  
  }