<?php
(function (){
  
  global $eliminar_usuario;
  $eliminar_usuario = function () {
    extract($_GET);
    $usuarios = new Personal_Administrativo();

    $usuarios->eliminar_datos(["campos" => ["cedula"], "valor" => $ci]);
  };
})();