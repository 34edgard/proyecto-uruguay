<?php
use App\Controladores\Plantel\Secciones;
use Liki\Plantillas\Flow;
use Liki\Database\FlowDB;

return new class {
  public static function run() {
$niveles = FlowDB::conf('Secciones')
 ->campos(['id_seccion','nombre_seccion'])
   ->get();
    
    $datos["niveles"] = $niveles;
    //print_r($datos);
Flow::html('plantel/tablaSecciones',$datos);
  }
};