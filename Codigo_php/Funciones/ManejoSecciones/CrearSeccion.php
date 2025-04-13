<?php
(function(){
  global $crearSeccion;
  $crearSeccion = function() {
    extract($_POST);
    $EXTRAS = func_get_args();



    (new niveles)->registrarDato([
      "campos"=>['id_tipo_nivel'],
      "valores"=>[$id_nivel]
     ]);
    $id_niveles = (new niveles)->consultarDato([
      "campos"=>['id_tipo_nivel','id_nivel'],
      "value"=>$id_nivel." ORDER BY `id_nivel` DESC LIMIT 1"

    ])[0]['id_nivel'];
      
    (new secciones)->registrarDato([
      "campos"=>['id_nivel','nombre_seccion'],
      "valores"=>[$id_niveles,$nombre_seccion]

    ]);
    $EXTRAS[1][0]();
  };
})();
