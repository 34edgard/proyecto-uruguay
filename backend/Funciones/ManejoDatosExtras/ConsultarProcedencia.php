<?php
(function (){
  global $consultarProcedencia;
  $consultarProcedencia = function (){
    $datos = (new procedencia)->consultar(["campos"=>['id_procedencia','nombre_procedencia']]);
  // print_r($datos);
    foreach ($datos as $dato){
      plantilla("componentes/option",[
          "value"=>$dato['id_procedencia'],
          "contenido"=>$dato['nombre_procedencia']
      ]);
      
    }
  };
  })();