<?php

namespace App\Inscripcion;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Parentesco extends Tabla{
  public function __construct(){
    parent::__construct('parentesco');
  }
}
