<?php
namespace App\Controladores\Personas;
use Liki\DelegateFunction;

class Reprecentante {
  public static function registrarReprecentante($p){
      DelegateFunction::exec('ManejoReprecentantes/RegistrarReprecentante',$p);
  }
  public static function registrarDatosExtraReprecentante($p,$f){
      DelegateFunction::exec('ManejoReprecentantes/RegistrarDatosExtraReprecentante',$p,$f);
  }
  public static function consultarReprecentanteCi($p){
      DelegateFunction::exec('ManejoReprecentantes/ConsultarReprecentanteCi',$p);
  }
  public static function consultarReprecentanteBuscarCi($p){
      DelegateFunction::exec('ManejoReprecentantes/ConsultarReprecentanteBuscarCi',$p);
  }
}