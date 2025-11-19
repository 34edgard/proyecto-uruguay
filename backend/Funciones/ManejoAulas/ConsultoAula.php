<?php

use Liki\Plantillas\Plantilla;
use App\Plantel\Aulas;

return new class {

  public static function run($p) {
    
   extract($p);
    
    
 $aulas   = (new Aulas)->consultar([
      "campos"=>['id_aula','nombre_aula']
    ]);

    Plantilla::HTML('componentes/tabla',['aulas'=>$aulas]);
      
    }
};
