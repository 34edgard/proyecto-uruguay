<?php

namespace Funciones\ManejoDatosExtras;

use Liki\Plantillas\Plantilla;
use App\DatosMedicos\EstadoNutricional;


class ConsultarEstadoNutricional{
 public static function consultarEstadoNutricional(){
    $datos = (new EstadoNutricional)->consultar(["campos"=>['id_estado_nutricional','nombre_estado_nutricional']]);
  // print_r($datos);
    foreach ($datos as $dato){
      Plantilla::HTML("componentes/option",[
          "value"=>$dato['id_estado_nutricional'],
          "contenido"=>$dato['nombre_estado_nutricional']
      ]);
    }
  }
  }