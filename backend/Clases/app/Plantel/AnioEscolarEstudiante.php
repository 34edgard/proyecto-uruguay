<?php

namespace App\Plantel;
use Liki\Database\Tabla;
use Liki\ExecFunc;


class AnioEscolarEstudiante extends Tabla{
  public function __construct(){
    parent::__construct('anio_escolar_estudiante');
  }
 
}
