<?php
namespace Funciones\ManejoUsuarios;
use App\Personas\Personal_Administrativo;
use Liki\Plantillas\Plantilla;


class ConsultarUsuarioCI{
  public static function consultar_usuario_ci() {
    session_start();
    $Extras = func_get_args();
    extract($Extras[0]);
    $datos = [
      "campos" => ["cedula", "nombres", "apellidos", "id_correo", "estado"],
    ];

    if ($_SESSION["rol"] == 2) {
      $datos["valor"] = $_SESSION["ci"];
    }

    $usuarios = new Personal_Administrativo();
    $lista_usuarios = $usuarios->consultar($datos);

    foreach ($lista_usuarios as $usuario) {
      
  Plantilla::HTML("usuario/lista-usuarios",$usuario);
    }
  }
}
