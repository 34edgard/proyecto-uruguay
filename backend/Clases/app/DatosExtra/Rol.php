<?php
namespace App\DatosExtra;
use Liki\Database\Tabla;
class Rol extends Tabla{
  
  public function __construct(){
    parent::__construct('roles');
  }
  
}


