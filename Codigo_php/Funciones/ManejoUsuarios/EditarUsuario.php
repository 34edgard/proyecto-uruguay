<?php
(function (){
  
  global $editar_usuario;
  $editar_usuario = function () {
    extract($_POST);
    $usuarios = new Personal_Administrativo();
    $correoUsuario = new correo();
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
  };

  
})();
