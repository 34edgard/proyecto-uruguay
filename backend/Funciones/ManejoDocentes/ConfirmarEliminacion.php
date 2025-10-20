<?php
(function (){
  global $ConfirmarEliminacion;
  $ConfirmarEliminacion = function (){
    //  extract($_GET);
 //   print_r($_GET);
      $Extras = func_get_args();
   plantilla('Docente/confirmarEliminacion',$Extras[0]);
    };
})();
