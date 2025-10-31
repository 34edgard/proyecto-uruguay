<?php

namespace Funciones\ManejoAulas;

use App\Plantel\Aulas;


  class  CrearAula{
  public static function crearAula() {
    
    $EXTRAS = func_get_args();
   extract($EXTRAS[0]);


    (new Aulas)->registrar([
      "campos"=>['id_seccion','nombre_aula'],
      "valores"=>[$id_seccion,$nombre_aula]
    ]);

   $EXTRAS[1][0]();
  }
}
