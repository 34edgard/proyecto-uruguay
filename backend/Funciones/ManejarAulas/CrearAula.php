<?php
(function(){
  global $crearAula;
  $crearAula = function() {
    
    $EXTRAS = func_get_args();
   extract($EXTRAS[0]);


    (new aulas)->registrar([
      "campos"=>['id_seccion','nombre_aula'],
      "valores"=>[$id_seccion,$nombre_aula]
    ]);

   $EXTRAS[1][0]();
  };
})();
