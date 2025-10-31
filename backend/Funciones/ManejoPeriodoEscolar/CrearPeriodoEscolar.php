<?php

namespace Funciones\ManejoPeriodoEscolar;
use App\Plantel\PeriodoEscolar;
use Funciones\Edad;


class CrearPeriodoEscolar{
  public static function crearPeriodoEscolar() {
    $extras = func_get_args();
    extract(  $extras[0]);
       
       $anioInicio = Edad::Fecha($inicio_periodo)[0];
       $anioFin = Edad::Fecha($fin_periodo)[0];

     $periodo = $anioInicio."-".$anioFin;
    (new PeriodoEscolar)->registrar([
      "campos"=>['periodo'],
      'valores'=>[$periodo]
    ]);

//print_r($extras);
    $extras[1][0]();
  }
}
