<?php
namespace Funciones\DatosPersonales;

use App\Controladores\DatosExtra\Ocupacion;
use Liki\Plantillas\Flow;

class ConsultaDeOcupacion{
  
  public static function consultarOcupacion(){
    $datos = (new Ocupacion)->consultar(["campos"=>['id_ocupacion','nombre_ocupacion']]);
   // print_r($datos);
    foreach ($datos as $dato){
        
        Flow::html("componentes/option",[
            "value"=>$dato['id_ocupacion'],
            "contenido"=>$dato['nombre_ocupacion']
        ]);
    }
  }
  }