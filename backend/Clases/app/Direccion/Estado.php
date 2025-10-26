<?php
namespace App\Direccion;
use Liki\Database\Tabla;


class Estado extends Tabla{
  public function __construct(){
    parent::__construct('estado');
  }
}