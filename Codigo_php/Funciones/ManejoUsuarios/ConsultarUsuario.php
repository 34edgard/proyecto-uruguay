<?php
(function (){
  
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
})();