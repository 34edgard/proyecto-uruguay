<?php

namespace App;
use Liki\Database\Tabla;

class Telefono extends Tabla{
  public function __construct(){
    parent::__construct('telefonos');
  }
  
}
