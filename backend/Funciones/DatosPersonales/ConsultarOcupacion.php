<?php

use App\DatosExtra\Ocupacion;


(function (){
  global $consultarOcupacion;
  $consultarOcupacion = function (){
    $datos = (new Ocupacion)->consultar(["campos"=>['id_ocupacion','nombre_ocupacion']]);
   // print_r($datos);
    foreach ($datos as $dato){
        
        plantilla("componentes/option",[
            "value"=>$dato['id_ocupacion'],
            "contenido"=>$dato['nombre_ocupacion']
        ]);
    }
  };
  })();