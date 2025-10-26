<?php
namespace App;
use Liki\Database\Tabla;


class Personal_Administrativo extends Tabla{
  public function __construct(){
    parent::__construct('usuario');
  }
}
