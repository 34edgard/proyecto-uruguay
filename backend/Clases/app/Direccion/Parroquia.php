<?php
namespace App\Direccion;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Parroquia extends Tabla{
  public function __construct(){
    parent::__construct('parroquia');
  }
}