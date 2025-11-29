<?php

namespace App\Administracion;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Incidentes extends Tabla{
  
  public function __construct(){
    parent::__construct('incidentes');
  }
  
}