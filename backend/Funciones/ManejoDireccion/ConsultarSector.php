<?php

namespace Funciones\ManejoDireccion;

use Liki\Plantillas\Plantilla;
use App\Direccion\Sector;


class ConsultarSector{
public static function consultarSector($datos){
  
 extract($datos);
  $parametros =["campos"=>[ 'id_parroquia','id_sector','nombre_sector' ],
    "where"=>[
      ["campo"=>'id_parroquia', "operador"=>'=']
    ]
  ];
 $id = $parroquia1 ?? $parroquia2;

  $parametros['where'][0]['valor'] =$id ?? 1;
 // print_r($parametros);
    $parroquiaes = (new Sector)->consultar($parametros);
  foreach ($parroquiaes as $dato){
    Plantilla::HTML("componentes/option",[
        "value"=>$dato['id_sector'],
        "contenido"=>$dato['nombre_sector']
    ]);
  }
    
  }
}