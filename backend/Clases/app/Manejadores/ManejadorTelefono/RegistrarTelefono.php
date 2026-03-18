<?php
use Liki\Database\FlowDB;
use App\Controladores\DatosExtra\Telefono;

return new class {

public static function run($p){
extract($p);
  FlowDB::conf('Telefono')
->campos(['tipo_telefono', 'numero_telefono',$Propietario])
->post([$tipo,$numero,$id_Propietario]);
 

}
  
};