<?php

namespace App\Controladores\Plantel;
use Liki\Modelo;
use Liki\DelegateFunction;


class FechaInscripcion extends Modelo{
  public function __construct(){
    parent::__construct('inscripciones_estudiante');
  }
 
}
