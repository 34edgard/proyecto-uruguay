<?php

namespace App\DatosMedicos;
use Liki\Database\Tabla;


class EstadoNutricionalEstudiante extends Tabla{
  public function __construct(){
    parent::__construct('estado_nutricional_estudiante');
  }
}
