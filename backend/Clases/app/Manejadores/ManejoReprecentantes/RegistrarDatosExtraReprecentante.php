<?php
use Liki\Plantillas\Flow;

return new class {
  public static function run($p,$f){
    extract($p);
    $f[0]($numero_telefono,'id_representante',$tipo_telefono,$id_propietario);
    Flow::html('Inscripcion/RegistroExitoso');
  }
};