<?php
namespace App\Personas;
use Liki\Database\Tabla;


class Usuario extends Tabla{
  public function __construct(){
    parent::__construct('usuario');
  }
}
