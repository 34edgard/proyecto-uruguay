<?php
function consultar_estado($id_estado){
return (new estado)->consultar([
        "campos"=>['nombre_estado'],
        "where"=>[
            ["campo"=>'id_estado',"operador"=>'=',"valor"=>$id_estado]
        ]
    ])[0]['nombre_estado'];
}

function consultar_municipio($id_municipio){
return (new municipio)->consultar([
        "campos"=>['nombre_municipio'],
        "where"=>[
            ["campo"=>'id_municipio',"operador"=>'=',"valor"=>$id_municipio]
        ]
    ])[0]['nombre_municipio'];
}

function consultar_parroquia($id_parroquia){
return (new parroquia)->consultar([
        "campos"=>['nombre_parroquia'],
        "where"=>[
            ["campo"=>'id_parroquia',"operador"=>'=',"valor"=>$id_parroquia]
        ]
    ])[0]['nombre_parroquia'];
}



function consultar_lugar_nacimiento($id_lugar){
 $ids =   (new lugar_nacimiento)->consultar([
        "campos"=>['id_estado','id_municipio','id_parroquia'],
        "where"=>[
            ["campo"=>'id_lugar_nacimiento',"operador"=>'=',"valor"=>$id_lugar]
        ]
    ])[0];
    
    //print_r($id_lugar);
$lugar_nacimiento = consultar_estado($ids['id_estado']).' ';
$lugar_nacimiento .= consultar_municipio($ids['id_estado']).' ';
$lugar_nacimiento .= consultar_parroquia($ids['id_estado']);
return $lugar_nacimiento;
}
