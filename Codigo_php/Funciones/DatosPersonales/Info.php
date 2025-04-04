<?php
(function (){
  global $optenerSexos ;
 
 $optenerSexos = function(){
  $datos = ['masculino', 'femenino'];
   foreach ($datos as $dato){
     echo  "<option value='$dato'> ".$dato."</option>";
   }
   echo $campo;
  };
  
  })();