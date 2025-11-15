<?php

namespace App\DatosExtra;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Telefono extends Tabla{
  public function __construct(){
    parent::__construct('telefonos');
  }
  public static function NumeroTelefono($id){
     return ExecFunc::exec('DatosPersonales/NumeroTelefono',$id);
  }
}
