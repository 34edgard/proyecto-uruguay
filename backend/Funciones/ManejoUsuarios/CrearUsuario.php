<?php

namespace Funciones\ManejoUsuarios;
use App\Correo;
use App\Personas\Usuario;
use Liki\Plantillas\Plantilla;


class CrearUsuario{
  

  public static function crear_usuario() {
    
    $Extras = func_get_args();
    extract($Extras[0]);
    (new Correo())->registrar([
      "campos" => ["email"],
      "valores" => [$correo],
    ]);
    $id_correo = (new Correo())->consultarId(["campos" => ["id_correo"]])[0][
      "id_correo"
    ];
    $usuarios = new Personal_Administrativo();
    $contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);
    $usuarios->registrar([
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
   // $extras=func_get_args();
    
    
    Plantilla::HTML('componentes/h1',[
        "contenido"=>'el usuario fue creado correctamente'
    ]);
    
    Plantilla::HTML('componentes/htmx',[
        "hx"=>['trigger'=>'load',"target"=>'#usuarios',"url"=>'/usuario/list']
    ]);
    
    
   // $extras[1][0]();
  //  scriptAlert('');
    
  }
}