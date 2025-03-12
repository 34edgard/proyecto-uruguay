<?php
(function (){
  
  global $eliminar_usuario;
  $eliminar_usuario = function () {
    $extras = func_get_args();
    extract($_GET);
  //  print_r($_GET);
    $usuarios = new Personal_Administrativo();

    $usuarios->eliminar_datos(["campos" => ["cedula"], "valor" => $_GET['ci']]);
   $extras[1][0]();
  };
})();