<?php
use Liki\Plantillas\Flow;
use Liki\Database\FlowDB;
use App\Controladores\Personas\Docente;
use App\Controladores\Personas\DocenteAula;




return new class {
  public static function run($p,$f) {
   
    extract( $p);
    FlowDB::conf('Docente')
    ->campos(["cedula", "nombres", "apellidos", "fecha_nacimiento"])
    ->post([ $cedula,$nombre, $apellido,$fecha_nacimiento]);
    
    $id_docente = FlowDB::conf('Docente')
    ->campos(['cedula','id_docente'])
    ->get(['cedula'=>$cedula])[0]['id_docente'];
    
    
    
  FlowDB::conf('DocenteAula')
->campos(['id_docente','id_aula'])
->post([$id_docente,$id_aula] );

  $f[0]($telefono,$formulario,$tipo_telefono,$id_docente);
  Flow::html('MensajeExito',["mensajeExito"=>'el docente se a creado correctamente']);
  }
};
