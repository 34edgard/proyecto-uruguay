<?php

namespace App\DatosMedicos;
use Liki\Database\Tabla;

class CondicionMedica extends Tabla{
  public function __construct(){
    parent::__construct('condicion_medica');
  }
}