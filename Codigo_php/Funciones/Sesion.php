<?php
(function () {
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
  global $validar_datosDB;
  $validar_datosDB = function ($cedula, $contraseña) {
    $PA = new Personal_Administrativo();
    $arreglo = $PA->consultar_datos([
      "campos" => ["cedula", "contrasena", "id_rol", "nombres"],
      "valor" => $cedula
    ]);
  //  print_r($arreglo);
    //return ;
    //if($contraseña == $arreglo[0][1]){
 //   print_r($arreglo);
    if (!isset($arreglo[0]['cedula'])) {
      echo json_encode([
        "error" => true,
        "data" =>
          '<h2 class="text-center text-danger">el usuario no existe </h2>',
      ]);
      return [false, $arreglo];
    }
    if (
      password_verify($contraseña, $arreglo[0]['contrasena']) ||
      $contraseña == $arreglo[0]['contrasena']
    ) {
      //
      echo json_encode(["error" => false, "data" => ""]);
      return [true, $arreglo];
    }
    echo json_encode([
      "error" => true,
      "data" =>
        '<h2 class="text-center text-danger">el usuario o la contraseña son incorrectos</h2>',
    ]);
    return [false];
  };
  global $cerrar_sesion;
  $cerrar_sesion = function () {
    session_start();
    session_unset();
    session_destroy();
  };
})();
