<?php
(function(){
  global $crearAula;
  $crearAula = function() {
    extract($_POST);
    $EXTRAS = func_get_args();



    (new aulas)->registrar([
      "campos"=>['id_seccion','nombre_aula'],
      "valores"=>[$id_seccion,$nombre_aula]
    ]);

   $EXTRAS[1][0]();
  };
})();
