<?php

namespace Funciones\ManejoPeriodoEscolar;
use App\Plantel\PeriodoEscolar;


class ConsultarPeriodoEscolar{

  public static function consultarPeriodoEscolar() {
   
 $periodos   = (new PeriodoEscolar)->consultar([
      "campos"=>['periodo']
    ]);

    echo "<table class=\"table  \" >";
      foreach ($periodos as $key => $value) {
        echo "<tr><th> periodo ".$value['periodo']."</th></tr>";

      }
    echo "</table>";
    
  }
}
