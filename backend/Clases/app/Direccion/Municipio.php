<?php
namespace App\Direccion;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Municipio extends Tabla{
  public function __construct(){
    parent::__construct('municipio');
  }
}