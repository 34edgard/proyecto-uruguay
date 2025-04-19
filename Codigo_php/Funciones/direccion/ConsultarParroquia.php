<?php
(function () {
  global $consultarCalle;
  global $consultarSector;
  global $consultarParroquia;

  $consultarParroquia = function () {
    $pars = (new parroquia())->consultar_info([
      "campos" => ["id_parroquia", "nombre_parroquia"],
    ]);
    foreach ($pars as $par) {
      echo "<option value='" .
        $par["id_parroquia"] .
        "'> " .
        $par["nombre_parroquia"] .
        "</option>";
    }
  };
  $consultarSector = function () {
  extract($_GET);
 
  $parametros =["campos"=>[ 'id_parroquia','id_sector','nombre_sector' ],
    "where"=>[
      ["campo"=>'id_parroquia', "operador"=>'=']
    ]
  ];

  $parametros['where']['valor'] = $parroquia1 ?? $parroquia2;
  $parroquiaes = (new sector)->consultar_info($parametros);
  foreach ($parroquiaes as $secto){
    
    echo "<option value='".$secto['id_sector']."'>".$secto['nombre_sector']."</option>";
  }
    
  };
  $consultarCalle = function () {
    echo "<option value='1'>calle 1</option>";
    echo "<option value='2'>calle 2</option>";
  };
})();
