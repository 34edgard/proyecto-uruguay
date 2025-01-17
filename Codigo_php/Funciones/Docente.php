<?php
(function (){
global $registrarDocente;
$registrarDocente= function (){
  $extras = func_get_args();
  extract($_POST);
  $DOCENTE = new Docente;
  $id_telefono = $extras[1][0]($numero_telefono);
  $DOCENTE->registrar_datos(['campos' => ['ci','nombre','apellido','f_nacimiento','id_telefono'],'valores'=>[$ci,$nombre,$apellido,$f_nacimiento,$id_telefono]]);
};
})();