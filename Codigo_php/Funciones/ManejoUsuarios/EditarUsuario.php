<?php
(function (){
  
  global $editar_usuario;
  $editar_usuario = function () {
    extract($_POST);
    $usuarios = new Personal_Administrativo();
    if ($contraseña != "") {
      $contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);
      $usuarios->editar_datos([
        "campos" => ["cedula", "nombres", "apellidos", "id_rol", "contrasena"],
        "valores" => [$ci, $nombre, $apellido, $rol, $contraseña_hash],
        "valor" => $ci,
      ]);
    } else {
      $usuarios->editar_datos([
        "campos" => ["cedula", "nombres", "apellidos", "id_rol"],
        "valores" => [$ci, $nombre, $apellido, $rol],
        "valor" => $ci,
      ]);
    }
  };

  
})();