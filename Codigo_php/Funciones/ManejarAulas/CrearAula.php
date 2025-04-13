<?php
(function(){
  global $crearAula;
  $crearAula = function() {
    extract($_POST);
    $EXTRAS = func_get_args();



    (new aulas)->registrarDato([
      "campos"=>['id_seccion','nombre_aula'],
      "valores"=>[$id_seccion,$nombre_aula]
    ]);

   $EXTRAS[1][0]();
  };
})();
