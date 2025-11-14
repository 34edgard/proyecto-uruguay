<?php

namespace App\DatosExtra;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class NivelInstruccion extends Tabla{
  public function __construct(){
    parent::__construct('nivel_instruccion');
  }
}
