<?php

namespace App\DatosMedicos;
use Liki\Database\Tabla;

class Tratamiento extends Tabla{
  public function __construct(){
    parent::__construct('tratamiento');
  }
}