<?php
(function(){
  global $crearNivel;
  $crearNivel = function() {
    extract($_POST);
    $EXTRAS = func_get_args();
    (new tipo_nivel)->registrar([
      "campos"=>['nombre_nivel'],
      "valores"=>[$nombre_nivel]

    ]);
    $EXTRAS[1][0]();
  };
})();
