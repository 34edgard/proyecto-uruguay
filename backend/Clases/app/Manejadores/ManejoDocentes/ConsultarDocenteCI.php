<?php

use Liki\Plantillas\Flow;
use Liki\Database\FlowDB;
use App\Controladores\Personas\Docente;
use App\Controladores\DatosExtra\Telefono;

return new class {
  public static function run($p) {
    
    
    extract($p);
    $res = FlowDB::conf('Docente')
    ->campos(["cedula","id_docente", "nombres", "apellidos", "fecha_nacimiento"])
    ->get(['cedula'=>['LIKE',$ci.'%'] ]);
   
   $i=0;
    foreach ($res as $user) {
      $i++;
      $numero_telefono= FlowDB::conf('Telefono')
    ->campos(["id_docente","numero_telefono"])
    ->get(['id_docente'=>$user['id_docente'] ])[0]["numero_telefono"]; 
    
    
    
    
    $aula_asignada = "ningina";
    $user['i'] = $i;
    $user['numero_telefono'] = $numero_telefono;
    $user['aula_asignada'] = $aula_asignada;
    Flow::html("Docente/tabla",$user);
    
    
    }
  }
};
