<?php

namespace Funciones\ManejoSecciones;
use App\Plantel\Secciones;
use App\Plantel\Niveles;

class CrearSeccion{
  public static function crearSeccion() {
    
    $EXTRAS = func_get_args();
    extract($EXTRAS[0]);


    (new Niveles)->registrar([
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
      
    (new Secciones)->registrar([
      "campos"=>['id_nivel','nombre_seccion'],
      "valores"=>[$id_niveles,$nombre_seccion]

    ]);
    $EXTRAS[1][0]();
  }
}
