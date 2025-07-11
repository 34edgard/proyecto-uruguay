<?php
(function (){
  global $consultarMunicipio;
  
  $consultarMunicipio = function (){
    $datos = (new municipio)->consultar(["campos"=>['id_estado','id_municipio','nombre_municipio'],
      "where"=>[
   ["campo"=>'id_estado', "operador"=>'=', "valor"=>$_GET['id_estado'] ]
      ]
    ]);
  // print_r($datos);
    foreach ($datos as $dato){
      plantilla("componentes/option",[
          "value"=>$dato['id_municipio'],
          "contenido"=>$dato['nombre_municipio']
      ]);
      
    }
  };
  })();
