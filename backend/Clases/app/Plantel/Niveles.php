<?php

namespace App\Plantel;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Niveles extends Tabla{
  public function __construct(){
    parent::__construct('niveles');
  }
  
  public static function crearNivel($p,$f){
    ExecFunc::exec('ManejoNiveles/CrearNivel',$p,$f);
  }
 public static function consultarNivel(){
    ExecFunc::exec('ManejoNiveles/ConsultarNivel');
  }
  public static function consultarNiveles(){
    ExecFunc::exec('ManejoNiveles/ConsultarNiveles');
  }
}