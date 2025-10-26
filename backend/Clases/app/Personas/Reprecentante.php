<?php

namespace App\Personas;
use Liki\Database\Tabla;


class Reprecentante extends Tabla{
  public function __construct(){
    parent::__construct('representantes');
  }
}

