<?php


namespace Funciones\ManejoDatosExtras;

use Liki\Plantillas\Plantilla;
use App\Inscripcion\Procedencia;


class ConsultarProcedencia{
  
  public static function consultarProcedencia(){
    $datos = (new Procedencia)->consultar(["campos"=>['id_procedencia','nombre_procedencia']]);
  // print_r($datos);
    foreach ($datos as $dato){
      Plantilla::HTML("componentes/option",[
          "value"=>$dato['id_procedencia'],
          "contenido"=>$dato['nombre_procedencia']
      ]);
      
    }
  }
  }