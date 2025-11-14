<?php
namespace App\DatosExtra;
use Liki\Database\Tabla;
use Liki\ExecFunc;


class Tallas extends Tabla{
  public function __construct(){
    parent::__construct('tallas');
  }
}