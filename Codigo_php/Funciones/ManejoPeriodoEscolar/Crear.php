<?php
(function (){
  global $crearPeriodoEscolar;
  $crearPeriodoEscolar = function() {
    $extras = func_get_args();
    extract($_POST);
       
       $anioInicio = Fecha($inicio_periodo)[0];
       $anioFin = Fecha($fin_periodo)[0];

     $periodo = $anioInicio"-".$anioFin;
    (new periodo_escola)->registraDato([
      "campos"=>['periodo'],
      'valores'=>[$periodo]
    ]);


    $extras[0][1]();
  };
})();
