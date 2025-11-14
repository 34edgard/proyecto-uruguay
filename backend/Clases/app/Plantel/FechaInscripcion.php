<?php

namespace App\Plantel;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class FechaInscripcion extends Tabla{
  public function __construct(){
    parent::__construct('inscripciones_estudiante');
  }
 
}
