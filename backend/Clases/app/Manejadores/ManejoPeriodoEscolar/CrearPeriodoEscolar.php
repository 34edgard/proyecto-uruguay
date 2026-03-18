<?php

use Liki\Database\FlowDB;
use App\Controladores\Plantel\PeriodoEscolar;
use Funciones\Edad;


return new class {
  public static function run($p,$f) {
    
    extract($p);
     //  print_r(Edad::Fecha($inicio_periodo));
       $anioInicio = Edad::Fecha($inicio_periodo)[0];
       $anioFin = Edad::Fecha($fin_periodo)[0];
    

     $periodo = strval($anioInicio)."-". strval($anioFin);
    FlowDB::conf('PeriodoEscolar')
    ->campos(['periodo'])
    ->post([$periodo]);

//print_r($extras);
    $f[0]();
  }
};