<?php
namespace App\Direccion;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Estado extends Tabla{
  public function __construct(){
    parent::__construct('estado');
  }
}