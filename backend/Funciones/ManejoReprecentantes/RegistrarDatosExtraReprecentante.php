<?php
(function (){
  global $registrarDatosExtraReprecentante;
  $registrarDatosExtraReprecentante =function (){
    $EXTRAS = func_get_args();

    extract($_POST);
    $EXTRAS[1][0]($numero_telefono,'id_representante',$tipo_telefono,$id_propietario);
    plantilla('Inscripcion/RegistroExitoso');
  };
})();
