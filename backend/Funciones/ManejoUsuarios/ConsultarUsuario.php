<?php
(function (){
  
  global $consultar_usuario;
  $consultar_usuario = function () {
    session_start();
    $datos = [
      "campos" => ["cedula", "nombres", "apellidos", "id_correo", "estado"],
    ];

    if ($_SESSION["id_rol"] == 2) {
      $datos["where"] = $_SESSION["ci"];
    }

    $usuarios = new Personal_Administrativo;
    $lista_usuarios = $usuarios->consultar($datos);
    foreach ($lista_usuarios as $usuario) {
        //print_r($usuario);
     plantilla("usuario/lista-usuarios",$usuario);
    }
  };
})();
