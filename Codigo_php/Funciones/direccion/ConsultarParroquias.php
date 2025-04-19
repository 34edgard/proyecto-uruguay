<?php
(function(){

global $consultarParroquia2;
 $consultarParroquia2 = function () {
    $pars = (new parroquia())->consultar_info([
      "campos" => ["id_municipio", "id_parroquia", "nombre_parroquia"],
      "where"=>[
        "campo"=>'id_municipio',"operador"=>'=',"valor"=>$_GET['id_municipio']
      ]
      
    ]);
    foreach ($pars as $par) {
      echo "<option value='" .
        $par["id_parroquia"] .
        "'> " .
        $par["nombre_parroquia"] .
        "</option>";
    }

  };
  
})();
