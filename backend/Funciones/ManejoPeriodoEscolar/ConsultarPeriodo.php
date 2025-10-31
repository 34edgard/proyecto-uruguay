<?php
namespace Funciones\ManejoPeriodoEscolar;
use App\Plantel\PeriodoEscolar;
use Liki\Plantillas\Plantilla;




class ConsultarPeriodo{
  public static function consultarPeriodo() {
    $extras = func_get_args();
    extract( $extras[0]);
 $periodos   = (new PeriodoEscolar)->consultar([
      "campos"=>['id_periodo_escolar','periodo']
    ]);

    
      foreach ($periodos as $key => $dato) {
        
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['id_periodo_escolar'],
            "contenido"=>$dato['periodo']
        ]);
        
      }
  
    
  }
}
