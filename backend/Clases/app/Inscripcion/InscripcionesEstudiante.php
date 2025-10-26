<?php

namespace App\Inscripcion;
use Liki\Database\Tabla;

class InscripcionesEstudiante extends Tabla{
  public function __construct(){
    parent::__construct('inscripciones_estudiante');
  }
  
}
