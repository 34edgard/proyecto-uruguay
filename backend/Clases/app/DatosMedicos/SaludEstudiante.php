<?php

namespace App\DatosMedicos;
use Liki\Database\Tabla;

class SaludEstudiante extends Tabla{
  public function __construct(){
    parent::__construct('salud_estudiante');
  }
}