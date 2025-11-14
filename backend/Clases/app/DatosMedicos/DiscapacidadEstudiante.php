<?php

namespace App\DatosMedicos;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class DiscapacidadEstudiante extends Tabla{
  public function __construct(){
    parent::__construct('discapacidad_estudiante');
  }
} 