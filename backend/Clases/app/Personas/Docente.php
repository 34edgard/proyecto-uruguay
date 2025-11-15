<?php

namespace App\Personas;
use Liki\Database\Tabla;
use Liki\ExecFunc;

class Docente extends Tabla{
  public function __construct(){
    parent::__construct('docente');
  }
  public static function consultarDocente(){
    ExecFunc::exec('ManejoDocentes/ConsultarDocente');
  }
  
  public static function consultarDocenteCI($p){
    ExecFunc::exec('ManejoDocentes/ConsultarDocenteCI',$p);
  }
  public static function imprimirDocenteCI($p){
   // print_r($p);
    ExecFunc::exec('ManejoDocentes/ImprimirDocentes',$p);
  }
  
  public static function registrarDocente($p,$f){
    ExecFunc::exec('ManejoDocentes/RegistrarDocente',$p,$f);
  }
  
  public static function formularioEdicion($p){
    ExecFunc::exec('ManejoDocentes/FormularioEdicionDocente',$p);
  }
  public static function editarDocente($p,$f){ 
    ExecFunc::exec('ManejoDocentes/EditarDocente',$p,$f);
  }
  public static function confirmarEliminacion($p){
    ExecFunc::exec('ManejoDocentes/ConfirmarEliminacionDocente',$p);
  }

  public static function eliminarDocente($p,$f){
    ExecFunc::exec('ManejoDocentes/EliminarDocente',$p,$f);
  }
}

