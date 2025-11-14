<?php

namespace App\Personas;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Docente extends Tabla{
  public function __construct(){
    parent::__construct('docente');
  }
  public static function consultarDocente(){
    ExecFunc::exec('ManejoDocentes/ConsultarDocente');
  }
}

