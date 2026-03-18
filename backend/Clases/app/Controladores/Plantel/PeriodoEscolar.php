<?php

namespace App\Controladores\Plantel;
use Liki\Modelo;
use Liki\DelegateFunction;


class PeriodoEscolar extends Modelo{
  public function __construct(){
    parent::__construct('periodo_escolar');
  }
  public static function crearPeriodoEscolar($p,$f){
      DelegateFunction::exec('ManejoPeriodoEscolar/CrearPeriodoEscolar',$p,$f);
  }
  public static function consultarPeriodo($p){
      DelegateFunction::exec('ManejoPeriodoEscolar/ConsultarPeriodo',$p);
  }
  public static function consultarPeriodoEscolar(){
      DelegateFunction::exec('ManejoPeriodoEscolar/ConsultarPeriodoEscolar');
  }
 
}

