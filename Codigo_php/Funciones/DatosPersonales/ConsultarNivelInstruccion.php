<?php
(function (){
  global $consultarNivelInstruccion;
  $consultarNivelInstruccion =function (){
    $datos = (new nivel_instruccion)->consultar(["campos"=>['id_nivel_instruccion','nombre_nivel_instruccion']]);
  // print_r($datos);
    foreach ($datos as $dato){
        plantilla("componentes/option",[
            "value"=>$dato['id_nivel_instruccion'],
            "contenido"=>$dato['nombre_nivel_instruccion']
        ]);
      }
    };
  
  
  })();