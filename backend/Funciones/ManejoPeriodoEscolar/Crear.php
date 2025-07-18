<?php
(function (){
  global $crearPeriodoEscolar;
  $crearPeriodoEscolar = function() {
    $extras = func_get_args();
    extract($_POST);
       
       $anioInicio = Fecha($inicio_periodo)[0];
       $anioFin = Fecha($fin_periodo)[0];

     $periodo = $anioInicio."-".$anioFin;
    (new periodo_escolar)->registrar([
      "campos"=>['periodo'],
      'valores'=>[$periodo]
    ]);

//print_r($extras);
    $extras[1][0]();
  };
})();
