<?php

namespace App\DatosMedicos;
use Liki\Database\Tabla;

class CondicionMedicaEstudiante extends Tabla{
  public function __construct(){
    parent::__construct('condicion_medica_estudiante');
  }
}