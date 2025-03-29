<?php
(function (){
  global $consultarNivelInstruccion;
  $consultarNivelInstruccion =function (){
    $datos = (new nivel_instruccion)->consultarDato(["campos"=>['id_nivel_instruccion','nombre_nivel_instruccion']]);
  // print_r($datos);
    foreach ($datos as $dato){
      
      echo "<option value=\"{$dato['id_nivel_instruccion']}\">";
      echo $dato['nombre_nivel_instruccion'];
      echo "</option>";
    }
  };
  
  
  })();