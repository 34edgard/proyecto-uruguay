<?php
(function (){
  global $consultarCondicionMedica;
  $consultarCondicionMedica = function (){
    $datos = (new condicion_medica)->consultar(["campos"=>['id_condicion_medica','nombre_condicion_medica']]);
  // print_r($datos);
    foreach ($datos as $dato){
      plantilla("componentes/option",[
          "value"=>$dato['id_condicion_medica'],
          "contenido"=>$dato['nombre_condicion_medica']
      ]);
      
    }
  };
  })();