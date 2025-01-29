<?php
(function (){
  global $optenerSexos ;
  $optenerSexos = function (){
    $con = new ConsultasBD;
    $sql = "SELECT * FROM `sexo`";
   $datos =  $con->consultarRegistro2($sql);
   foreach ($datos as $dato){
     echo "<option value='{$dato['id_sexo']}'>
     {$dato['nombre_sexo']}
     </option>";
   }
  };
  
  })();