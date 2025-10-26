<?php
namespace App\Direccion;
use Liki\Database\Tabla;


class Parroquia extends Tabla{
  public function __construct(){
    parent::__construct('parroquia');
  }
}