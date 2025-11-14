<?php

namespace App\DatosMedicos;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class EstadoNutricional extends Tabla{
  public function __construct(){
    parent::__construct('estado_nutricional');
  }
}
