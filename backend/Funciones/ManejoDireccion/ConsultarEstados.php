<?php

namespace Funciones\ManejoDireccion;

use Liki\Plantillas\Plantilla;
use App\Direccion\Estado;

class ConsultarEstados{
  public static function consultarEstado(){
    $datos = (new Estado)->consultar(["campos"=>['id_estado','nombre_estado']]);
  // print_r($datos);
    foreach ($datos as $dato){
      Plantilla::HTML("componentes/option",[
          "value"=>$dato['id_estado'],
          "contenido"=>$dato['nombre_estado']
      ]);
      
    }
  }
  }