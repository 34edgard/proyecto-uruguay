<?php

namespace Funciones\DatosPersonales;
use Liki\Plantillas\Plantilla;


class Sexos {
  
 
 public static function optenerSexos(){
  $datos = ['masculino', 'femenino'];
   foreach ($datos as $dato){
    Plantilla::HTML("componentes/option",[
        "value"=>$dato,
        "contenido"=>$dato
    ]);
    }
   
  }
  
  }