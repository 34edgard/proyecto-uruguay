<?php
(function(){
  global $crearSeccion;
  $crearSeccion = function() {
    extract($_POST);
    $EXTRAS = func_get_args();



    (new niveles)->registrar([
      "campos"=>['id_tipo_nivel'],
      "valores"=>[$id_nivel]
     ]);
    $id_niveles = (new niveles)->consultar([
      "campos"=>['id_tipo_nivel','id_nivel'],
      "where"=>[
        ["campo"=>'id_tipo_nivel',"operador"=>'=',"valor"=>$id_nivel]
      ],
      "orderBy"=>[
"campo"=>'id_nivel',"direccion"=>'DESC'
      ],
      "limit"=>1
    ])[0]['id_nivel'];
      
    (new secciones)->registrar([
      "campos"=>['id_nivel','nombre_seccion'],
      "valores"=>[$id_niveles,$nombre_seccion]

    ]);
    $EXTRAS[1][0]();
  };
})();
