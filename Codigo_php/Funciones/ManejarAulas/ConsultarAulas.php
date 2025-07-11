<?php
(function (){
  global $consultarAulas;
  $consultarAulas  = function() {
    $extras = func_get_args();
    extract($_POST);
 $periodos   = (new aulas)->consultar([
      "campos"=>['id_aula','nombre_aula']
    ]);

    
      foreach ($periodos as $key => $dato) {
        plantilla("componentes/option",[
            "value"=>$dato['id_aula'],
            "contenido"=>$dato['nombre_aula']
        ]);
      }
    
  };
})();
