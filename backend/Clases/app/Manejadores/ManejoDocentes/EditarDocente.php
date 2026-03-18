<?php
use App\Controladores\Personas\Docente;
use Liki\Database\FlowDB;
return new class {

  public static function run($p,$f){
    
   extract($p);
    FlowDB::conf('Docente')
    ->campos(['cedula','nombres','apellidos','fecha_nacimiento'])
   ->valores([$cedula,$nombre,$apellido,$fecha_nacimiento])
      ->put(['cedula'=>$cedula]);
 $id_docente = FlowDB::conf('Docente')
  ->campos(['id_docente'])
    ->get(['cedula'=>$cedula]);
 
$id_docente = $id_docente[0]['id_docente'];
   FlowDB::conf('DocenteAula')
    ->campos(['id_aula'])
   ->valores([$id_aula])
      ->put(['id_docente'=>$id_docente]);
   

    
    
    $f[0]();
  }
};
