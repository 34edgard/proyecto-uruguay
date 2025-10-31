<?php
namespace Funciones\DatosPersonales;


use App\DatosExtra\NivelInstruccion;
use Liki\Plantillas\Plantilla;


class NivelDeInstruccion{

 public static function consultarNivelInstruccion(){
    $datos = (new NivelInstruccion)->consultar(["campos"=>['id_nivel_instruccion','nombre_nivel_instruccion']]);
  // print_r($datos);
    foreach ($datos as $dato){
        Plantilla::HTML("componentes/option",[
            "value"=>$dato['id_nivel_instruccion'],
            "contenido"=>$dato['nombre_nivel_instruccion']
        ]);
      }
    }
  
  
  }