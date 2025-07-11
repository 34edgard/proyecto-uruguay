<?php
(function (){
  global $consultar_usuario_ci;
  $consultar_usuario_ci = function () {
    session_start();
    extract($_GET);
    $datos = [
      "campos" => ["cedula", "nombres", "apellidos", "id_correo", "estado"],
    ];

    if ($_SESSION["rol"] == 2) {
      $datos["valor"] = $_SESSION["ci"];
    }

    $usuarios = new Personal_Administrativo();
    $lista_usuarios = $usuarios->consultar($datos);

    foreach ($lista_usuarios as $usuario) {
      
  plantilla("usuario/lista-usuarios",$usuario);
    }
  };
})();
