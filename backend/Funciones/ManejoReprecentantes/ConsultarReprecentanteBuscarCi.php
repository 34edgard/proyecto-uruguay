<?php
namespace Funciones\ManejoReprecentantes;

use Liki\Plantillas\Plantilla;
use App\Personas\Reprecentante;



class ConsultarReprecentanteBuscarCi{
  public static function consultarReprecentanteBuscarCi() {
    $extras = func_get_args();
    extract( $extras[0]);
 $r   = (new Reprecentante)->consultar([
      "campos"=>['cedula'],
    "where"=>[
        ["campo"=>'cedula',"operador"=>'LIKE',
        "valor"=>$buscar_ci.'%']
    ]
    ]);

    
      foreach ($r as $key => $dato) {
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['cedula'],
            "contenido"=>$dato['cedula']
        ]);
      }
    
  }
}
