<?php
(function (){
  global $consultarOcupacion;
  $consultarOcupacion = function (){
    $datos = (new ocupacion)->consultarDato(["campos"=>['id_ocupacion','nombre_ocupacion']]);
   // print_r($datos);
    foreach ($datos as $dato){
      echo "<option value=\"{$dato['id_ocupacion']}\">";
      echo $dato['nombre_ocupacion'];
      echo "</option>";
    }
  };
  })();