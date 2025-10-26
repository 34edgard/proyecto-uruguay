<?php
namespace App\Direccion;
use Liki\Database\Tabla;

class Pais extends Tabla{
  public function __construct(){
    parent::__construct('pais');
  }
}