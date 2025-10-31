<?php

namespace Funciones\ManejoNiveles;

use App\Plantel\TipoNivel;
use Liki\Plantillas\Plantilla;



  class ConsultarNiveles{
  public static function consultarNiveles() {
     $niveles = (new TipoNivel)->consultar([
      "campos"=>['nombre_nivel','id_tipo_nivel']
    ]);

    
    foreach ($niveles as $key => $nivel) {
      $num_docentes = 0;
      $num_niños =0;
    Plantilla::HTML("componentes/option",[
        "value"=>$nivel['id_tipo_nivel'],
        "contenido"=>$nivel['nombre_nivel']
    ]);
     }
    
  
  }
}
