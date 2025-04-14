<?php
(function(){
  global $registrarAnioEscolar;
  $registrarAnioEscolar = function(){
    extract($_POST);
    (new año_escolar)->registrarDato([
      "campos"=>['ci_escolar','anio','id_periodo_escolar','id_aula'],
      "valores"=>[$ci_escolar,date('Y'),$periodo_escolar,$aula]
    ]);
   echo "<h2 class='text-primary'> el niño se a inscrito correctamente</h2>";
  };
})();
