<?php
(function (){
  global $generarCedulaEscolar;
  $generarCedulaEscolar = function (){
    $datos = (new Reprecentante)->consultar_datos([
        "campos"=>["cedula","nombres"],
        "valor"=>$_GET["cedula"]
    ]);
   if (isset($datos[0]["cedula"])) {
    echo "el reprecentante ".$datos[0]["nombres"]." existe ";
   }else{
    echo "el usuario no existe";
   }
  };
  })();