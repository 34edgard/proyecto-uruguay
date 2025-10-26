<?php

namespace App\DatosExtra;
use Liki\Database\Tabla;

class Correo extends Tabla{
  
  public function __construct(){
    parent::__construct('correo');
  }
  
}