<?php
namespace App;
use Liki\Database\Tabla;
class Rol extends Tabla{
  
  public function __construct(){
    parent::__construct('roles');
  }
  
}


