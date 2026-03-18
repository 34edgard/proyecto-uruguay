<?php

namespace App\Controladores\Plantel;
use Liki\Modelo;
use Liki\DelegateFunction;


class Niveles extends Modelo{
  public function __construct(){
    parent::__construct('niveles');
  }
  
  public static function crearNivel($p,$f){
    DelegateFunction::exec('ManejoNiveles/CrearNivel',$p,$f);
  }
 public static function consultarNivel(){
    DelegateFunction::exec('ManejoNiveles/ConsultarNivel');
  }
  public static function consultarNiveles(){
    DelegateFunction::exec('ManejoNiveles/ConsultarNiveles');
  }
}