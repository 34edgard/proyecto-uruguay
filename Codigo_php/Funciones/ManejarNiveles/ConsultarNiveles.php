<?php
(function(){
  global $consultarNiveles;
  $consultarNiveles = function() {
     $niveles = (new tipo_nivel)->consultarDato([
      "campos"=>['nombre_nivel','id_tipo_nivel']
    ]);

    
    foreach ($niveles as $key => $nivel) {
      $num_docentes = 0;
      $num_niños =0;
       echo "<option value=\"{$nivel['id_tipo_nivel']}\">".$nivel['nombre_nivel']."</option>";
    
     }
    
  
  };
})();
