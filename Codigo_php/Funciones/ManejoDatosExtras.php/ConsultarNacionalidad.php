<?php
(function (){
  global $consultarNacionalidad;
  $consultarNacionalidad =function (){
    $datos = (new nacionalidad)->consultarDato(["campos"=>['id_nacionalidad','nombre_nacionalidad']]);
  // print_r($datos);
    foreach ($datos as $dato){
      
      echo "<option value=\"{$dato['id_nacionalidad']}\">";
      echo $dato['nombre_nacionalidad'];
      echo "</option>";
    }
  };
  
  
  })();