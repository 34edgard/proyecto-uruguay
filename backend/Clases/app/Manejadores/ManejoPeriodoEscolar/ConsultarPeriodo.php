<?php

use App\Controladores\Plantel\PeriodoEscolar;
use Liki\Plantillas\Flow;
use Liki\Database\FlowDB;



return new class {
  public static function run($p) {
    
    extract($p);
 $periodos   = FlowDB::conf('PeriodoEscolar')
->campos(['id_periodo_escolar','periodo'])
->get();

    
      foreach ($periodos as $key => $dato) {
        
        Flow::html("componentes/option",[
            "value"=>$dato['id_periodo_escolar'],
            "contenido"=>$dato['periodo']
        ]);
        
      }
  
    
  }
};