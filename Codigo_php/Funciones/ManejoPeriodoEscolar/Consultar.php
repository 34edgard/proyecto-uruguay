<?php
(function (){
  global $consultarPeriodoEscolar;
  $consultarPeriodoEscolar = function() {
    $extras = func_get_args();
    extract($_POST);
 $periodos   = (new periodo_escolar)->consultarDato([
      "campos"=>['periodo']
    ]);

    echo "<table class=\"table  \" >";
      foreach ($periodos as $key => $value) {
        echo "<tr><th> periodo ".$value['periodo']."</th></tr>";

      }
    echo "</table>";
    
  };
})();
