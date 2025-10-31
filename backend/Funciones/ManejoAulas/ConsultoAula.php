<?php
namespace Funciones\ManejoAulas;

use Liki\Plantillas\Plantilla;
use App\Plantel\Aulas;

class ConsultoAula{

  public static function consultarAula() {
    $extras = func_get_args();
   extract($extras[0]);
    
    
 $aulas   = (new Aulas)->consultar([
      "campos"=>['id_aula','nombre_aula']
    ]);

    Plantilla::HTML('componentes/tabla',['aulas'=>$aulas]);
      
    }
}
