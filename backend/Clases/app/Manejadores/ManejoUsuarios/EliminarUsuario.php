<?php

use App\Controladores\Personas\Usuario;
use Liki\Database\FlowDB;
return new class {
  
  
  public static function run($p,$f) {
    
    extract( $p);
  //  print_r($_GET);

FlowDB::conf('Usuario')->delete(['cedula'=> $ci]);
   $f[0]();
  }
};
