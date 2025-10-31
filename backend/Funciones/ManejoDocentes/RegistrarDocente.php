<?php

namespace Funciones\ManejoDocentes;
use Liki\Plantillas\Plantilla;
use App\Personas\Docente;





class RegistrarDocente{
  public static function registrarDocente() {
   $extras = func_get_args();
    extract( $extras[0]);
    $DOCENTE = new Docente();
  /*  $id_telefono = $extras[1][0]($telefono);*/
    
    $DOCENTE->registrar([
      "campos" => ["cedula", "nombres", "apellidos", "fecha_nacimiento"],
      "valores" => [
        $cedula,
        $nombre,
        $apellido,
        $fecha_nacimiento
      ]
    ]);
    $id_docente = (new Docente)->consultar(['campos'=>['cedula','id_docente'],
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',"valor"=>$cedula     ]
      ]
    ])[0]['id_docente'];
    
  $extras[1][0]($telefono,$formulario,$tipo_telefono,$id_docente);
  Plantilla::HTML('MensajeExito',["mensajeExito"=>'el docente se a creado correctamente']);
  }
}
