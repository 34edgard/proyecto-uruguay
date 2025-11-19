<?php

namespace App\Plantel;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Aulas extends Tabla{
  public function __construct(){
    parent::__construct('aulas');
  }
  
  public static function crearAula($p,$f){
    ExecFunc::exec('ManejoAulas/CrearAula',$p,$f);
  }
  public static function consultarAula($p){
    ExecFunc::exec('ManejoAulas/ConsultoAula',$p);
  }
  public static function consultarAulas(){
    ExecFunc::exec('ManejoAulas/ConsultarAulas');
  }
}