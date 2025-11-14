<?php

namespace App\Personas;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Reprecentante extends Tabla{
  public function __construct(){
    parent::__construct('representantes');
  }
}

