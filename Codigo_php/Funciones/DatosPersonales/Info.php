<?php
(function (){
  global $optenerSexos ;
  $optenerSexos = function (){
    $con = new ConsultasBD;
    $sql = "SELECT * FROM `sexo`";
   $datos =  $con->consultarRegistro2($sql);
   $campo = '';
   foreach ($datos as $dato){
   $value = $dato['id_sexo'];
   $nombre = $dato['nombre_sexo'];
     $campo .="<option value='$value'>
     $nombre
     </option>";
     
   }
   echo $campo;
  };
  
  })();