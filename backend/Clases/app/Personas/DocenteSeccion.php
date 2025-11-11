<?php

namespace App\Personas;
use Liki\Database\Tabla;


class DocenteSeccion extends Tabla{
  public function __construct(){
    parent::__construct('docente_seccion');
  }
}

