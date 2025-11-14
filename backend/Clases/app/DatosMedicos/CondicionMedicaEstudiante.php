<?php

namespace App\DatosMedicos;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class CondicionMedicaEstudiante extends Tabla{
  public function __construct(){
    parent::__construct('condicion_medica_estudiante');
  }
}