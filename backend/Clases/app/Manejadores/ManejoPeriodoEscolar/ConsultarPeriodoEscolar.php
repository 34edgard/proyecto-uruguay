<?php

use App\Controladores\Plantel\PeriodoEscolar;
use Liki\Database\FlowDB;

return new class {

  public static function run() {
   
 $periodos = FlowDB::conf('PeriodoEscolar')
->campos(['periodo'])
->get();

    echo "<table class=\"table  \" >";
      foreach ($periodos as $key => $value) {
        echo "<tr><th> periodo ".$value['periodo']."</th></tr>";

      }
    echo "</table>";
    
  }
};