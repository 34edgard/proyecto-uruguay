<?php
(function (){
  global $consultarDiscapacidad;
  
  $consultarDiscapacidad = function (){
    $datos = (new discapacidad)->consultar(["campos"=>['id_discapacidad','nombre_discapacidad']]);
  // print_r($datos);
    foreach ($datos as $dato){
      
      echo "<option value=\"{$dato['id_discapacidad']}\">";
      echo $dato['nombre_discapacidad'];
      echo "</option>";
    }
  };
  })();