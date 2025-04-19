<?php
(function (){
  global $consultarMunicipio;
  
  $consultarMunicipio = function (){
    $datos = (new municipio)->consultar_info(["campos"=>['id_estado','id_municipio','nombre_municipio'],
      "where"=>[
   ["campo"=>'id_estado', "operador"=>'=', "valor"=>$_GET['id_estado'] ]
      ]
    ]);
  // print_r($datos);
    foreach ($datos as $dato){
      
      echo "<option value=\"{$dato['id_municipio']}\">";
      echo $dato['nombre_municipio'];
      echo "</option>";
    }
  };
  })();
