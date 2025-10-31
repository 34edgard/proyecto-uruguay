<?php

namespace Funciones\ManejoNiveles;

use App\Plantel\TipoNivel;


class CrearNivel{
  public static function crearNivel() {
    
    $EXTRAS = func_get_args();
    extract($EXTRAS[0]);
    
    (new TipoNivel)->registrar([
      "campos"=>['nombre_nivel'],
      "valores"=>[$nombre_nivel]

    ]);
    $EXTRAS[1][0]();
  }
}
