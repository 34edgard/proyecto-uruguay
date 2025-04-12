<?php
(function (){
  global $consultarPeriodoEscolar;
  $consultarPeriodoEscolar = function() {
    $extras = func_get_args();
    extract($_POST);
    (new periodo_escola)->registraDato([
      "campos"=>['periodo']
    ]);


    
  };
})();
