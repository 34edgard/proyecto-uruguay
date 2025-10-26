<?php

namespace App;
use Liki\Database\Tabla;

class Correo extends Tabla{
  
  public function __construct(){
    parent::__construct('correo');
  }
  
}