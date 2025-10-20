<?php
(function (){
  global $consultarReprecentanteCi;
  $consultarReprecentanteCi  = function() {
    $extras = func_get_args();
    extract( $extras[0]);
 $r   = (new Reprecentante)->consultar([
      "campos"=>['cedula']
    ]);

    
      foreach ($r as $key => $dato) {
        plantilla("componentes/option",[
            "value"=>$dato['cedula'],
            "contenido"=>$dato['cedula']
        ]);
      }
    
  };
})();
