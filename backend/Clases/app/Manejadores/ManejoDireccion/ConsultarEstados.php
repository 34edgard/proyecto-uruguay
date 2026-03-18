<?php

namespace Funciones\ManejoDireccion;

use Liki\Plantillas\Flow;
use App\Controladores\Direccion\Estado;

class ConsultarEstados{
  public static function consultarEstado(){
    $datos = (new Estado)->consultar(["campos"=>['id_estado','nombre_estado']]);
  // print_r($datos);
    foreach ($datos as $dato){
      Flow::html("componentes/option",[
          "value"=>$dato['id_estado'],
          "contenido"=>$dato['nombre_estado']
      ]);
      
    }
  }
  }