<?php
(function (){
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
})();