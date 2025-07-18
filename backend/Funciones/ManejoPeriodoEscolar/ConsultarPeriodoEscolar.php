<?php
(function (){
  global $consultarPeriodo;
  $consultarPeriodo = function() {
    $extras = func_get_args();
    extract($_POST);
 $periodos   = (new periodo_escolar)->consultar([
      "campos"=>['id_periodo_escolar','periodo']
    ]);

    
      foreach ($periodos as $key => $dato) {
        
        plantilla("componentes/option",[
            "value"=>$dato['id_periodo_escolar'],
            "contenido"=>$dato['periodo']
        ]);
        
      }
  
    
  };
})();
