<?php
use Liki\Plantillas\Flow;
use Liki\Database\FlowDB;
use App\Controladores\Plantel\Aulas;

return new class {
  public static function run($p) {
   extract($p);
 $aulas = FlowDB::conf('Aulas')
 ->campos(['id_aula','nombre_aula'])
 ->get();
    Flow::html('componentes/tabla',['aulas'=>$aulas]);
    }
};