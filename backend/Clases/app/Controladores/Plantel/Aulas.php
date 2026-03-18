<?php

namespace App\Controladores\Plantel;
use Liki\Modelo;
use Liki\DelegateFunction;


class Aulas extends Modelo{
  public function __construct(){
    parent::__construct('aulas');
  }
  
  public static function crearAula($p,$f){
    DelegateFunction::exec('ManejoAulas/CrearAula',$p,$f);
  }
                         
  public static function consultarAula($p){
    DelegateFunction::exec('ManejoAulas/ConsultoAula',$p);
  }
  public static function consultarAulas(){
    DelegateFunction::exec('ManejoAulas/ConsultarAulas');
  }
}