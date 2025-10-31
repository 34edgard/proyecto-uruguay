<?php
namespace Funciones\ManejoSecciones;
use App\Plantel\Secciones;
use Liki\Plantillas\Plantilla;

class ConsultarSeccion{
  public static function consultarSeccion() {
     $niveles = (new Secciones)->consultar([
      "campos"=>['nombre_seccion','id_seccion']
    ]);

    
    foreach ($niveles as $key => $dato) {
      $num_docentes = 0;
      $num_niños =0;
    
    Plantilla::HTML("componentes/option",[
        "value"=>$dato['id_seccion'],
        "contenido"=>$dato['nombre_seccion']
    ]);
       
     }
    
  
  }
}
