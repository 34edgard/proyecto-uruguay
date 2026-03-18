<?php

use App\Controladores\DatosExtra\Telefono;
use Liki\Database\FlowDB;
return new class {

public static function run($id_docente){
return  FlowDB::conf('Telefono')
->campos(["id_docente","numero_telefono"])
->get(['id_docente'=>$id_docente])[0]["numero_telefono"]; 
}
};