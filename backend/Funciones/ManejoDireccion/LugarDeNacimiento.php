<?php
namespace Funciones\ManejoDireccion;

use Liki\Plantillas\Plantilla;
use App\Direccion\LugarNacimiento;
use App\Direccion\Estado;
use App\Direccion\Municipio;
use App\Direccion\Parroquia;


class LugarDeNacimiento{

public static function consultar_lugar_nacimiento($id_lugar){
 $ids =   (new LugarNacimiento)->consultar([
        "campos"=>['id_estado','id_municipio','id_parroquia'],
        "where"=>[
            ["campo"=>'id_lugar_nacimiento',"operador"=>'=',"valor"=>$id_lugar]
        ]
    ])[0];
    
    //print_r($id_lugar);
$lugar_nacimiento = self::consultar_estado($ids['id_estado']).' ';
$lugar_nacimiento .= self::consultar_municipio($ids['id_estado']).' ';
$lugar_nacimiento .= self::consultar_parroquia($ids['id_estado']);
return $lugar_nacimiento;
}




public static function consultar_estado($id_estado){
return (new Estado)->consultar([
        "campos"=>['nombre_estado'],
        "where"=>[
            ["campo"=>'id_estado',"operador"=>'=',"valor"=>$id_estado]
        ]
    ])[0]['nombre_estado'];
}

public static function consultar_municipio($id_municipio){
return (new Municipio)->consultar([
        "campos"=>['nombre_municipio'],
        "where"=>[
            ["campo"=>'id_municipio',"operador"=>'=',"valor"=>$id_municipio]
        ]
    ])[0]['nombre_municipio'];
}

public static function consultar_parroquia($id_parroquia){
return (new Parroquia)->consultar([
        "campos"=>['nombre_parroquia'],
        "where"=>[
            ["campo"=>'id_parroquia',"operador"=>'=',"valor"=>$id_parroquia]
        ]
    ])[0]['nombre_parroquia'];
}





}