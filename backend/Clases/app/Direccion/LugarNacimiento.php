<?php


namespace App\Direccion;
use Liki\Database\Tabla;



class LugarNacimiento extends Tabla{
  public function __construct(){
    parent::__construct('lugar_nacimiento');
  }
}