<?php
namespace App\DatosExtra;

use Liki\Database\Tabla;

class Tallas extends Tabla{
  public function __construct(){
    parent::__construct('tallas');
  }
}