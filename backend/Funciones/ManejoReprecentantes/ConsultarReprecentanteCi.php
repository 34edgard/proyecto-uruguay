<?php
namespace Funciones\ManejoReprecentantes;

use Liki\Plantillas\Plantilla;
use App\Personas\Reprecentante;



class ConsultarReprecentanteCi{
  public static function consultarReprecentanteCi() {
    $extras = func_get_args();
    extract( $extras[0]);
 $r   = (new Reprecentante)->consultar([
      "campos"=>['cedula']
    ]);

    
      foreach ($r as $key => $dato) {
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['cedula'],
            "contenido"=>$dato['cedula']
        ]);
      }
    
  }
}
