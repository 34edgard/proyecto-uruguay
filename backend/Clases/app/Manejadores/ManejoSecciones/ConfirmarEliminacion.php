<?php
use Liki\Plantillas\Flow;
use Liki\Database\FlowDB;
use App\Controladores\Plantel\Secciones;

return new class {
    public static function run($p){
        extract($p);
        //print_r($p);
     $nombre_seccion = FlowDB::conf('Secciones')->campos(['nombre_seccion'])->get(['id_seccion'=>$ConfirmarEliminacion]);
        
        $datos['nombre'] = $nombre_seccion[0]['nombre_seccion'];
        $datos['ConfirmarEliminacion'] = $ConfirmarEliminacion;
       // print_r($datos);
        Flow::html('plantel/ConfirmarEliminacionSeccion',$datos);
    }
}; 