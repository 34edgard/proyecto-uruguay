<?php

namespace App\Personas;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class DocenteAula extends Tabla{
  public function __construct(){
    parent::__construct('docente_aula');
  }
}

