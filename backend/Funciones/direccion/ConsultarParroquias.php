<?php
(function(){

global $consultarParroquia2;
 $consultarParroquia2 = function () {
    $pars = (new parroquia())->consultar([
      "campos" => ["id_municipio", "id_parroquia", "nombre_parroquia"],
      "where"=>[
       [ "campo"=>'id_municipio',"operador"=>'=',"valor"=>$_GET['id_municipio']]
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
