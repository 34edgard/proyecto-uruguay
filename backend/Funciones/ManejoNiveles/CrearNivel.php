<?php


use App\Plantel\TipoNivel;


return new class {
  public static function run($p,$f) {
    
    
    extract($p);
    
    (new TipoNivel)->registrar([
      "campos"=>['nombre_nivel'],
      "valores"=>[$nombre_nivel]

    ]);
    $f[0]();
  }
};
