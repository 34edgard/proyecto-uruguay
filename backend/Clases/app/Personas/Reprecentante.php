<?php

namespace App\Personas;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Reprecentante extends Tabla{
  public function __construct(){
    parent::__construct('representantes');
  }
  public static function registrarReprecentante($p){
      ExecFunc::exec('ManejoReprecentantes/RegistrarReprecentante',$p);
  }
  public static function registrarDatosExtraReprecentante($p,$f){
      ExecFunc::exec('ManejoReprecentantes/RegistrarDatosExtraReprecentante',$p,$f);
  }
  public static function consultarReprecentanteCi($p){
      ExecFunc::exec('ManejoReprecentantes/ConsultarReprecentanteCi',$p);
  }
  public static function consultarReprecentanteBuscarCi($p){
      ExecFunc::exec('ManejoReprecentantes/ConsultarReprecentanteBuscarCi',$p);
  }
}

