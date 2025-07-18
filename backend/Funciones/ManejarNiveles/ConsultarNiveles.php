<?php
(function(){
  global $consultarNiveles;
  $consultarNiveles = function() {
     $niveles = (new tipo_nivel)->consultar([
      "campos"=>['nombre_nivel','id_tipo_nivel']
    ]);

    
    foreach ($niveles as $key => $nivel) {
      $num_docentes = 0;
      $num_niños =0;
    plantilla("componentes/option",[
        "value"=>$nivel['id_tipo_nivel'],
        "contenido"=>$nivel['nombre_nivel']
    ]);
     }
    
  
  };
})();
