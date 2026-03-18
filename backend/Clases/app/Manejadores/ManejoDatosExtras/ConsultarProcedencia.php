<?php


namespace Funciones\ManejoDatosExtras;

use Liki\Plantillas\Flow;
use App\Controladores\Inscripcion\Procedencia;


class ConsultarProcedencia{
  
  public static function consultarProcedencia(){
    $datos = (new Procedencia)->consultar(["campos"=>['id_procedencia','nombre_procedencia']]);
  // print_r($datos);
    foreach ($datos as $dato){
      Flow::html("componentes/option",[
          "value"=>$dato['id_procedencia'],
          "contenido"=>$dato['nombre_procedencia']
      ]);
      
    }
  }
  }