<?php

namespace App\Plantel;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Secciones extends Tabla{
  public function __construct(){
    parent::__construct('secciones');
  }
  public static function consultarSeccion(){
    ExecFunc::exec('ManejoSecciones/ConsultarSeccion');
  }
  public static function consultarSecciones(){
    ExecFunc::exec('ManejoSecciones/ConsultarSecciones');
  }
  
  public static function crearSeccion($p,$f){
    ExecFunc::exec('ManejoSecciones/CrearSeccion',$p,$f);
  }
}

