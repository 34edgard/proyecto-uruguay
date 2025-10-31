<?php
namespace Funciones\ManejoDocentes;
use App\Personas\Docente;

class EditarDocente{

  public static function editarDocente(){
    $EXTRAS = func_get_args();
   extract($EXTRAS[0]);
    (new Docente)->editar([
      "campos"=>['cedula','nombres','apellidos','fecha_nacimiento'],
      "valores"=>[$cedula,$nombre,$apellido,$fecha_nacimiento], 
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',"valor"=>$cedula]
      ]
      
      ]);
    $EXTRAS[1][0]();
  }
}
