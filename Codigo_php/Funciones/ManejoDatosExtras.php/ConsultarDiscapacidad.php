<?php
(function (){
  global $consultarDiscapacidad;
  
  $consultarDiscapacidad = function (){
    $datos = (new discapacidad)->consultar(["campos"=>['id_discapacidad','nombre_discapacidad']]);
  // print_r($datos);
    foreach ($datos as $dato){
      plantilla("componentes/option",[
          "value"=>$dato['id_discapacidad'],
          "contenido"=>$dato['nombre_discapacidad']
      ]);
      
    }
  };
  })();