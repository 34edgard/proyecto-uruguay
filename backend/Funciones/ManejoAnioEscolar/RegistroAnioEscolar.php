<?php

namespace Funciones\ManejoAnioEscolar;

use Liki\Plantillas\Plantilla;
use App\Plantel\AnioEscolar;



class RegistroAnioEscolar{
  public static function registrarAnioEscolar(){
    $Estras = func_get_args();
    extract($Estras[0]);
    
    
    (new AnioEscolar)->registrar([
      "campos"=>['ci_escolar','anio','id_periodo_escolar','id_aula'],
      "valores"=>[$ci_escolar,date('Y'),$periodo_escolar,$aula]
    ]);
    
    Plantilla::HTML('Inscripcion/inscripcionExitosa');
     }
}
