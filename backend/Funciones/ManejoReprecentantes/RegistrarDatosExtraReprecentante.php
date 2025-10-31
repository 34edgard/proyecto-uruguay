<?php


namespace Funciones\ManejoReprecentantes;

use Liki\Plantillas\Plantilla;


class RegistrarDatosExtraReprecentante{
  public static function registrarDatosExtraReprecentante(){
    $EXTRAS = func_get_args();

    extract( $EXTRAS[0]);
    $EXTRAS[1][0]($numero_telefono,'id_representante',$tipo_telefono,$id_propietario);
    Plantilla::HTML('Inscripcion/RegistroExitoso');
  }
}
