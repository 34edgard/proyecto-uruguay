<?php
(function (){
  global $consultarEstado;
  
  $consultarEstado = function (){
    $datos = (new estado)->consultar(["campos"=>['id_estado','nombre_estado']]);
  // print_r($datos);
    foreach ($datos as $dato){
      plantilla("componentes/option",[
          "value"=>$dato['id_estado'],
          "contenido"=>$dato['nombre_estado']
      ]);
      
    }
  };
  })();