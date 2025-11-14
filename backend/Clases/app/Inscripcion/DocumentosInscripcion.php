<?php

namespace App\Inscripcion;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class DocumentosInscripcion extends Tabla{
  public function __construct(){
    parent::__construct('documentos_inscripcion');
  }                      
  
}
