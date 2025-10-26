<?php
namespace Funciones\ManejoUsuarios;
use App\Rol;
use Liki\Plantillas\Plantilla;

  class ConsultarRol{
  public static function consultar_rol(){
    $roles = (new Rol)->consultar(["campos"=>['id_rol','nombre_rol']]);
    foreach ($roles as $dato){
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['id_rol'],
            "contenido"=>$dato['nombre_rol']
        ]);
    }
    
  }
  
}