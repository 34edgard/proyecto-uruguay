<?php

namespace App\DatosMedicos;
use Liki\Database\Tabla;

class Discapacidad extends Tabla{
  public function __construct(){
    parent::__construct('discapacidad');
  }
} 