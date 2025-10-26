<?php

namespace App;
use Liki\Database\Tabla;


class Docente extends Tabla{
  public function __construct(){
    parent::__construct('docente');
  }
}

