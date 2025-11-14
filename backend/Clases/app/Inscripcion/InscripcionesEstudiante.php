<?php

namespace App\Inscripcion;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class InscripcionesEstudiante extends Tabla{
  public function __construct(){
    parent::__construct('inscripciones_estudiante');
  }
  
}
