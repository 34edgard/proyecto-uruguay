<?php
(function (){
  global $consultarEstadoNutricional;
  $consultarEstadoNutricional = function (){
    $datos = (new Estado_Nutricional)->consultar(["campos"=>['id_estado_nutricional','nombre_estado_nutricional']]);
  // print_r($datos);
    foreach ($datos as $dato){
      plantilla("componentes/option",[
          "value"=>$dato['id_estado_nutricional'],
          "contenido"=>$dato['nombre_estado_nutricional']
      ]);
    }
  };
  })();