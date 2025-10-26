<?php

namespace App\Inscripcion;
use Liki\Database\Tabla;

class DocumentosInscripcion extends Tabla{
  public function __construct(){
    parent::__construct('documentos_inscripcion');
  }                      
  
}
