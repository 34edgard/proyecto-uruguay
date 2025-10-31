<?php
 namespace Funciones\ManejoUsuarios;
use App\Personas\Usuario;

class EliminarUsuario{
  
  
  public static function eliminar_usuario() {
    $extras = func_get_args();
    extract( $extras[0]);
  //  print_r($_GET);
    $usuarios = new Usuario();

    $usuarios->eliminar(["campos" => ["cedula"], 
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',
      "valor" => $ci]
      ]
    ]);
   $extras[1][0]();
  }
}
