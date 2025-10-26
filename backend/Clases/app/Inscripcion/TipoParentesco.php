<?php

namespace App\Inscripcion;
use Liki\Database\Tabla;

class TipoParentesco extends Tabla{
  
  public function __construct(){
    parent::__construct('tipo_parentesco');
  }
}
