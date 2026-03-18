<?php

use App\Controladores\Personas\Docente;
use App\Controladores\DatosExtra\Telefono;
use Liki\Database\FlowDB;

return new class {
  public static function run($p,$f){
    
    extract( $p);
    $id_docente = FlowDB::conf('Docente')
    ->campos(['cedula','id_docente'])
    ->get(['cedula'=>$eliminar])[0]['id_docente'];
   // print_r($id_docente);
    
   FlowDB::conf('Telefono')
->delete(['id_docente'=>$id_docente]);
    
  FlowDB::conf('Docente')
->delete(['cedula'=>$eliminar]);
    
    $f[0]();
  }
};
