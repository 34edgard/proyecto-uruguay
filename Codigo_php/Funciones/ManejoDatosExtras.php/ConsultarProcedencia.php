<?php
(function (){
  global $consultarProcedencia;
  $consultarProcedencia = function (){
    $datos = (new procedencia)->consultarDato(["campos"=>['id_procedencia','nombre_procedencia']]);
  // print_r($datos);
    foreach ($datos as $dato){
      
      echo "<option value=\"{$dato['id_procedencia']}\">";
      echo $dato['nombre_procedencia'];
      echo "</option>";
    }
  };
  })();