<?php
(function () {
  global $consultar_usuario_ci;
  $consultar_usuario_ci = function () {
    $datos = [
      "campos" => ["cedula", "nombres", "apellidos", "id_correo", "estado"],
      "valor" => $_GET["ci"],
    ];

    $usuarios = new Personal_Administrativo();
    $lista_usuarios = $usuarios->consultar_datos($datos);
foreach ($lista_usuarios as $usuario) {
      if ($usuario["estado"] == "activo") {
        $usuarioEstado = "desactivo";
        $estado = "success";
      } else {
        $usuarioEstado = "activo";

        $estado = "secondary";
      }

      $cedula_codificada = urlencode($usuario["cedula"]);
      $url_hx_get = "/Codigo_php/Modulos/Gestion_Usuario.php?cambiarEstadoUsuario&ci={$cedula_codificada}";
      
      $resul .=
        "<tr id='usu{$usuario["cedula"]}'>
          <td>{$usuario["cedula"]}</td>
          <td>{$usuario["nombres"]}</td>
          <td>{$usuario["apellidos"]}</td>
          <td>" .
        (new correo())->consultarDato([
          "campos" => ["id_correo", "email"],
          "valor" => $usuario["id_correo"],
        ])[0]["email"] .
        "</td>
          <td><button class='btn btn-{$estado}' 
          hx-target='#usuario{$usuario["cedula"]}'
          hx-get='".$url_hx_get."'
         hx-swap='outerHTML'
          hx-trigger='click'
          >{$usuario["estado"]}</button></td>
      <td><button class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#firefoxModal' onclick='insertarDatosUsuario({$usuario["cedula"]})'>editar</button></td>";

      if ($_SESSION["rol"] == 1) {
        $resul .= "<td><button class='btn btn-danger' onclick='eliminarUsuario({$usuario["cedula"]})'>eliminar</button></td>";
      }
      $resul .= "</tr>";
    }
    echo $resul;
    
  };

  global $consultar_usuario;
  $consultar_usuario = function () {
    session_start();
    $datos = [
      "campos" => ["cedula", "nombres", "apellidos", "id_correo", "estado"],
    ];

    if ($_SESSION["rol"] == 2) {
      $datos[] = ["valor" => $_SESSION["ci"]];
    }

    $usuarios = new Personal_Administrativo();
    $lista_usuarios = $usuarios->consultar_datos($datos);

    foreach ($lista_usuarios as $usuario) {
      if ($usuario["estado"] == "activo") {
        $usuarioEstado = "desactivo";
        $estado = "success";
      } else {
        $usuarioEstado = "activo";

        $estado = "secondary";
      }

      $cedula_codificada = urlencode($usuario["cedula"]);
      $url_hx_get = "/Codigo_php/Modulos/Gestion_Usuario.php?cambiarEstadoUsuario&ci={$cedula_codificada}";
      
      $resul .=
        "<tr >
          <td>{$usuario["cedula"]}</td>
          <td>{$usuario["nombres"]}</td>
          <td>{$usuario["apellidos"]}</td>
          <td>" .
        (new correo())->consultarDato([
          "campos" => ["id_correo", "email"],
          "valor" => $usuario["id_correo"],
        ])[0]["email"] .
        "</td>
          <td
          id='estado{$usuario["cedula"]}'
          ><button class='btn btn-{$estado}' 
          
          
          hx-get='".$url_hx_get."'
         hx-target='#estado{$usuario["cedula"]}'
          hx-trigger='click'
          >{$usuario["estado"]}</button></td>
      <td><button class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#firefoxModal' onclick='insertarDatosUsuario({$usuario["cedula"]})'>editar</button></td>";

      if ($_SESSION["rol"] == 1) {
        $resul .= "<td><button class='btn btn-danger' onclick='eliminarUsuario({$usuario["cedula"]})'>eliminar</button></td>";
      }
      $resul .= "</tr>";
    }
    echo $resul;
  };

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
  };

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

  global $eliminar_usuario;
  $eliminar_usuario = function () {
    extract($_GET);
    $usuarios = new Personal_Administrativo();

    $usuarios->eliminar_datos(["campos" => ["cedula"], "valor" => $ci]);
  };

  global $cambiarEstado;
  $cambiarEstado = function () {
    extract($_GET);

    $datos = ["campos" => ["cedula", "estado"], "valor" => $ci];

    $usuarios = new Personal_Administrativo();
    $estadoActual = $usuarios->consultar_datos($datos);
    if ($estadoActual[0]["estado"] == "activo") {
      $estado = "inactivo";
      $estilo = "secondary";
    } else {
      $estado = "activo";
      $estilo = "success";
    }

    $datos["valores"] = [$ci, $estado];
    $usuarios->editar_datos($datos);



   echo "<button class='btn btn-{$estilo}' 
   hx-target='#estado{$estadoActual[0]["cedula"]}'
         hx-get='/Codigo_php/Modulos/Gestion_Usuario.php?cambiarEstadoUsuario&ci={$estadoActual[0]["cedula"]}'          hx-trigger='click'          >{$estado}</button>";
  };
})();
