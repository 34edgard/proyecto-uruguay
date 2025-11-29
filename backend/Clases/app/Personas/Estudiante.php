<?php

namespace App\Personas;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Estudiante extends Tabla{
  public function __construct(){
    parent::__construct('estudiante');
  }
  public static function ConsultarListaEstudiantes(){
      ExecFunc::exec('ManejoEstudiantes/ConsultarListaEstudiantes');
  }
  public static function confirmarEliminacionEstudiante($p){
      ExecFunc::exec('ManejoEstudiantes/ConfirmarEliminacionEstudiante',$p);
  }
  public static function registrarEstudiante($p,$f){
      ExecFunc::exec('ManejoEstudiantes/RegistrarEstudiante',$p,$f);
  }
  public static function registrarDatosExtraEstudiante($p){
      ExecFunc::exec('ManejoEstudiantes/RegistrarDatosExtraEstudiante',$p);
  }
  public static function FormularioEdicionEstudiante($p){
      ExecFunc::exec('ManejoEstudiantes/FormularioEdicionEstudiante',$p);
  }
  public static function EliminarEstudiante($p,$f){
      ExecFunc::exec('ManejoEstudiantes/EliminarEstudiante',$p,$f);
  }
}

