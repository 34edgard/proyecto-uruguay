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
      $_SESSION["ci"] = $arreglo[1][0][0];
      $_SESSION["contraseña"] = $arreglo[1][0][1];
      $_SESSION["rol"] = $arreglo[1][0][2];
      $_SESSION["nombre"] = $arreglo[1][0][3];
    }
  };
  global $validar_datosDB;
  $validar_datosDB = function ($cedula, $contraseña) {
    $PA = new Personal_Administrativo();
    $arreglo = $PA->consultar_datos([
      "campos" => ["ci", "contrasena", "id_rol", "nombre"],
      "valor" => $cedula,
      "longitud" => 6,
    ]);
    //print_r($arreglo);
    //return ;
    //if($contraseña == $arreglo[0][1]){
    if (!isset($arreglo[0][0])) {
      echo json_encode([
        "error" => true,
        "data" =>
          '<h2 class="text-center text-danger">el usuario no existe </h2>',
      ]);
      return [true, $arreglo];
    }
    if (
      password_verify($contraseña, $arreglo[0][1]) ||
      $contraseña == $arreglo[0][1]
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
