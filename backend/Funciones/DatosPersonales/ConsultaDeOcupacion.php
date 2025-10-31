<?php
namespace Funciones\DatosPersonales;

use App\DatosExtra\Ocupacion;
use Liki\Plantillas\Plantilla;

class ConsultaDeOcupacion{
  
  public static function consultarOcupacion(){
    $datos = (new Ocupacion)->consultar(["campos"=>['id_ocupacion','nombre_ocupacion']]);
   // print_r($datos);
    foreach ($datos as $dato){
        
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['id_ocupacion'],
            "contenido"=>$dato['nombre_ocupacion']
        ]);
    }
  }
  }