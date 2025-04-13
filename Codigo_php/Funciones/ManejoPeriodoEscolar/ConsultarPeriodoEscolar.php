<?php
(function (){
  global $consultarPeriodo;
  $consultarPeriodo = function() {
    $extras = func_get_args();
    extract($_POST);
 $periodos   = (new periodo_escolar)->consultarDato([
      "campos"=>['id_periodo_escolar','periodo']
    ]);

    
      foreach ($periodos as $key => $value) {
        echo "<option 
          value=\"".$value['id_periodo_escolar']."\"
          > periodo ".$value['periodo']."</option>";

      }
  
    
  };
})();
