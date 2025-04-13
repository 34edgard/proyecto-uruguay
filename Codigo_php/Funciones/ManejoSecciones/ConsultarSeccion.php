<?php
(function(){
  global $consultarSeccion;
  $consultarSeccion = function() {
     $niveles = (new secciones)->consultarDato([
      "campos"=>['nombre_seccion','id_seccion']
    ]);

    
    foreach ($niveles as $key => $nivel) {
      $num_docentes = 0;
      $num_niños =0;
       echo "<option value=\"{$nivel['id_seccion']}\">".$nivel['nombre_seccion']."</option>";
    
     }
    
  
  };
})();
