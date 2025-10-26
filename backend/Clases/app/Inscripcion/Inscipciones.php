<?php

namespace App\Inscripcion;
use Liki\Database\Tabla;

class Inscripciones extends Tabla{
  public function __construct(){
    parent::__construct('inscripciones');
  }
  
}