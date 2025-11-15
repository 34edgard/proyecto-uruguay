<?php


use Liki\Plantillas\Plantilla;


return new class {
  public static function run($p){
    //  extract($_GET);
 //   print_r($_GET);
      
   Plantilla::HTML('Docente/confirmarEliminacion',$p);
    }
};
