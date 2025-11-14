<?php


namespace App\Direccion;
use Liki\Database\Tabla;
use Liki\ExecFunc;


class LugarNacimiento extends Tabla{
  public function __construct(){
    parent::__construct('lugar_nacimiento');
  }
}