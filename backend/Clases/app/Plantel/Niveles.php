<?php

namespace App\Plantel;
use Liki\Database\Tabla;

class Niveles extends Tabla{
  public function __construct(){
     parent::__construct('nivel');
   }
  
}
