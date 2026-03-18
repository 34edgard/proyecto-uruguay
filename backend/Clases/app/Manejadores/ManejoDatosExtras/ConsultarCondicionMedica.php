<?php
namespace Funciones\ManejoDatosExtras;

use Liki\Plantillas\Flow;
use App\Controladores\DatosMedicos\CondicionMedica;





class ConsultarCondicionMedica{
  public static function consultarCondicionMedica(){
    $datos = (new CondicionMedica)->consultar(["campos"=>['id_condicion_medica','nombre_condicion_medica']]);
  // print_r($datos);
    foreach ($datos as $dato){
      Flow::html("componentes/option",[
          "value"=>$dato['id_condicion_medica'],
          "contenido"=>$dato['nombre_condicion_medica']
      ]);
      
    }
  }
  }