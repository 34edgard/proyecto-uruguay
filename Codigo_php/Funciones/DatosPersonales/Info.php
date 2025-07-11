<?php
(function (){
  global $optenerSexos ;
 
 $optenerSexos = function(){
  $datos = ['masculino', 'femenino'];
   foreach ($datos as $dato){
    plantilla("componentes/option",[
        "value"=>$dato,
        "contenido"=>$dato
    ]);
    }
   
  };
  
  })();