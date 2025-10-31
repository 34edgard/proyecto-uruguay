<?php

namespace Funciones\ManejoDatosExtras;

use Liki\Plantillas\Plantilla;
use App\DatosMedicos\Discapacidad;




class ConsultarDiscapacidad{
    
  public static function consultarDiscapacidad(){
    $datos = (new Discapacidad)->consultar(["campos"=>['id_discapacidad','nombre_discapacidad']]);
  // print_r($datos);
    foreach ($datos as $dato){
      Plantilla::HTML("componentes/option",[
          "value"=>$dato['id_discapacidad'],
          "contenido"=>$dato['nombre_discapacidad']
      ]);
      
    }
  }
  }