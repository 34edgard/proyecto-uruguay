<?php
(function (){
  global $consultarAulas;
  $consultarAulas  = function() {
    $extras = func_get_args();
    extract($_POST);
 $periodos   = (new aulas)->consultarDato([
      "campos"=>['id_aula','nombre_aula']
    ]);

    
      foreach ($periodos as $key => $value) {
        echo "<option 
          value=\"".$value['id_aula']."\"
          > ".$value['nombre_aula']."</option>";

      }
    
  };
})();
