<?php
(function(){

global $consultarParroquia2;
 $consultarParroquia2 = function () {
    $Extras = func_get_args();
    extract($Extras[0]);
    
    $id = $Municipio1 ?? $Municipio2 ?? $id_municipio;
    $pars = (new parroquia())->consultar([
      "campos" => ["id_municipio", "id_parroquia", "nombre_parroquia"],
      "where"=>[
       [ "campo"=>'id_municipio',"operador"=>'=',"valor"=>$id]
      ]
      
    ]);
    foreach ($pars as $dato) {
        plantilla("componentes/option",[
            "value"=>$dato['id_parroquia'],
            "contenido"=>$dato['nombre_parroquia']
        ]);
        
    }

  };
  
})();
