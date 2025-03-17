<?php
(function (){
  
global $crear_usuario;
  $crear_usuario = function () {
    extract($_POST);
    (new correo())->registrarDato([
      "campos" => ["email"],
      "valores" => [$correo],
    ]);
    $id_correo = (new correo())->consultarId(["campos" => ["id_correo"]])[0][
      "id_correo"
    ];
    $usuarios = new Personal_Administrativo();
    $contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);
    $usuarios->registrar_datos([
      "campos" => [
        "cedula",
        "nombres",
        "apellidos",
        "usuario",
        "id_rol",
        "id_correo",
        "contrasena",
      ],
      "valores" => [
        $cedula,
        $nombre,
        $apellido,
        $usuario,
        $rol,
        $id_correo,
        $contraseña_hash,
      ],
    ]);
    $extras=func_get_args();
    $extras[1][0]();
    echo "<script >alert('el usuario fue creado correctamente')</script>";
  };
})();