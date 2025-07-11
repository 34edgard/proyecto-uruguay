<?php
(function (){
  global $consultarNacionalidad;
  $consultarNacionalidad =function (){
    $datos = (new nacionalidad)->consultar(["campos"=>['id_nacionalidad','nombre_nacionalidad']]);
  // print_r($datos);
    foreach ($datos as $dato){
      plantilla("componentes/option",[
          "value"=>$dato['id_nacionalidad'],
          "contenido"=>$dato['nombre_nacionalidad']
      ]);
      
    }
  };
  
  
  })();