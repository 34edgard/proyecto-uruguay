<?php

namespace App\Administracion;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class ConceptosPago extends Tabla{
  
  public function __construct(){
    parent::__construct('conceptos_pago');
  }
  
}