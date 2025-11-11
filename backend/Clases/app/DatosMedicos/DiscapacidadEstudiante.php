<?php

namespace App\DatosMedicos;
use Liki\Database\Tabla;

class DiscapacidadEstudiante extends Tabla{
  public function __construct(){
    parent::__construct('discapacidad_estudiante');
  }
} 