<?php

namespace App\Personas;
use Liki\Database\Tabla;

class Estudiante extends Tabla{
  public function __construct(){
    parent::__construct('estudiante');
  }
}

