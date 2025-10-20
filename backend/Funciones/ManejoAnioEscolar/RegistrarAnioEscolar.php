<?php
(function(){
  global $registrarAnioEscolar;
  $registrarAnioEscolar = function(){
    $Estras = func_get_args();
    extract($Estras[0]);
    
    
    (new año_escolar)->registrar([
      "campos"=>['ci_escolar','anio','id_periodo_escolar','id_aula'],
      "valores"=>[$ci_escolar,date('Y'),$periodo_escolar,$aula]
    ]);
    
    plantilla('Inscripcion/inscripcionExitosa');
     };
})();
