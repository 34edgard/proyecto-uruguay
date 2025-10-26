<?php
(function(){
  global $crearNivel;
  $crearNivel = function() {
    
    $EXTRAS = func_get_args();
    extract($EXTRAS[0]);
    
    (new tipo_nivel)->registrar([
      "campos"=>['nombre_nivel'],
      "valores"=>[$nombre_nivel]

    ]);
    $EXTRAS[1][0]();
  };
})();
