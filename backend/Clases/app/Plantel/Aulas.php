<?php

namespace App\Plantel;
use Liki\Database\Tabla;


class Aulas extends Tabla{
  public function __construct(){
    parent::__construct('aulas');
  }
 
}