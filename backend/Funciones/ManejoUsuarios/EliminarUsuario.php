<?php
(function (){
  
  global $eliminar_usuario;
  $eliminar_usuario = function () {
    $extras = func_get_args();
    extract( $extras[0]);
  //  print_r($_GET);
    $usuarios = new Personal_Administrativo();

    $usuarios->eliminar(["campos" => ["cedula"], 
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',
      "valor" => $ci]
      ]
    ]);
   $extras[1][0]();
  };
})();
