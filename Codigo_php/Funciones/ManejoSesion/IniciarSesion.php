<?php
(function (){
  
  global $iniciar_sesion;
  $iniciar_sesion = function () {
    $extras = func_get_args();
    extract($_POST);
    // var_dump($extras);
    session_start();
    $arreglo = $extras[1][0]($cedula, $contraseña);
    //return;
    if ($arreglo[0]) {
      $_SESSION["ci"] = $arreglo[1][0]['cedula'];
      $_SESSION["contraseña"] = $arreglo[1][0]['contrasena'];
      $_SESSION["rol"] = $arreglo[1][0]['id_rol'];
      $_SESSION["nombre"] = $arreglo[1][0]['nombres'];
    }
  };
  })();