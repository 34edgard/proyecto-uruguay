<?php

use Liki\Plantillas\Flow;
use Liki\Database\FlowDB;
use App\Controladores\Personas\Docente;
use App\Controladores\DatosExtra\Telefono;
use App\Controladores\Personas\DocenteAula;
use App\Controladores\Plantel\Aulas;
return new  class {
  
  public static function run(){
   
    $res = FlowDB::conf('Docente')->campos(["id_docente","cedula", "nombres", "apellidos", "fecha_nacimiento"])
    ->get();
   
   $i=0;
    foreach ($res as $user) {
      $i++;
      $numero_telefono = Telefono::NumeroTelefono($user['id_docente']);
    

    

$nombre = FlowDB::conf('DocenteAula')
->Join('INNER', 'aulas', 'aulas.id_aula = docente_aula.id_aula ')
//->campos(['aulas.nombre_aula')
->get(['id_docente'=>$user['id_docente']]);
   
    $aula_asignada = $nombre[0]['nombre_aula'] ?? 'ningina';
   // print_r($nombre);
    
    
$aula_asignada = $aula_asignada ?? "ningina";
$user['i'] = $i;
$user['numero_telefono'] = $numero_telefono;
$user['aula_asignada'] = $aula_asignada;
Flow::html("Docente/tabla",$user);

      
    }
  }
};
