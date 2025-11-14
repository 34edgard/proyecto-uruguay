<?php

namespace App\Plantel;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class PeriodoEscolar extends Tabla{
  public function __construct(){
    parent::__construct('periodo_escolar');
  }
 
}

