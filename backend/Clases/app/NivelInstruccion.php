<?php

namespace App;
use Liki\Database\Tabla;


class NivelInstruccion extends Tabla{
  public function __construct(){
    parent::__construct('nivel_instruccion');
  }
}
