<?php
(function () {
  
  global $consultarSector;
  global $consultarParroquia;

  $consultarParroquia = function () {
    $Extras = func_get_args();
    extract($Extras[0]);
   $id_parro = $estado ?? 1;
    $pars = (new parroquia())->consultar([
      "campos" => ["id_parroquia", "nombre_parroquia"],
      "where"=>[
        ["campo"=>"id_municipio","operador"=>'=',"valor"=>$id_parro]
      ]
    ]);
    foreach ($pars as $dato) {
        plantilla("componentes/option",[
            "value"=>$dato['id_parroquia'],
            "contenido"=>$dato['nombre_parroquia']
        ]);
        
    }
  };
  $consultarSector = function () {
  
 
  $parametros =["campos"=>[ 'id_parroquia','id_sector','nombre_sector' ],
    "where"=>[
      ["campo"=>'id_parroquia', "operador"=>'=']
    ]
  ];
 $id = $parroquia1 ?? $parroquia2;

  $parametros['where'][0]['valor'] =$id ?? 1;
 // print_r($parametros);
    $parroquiaes = (new sector)->consultar($parametros);
  foreach ($parroquiaes as $dato){
    plantilla("componentes/option",[
        "value"=>$dato['id_sector'],
        "contenido"=>$dato['nombre_sector']
    ]);
  }
    
  };

})();
