<?php

namespace App\Personas;
use Liki\Database\Tabla;


class DocenteNivel extends Tabla{
  public function __construct(){
    parent::__construct('docente_nivel');
  }
}

