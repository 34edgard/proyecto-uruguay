<?php

namespace App\DatosExtra;
use Liki\Database\Tabla;

class Ocupacion extends Tabla{
  public function __construct(){
    parent::__construct('ocupacion');
  }
  
}