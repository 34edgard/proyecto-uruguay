<?php

namespace App\Controladores\Plantel;
use Liki\Modelo;
use Liki\DelegateFunction;


class Secciones extends Modelo{
  public function __construct(){
    parent::__construct('secciones');
  }
  public static function consultarSeccion(){
    DelegateFunction::exec('ManejoSecciones/ConsultarSeccion');
  }
  public static function consultarSecciones(){
    DelegateFunction::exec('ManejoSecciones/ConsultarSecciones');
  }
  
  public static function crearSeccion($p,$f){
    DelegateFunction::exec('ManejoSecciones/CrearSeccion',$p,$f);
  }
  public static function confirmarEliminacion($p){
      DelegateFunction::exec('ManejoSecciones/ConfirmarEliminacion',$p);
  }
  public static function eliminarSeccion($p,$f){
      DelegateFunction::exec('ManejoSecciones/EliminarSeccion',$p,$f);
      
  }
}

