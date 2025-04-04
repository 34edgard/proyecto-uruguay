<?php
(function (){
  global $consultarEstado;
  
  $consultarEstado = function (){
    $datos = (new estado)->consultar_info(["campos"=>['id_estado','nombre_estado']]);
  // print_r($datos);
    foreach ($datos as $dato){
      
      echo "<option value=\"{$dato['id_estado']}\">";
      echo $dato['nombre_estado'];
      echo "</option>";
    }
  };
  })();