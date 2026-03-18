<?php

namespace Funciones\DatosPersonales;
use Liki\Plantillas\Flow;


class Sexos {
  
 
 public static function optenerSexos(){
  $datos = ['masculino', 'femenino'];
   foreach ($datos as $dato){
    Flow::html("componentes/option",[
        "value"=>$dato,
        "contenido"=>$dato
    ]);
    }
   
  }
  
  }