<?php


use App\Controladores\Plantel\TipoNivel;
use Liki\Database\FlowDB;

return new class {
  public static function run($p,$f) {
    
    
    extract($p);
    
    FlowDB::conf('TipoNivel')
    ->campos(['nombre_nivel'])
  ->post([$nombre_nivel]);

    
    $f[0]();
  }
};
