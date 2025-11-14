<?php

namespace App\Inscripcion;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Inscripciones extends Tabla{
  public function __construct(){
    parent::__construct('inscripciones');
  }
  
}