<?php

namespace App\Admini;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Archivos extends Tabla{
  
  public function __construct(){
    parent::__construct('archivos');
  }
  
}