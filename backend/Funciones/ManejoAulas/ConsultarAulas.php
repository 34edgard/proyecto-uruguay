<?php
namespace Funciones\ManejoAulas;

use Liki\Plantillas\Plantilla;
use App\Plantel\Aulas;


class ConsultarAulas{
  public static function consultarAulas() {
    //$extras = func_get_args();
   // extract($extras[0]);
 $periodos   = (new Aulas)->consultar([
      "campos"=>['id_aula','nombre_aula']
    ]);

    
      foreach ($periodos as $key => $dato) {
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['id_aula'],
            "contenido"=>$dato['nombre_aula']
        ]);
      }

  }
}
