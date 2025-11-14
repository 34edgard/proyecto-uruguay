<?php

namespace App\Inscripcion;
use Liki\Database\Tabla;
use Liki\ExecFunc;


class TipoParentesco extends Tabla{
  
  public function __construct(){
    parent::__construct('tipo_parentesco');
  }
}
