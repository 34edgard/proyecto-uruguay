<?php


use App\Plantel\Secciones;
use App\Plantel\Niveles;

return new class {
  public static function run($p,$f) {
    
    
    extract($p);


    /*(new Niveles)->registrar([
      "campos"=>['id_tipo_nivel'],
      "valores"=>[$id_nivel]
     ]);
    $id_niveles = (new Niveles)->consultar([
      "campos"=>['id_tipo_nivel','id_nivel'],
      "where"=>[
        ["campo"=>'id_tipo_nivel',"operador"=>'=',"valor"=>$id_nivel]
      ],
      "orderBy"=>[
"campo"=>'id_nivel',"direccion"=>'DESC'
      ],
      "limit"=>1
    ])[0]['id_nivel'];
      */
     // print_r($p);
      
    (new Secciones)->registrar([
      "campos"=>['id_nivel','nombre_seccion'],
      "valores"=>[$id_nivel,$nombre_seccion]

    ]);
    $f[0]();
  }
};
