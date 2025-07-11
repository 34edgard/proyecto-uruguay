<?php
(function (){
  global $ConfirmarEliminacion;
  $ConfirmarEliminacion = function (){
    //  extract($_GET);
 //   print_r($_GET);
      
   plantilla('Docente/confirmarEliminacion',$_GET);
    };
})();
