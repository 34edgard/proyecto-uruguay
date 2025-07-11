<?php
(function(){
  global $consultarSeccion;
  $consultarSeccion = function() {
     $niveles = (new secciones)->consultar([
      "campos"=>['nombre_seccion','id_seccion']
    ]);

    
    foreach ($niveles as $key => $dato) {
      $num_docentes = 0;
      $num_niños =0;
    
    plantilla("componentes/option",[
        "value"=>$dato['id_seccion'],
        "contenido"=>$dato['nombre_seccion']
    ]);
       
     }
    
  
  };
})();
