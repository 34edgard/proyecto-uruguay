<?php

namespace Funciones\ManejoUsuarios;
use App\Personas\Usuario;
use App\DatosExtra\Correo;


class EditarUsuario{
  public static function editar_usuario() {
    $Extras = func_get_args();
    extract($Extras[0]);
    $usuarios = new Personal_Administrativo();
    $correoUsuario = new Correo();
$datosActuales = [
  "campos" => ["cedula", "nombres", "apellidos", "id_rol","usuario"],
  "valores" => [$ci, $nombre, $apellido, $rol, $nombre_usuario],
  "where"=>[
    ["campo"=>'cedula',"operador"=>'=', "valor" => $ci]
  ]
];

$id_correo = $usuarios->consultar([
    "campos"=>['id_correo'],
       "where"=>[
           ["campo"=>'cedula',"operador"=>'=',"valor"=>$ci]
       ]
])[0]['id_correo'];

$nuevoCorreo = [
    "campos"=>['email'],
    "valores"=>[$correo],
    "where"=>[
        ["campo"=>'id_correo',"operador"=>'=',"valor"=>$id_correo]
    ]
];
 if ($contraseña != "") {
      $contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);
    $datosActuales["campos"][] = "contrasena";
    $datosActuales["valores"][] = $contraseña_hash;
    } 
    
    $usuarios->editar($datosActuales);
    $correoUsuario->editar($nuevoCorreo);
    
  
    $extras = func_get_args();

    $extras[1][0]();
  }

  
}
