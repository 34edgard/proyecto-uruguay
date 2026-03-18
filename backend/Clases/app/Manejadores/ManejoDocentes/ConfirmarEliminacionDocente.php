<?php


use Liki\Plantillas\Flow;


return new class {
  public static function run($p){
    //  extract($_GET);
 //   print_r($_GET);
      
   Flow::html('Docente/confirmarEliminacion',$p);
    }
};
