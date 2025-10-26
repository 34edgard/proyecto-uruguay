<?php
(function (){
  global $consultarAula;
  $consultarAula  = function() {
    $extras = func_get_args();
   extract($extras[0]);
    
    
 $aulas   = (new aulas)->consultar([
      "campos"=>['id_aula','nombre_aula']
    ]);

    plantilla('componentes/tabla',['aulas'=>$aulas]);
      
    };
})();
