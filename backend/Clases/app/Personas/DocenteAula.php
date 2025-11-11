<?php

namespace App\Personas;
use Liki\Database\Tabla;


class DocenteAula extends Tabla{
  public function __construct(){
    parent::__construct('docente_aula');
  }
}

