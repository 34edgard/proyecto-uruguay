<?php
(function (){
  
  global $consultar_usuario;
  $consultar_usuario = function () {
    session_start();
    $datos = [
      "campos" => ["cedula", "nombres", "apellidos", "id_correo", "estado"],
    ];

    if ($_SESSION["rol"] == 2) {
      $datos["where"] = $_SESSION["ci"];
    }

    $usuarios = new Personal_Administrativo;
    $lista_usuarios = $usuarios->consultar_datos($datos);
$resul ='';
    foreach ($lista_usuarios as $usuario) {
      if ($usuario["estado"] == "activo") {
        $usuarioEstado = "desactivo";
        $estado = "success";
      } else {
        $usuarioEstado = "activo";

        $estado = "secondary";
      }

      $cedula_codificada = urlencode($usuario["cedula"]);
      $url_hx_get = "/Gestion_Usuario?cambiarEstadoUsuario&ci={$cedula_codificada}";
      
      $resul .=
        "<tr >
          <td>{$usuario["cedula"]}</td>
          <td>{$usuario["nombres"]}</td>
          <td>{$usuario["apellidos"]}</td>
          <td>" .
        (new correo())->consultarDato([
          "campos" => ["id_correo", "email"],
          "where"=>[
            ["campo"=>'id_correo',"operador"=>'=',"valor"=>$usuario['id_correo']]
          ]
        
        ])[0]["email"] .
        "</td>
          <td
          id='estado{$usuario["cedula"]}'
          ><button class='btn btn-{$estado}' 
          
          
          hx-get='".$url_hx_get."'
         hx-target='#estado{$usuario["cedula"]}'
          hx-trigger='click'
          >{$usuario["estado"]}</button></td>
      <td><button class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#firefoxModal'
      name=\"formularioEdicion\"
      value=\"{$usuario["cedula"]}\"
      hx-get=\"/Gestion_Usuario\"
      hx-trigger=\"click\"
      hx-target=\"#modal-form\"
      >editar</button></td>";

      if ($_SESSION["rol"] == 1) {
        $resul .= "<td><button class='btn btn-danger' 
        data-bs-toggle='modal' data-bs-target='#firefoxModal'
        name=\"confimarEliminacion\"
      value=\"{$usuario["cedula"]}\"
      hx-get=\"/Gestion_Usuario\"
      hx-trigger=\"click\"
      hx-target=\"#modal-form\"
        >eliminar</button></td>";
      }
      $resul .= "</tr>";
    }
    echo $resul;
  };
})();
