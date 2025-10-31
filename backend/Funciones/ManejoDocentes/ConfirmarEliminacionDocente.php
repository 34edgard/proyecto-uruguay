<?php

namespace Funciones\ManejoDocentes;
use Liki\Plantillas\Plantilla;


class ConfirmarEliminacionDocente{
  public static function confirmarEliminacion(){
    //  extract($_GET);
 //   print_r($_GET);
      $Extras = func_get_args();
   Plantilla::HTML('Docente/confirmarEliminacion',$Extras[0]);
    }
}
