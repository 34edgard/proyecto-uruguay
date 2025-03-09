<?php
(function (){
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
  
  })();