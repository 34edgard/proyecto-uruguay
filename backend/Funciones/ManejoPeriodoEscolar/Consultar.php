<?php
(function (){
  global $consultarPeriodoEscolar;
  $consultarPeriodoEscolar = function() {
   
 $periodos   = (new periodo_escolar)->consultar([
      "campos"=>['periodo']
    ]);

    echo "<table class=\"table  \" >";
      foreach ($periodos as $key => $value) {
        echo "<tr><th> periodo ".$value['periodo']."</th></tr>";

      }
    echo "</table>";
    
  };
})();
