<?php
namespace App\Controladores\Personas;
use Liki\DelegateFunction;

class Docente {
  
  public static function consultarDocente(){
    DelegateFunction::exec('ManejoDocentes/ConsultarDocente');
  }  
  public static function consultarDocenteCI($p){
    DelegateFunction::exec('ManejoDocentes/ConsultarDocenteCI',$p);
  }
  public static function imprimirDocenteCI($p){
    DelegateFunction::exec('ManejoDocentes/ImprimirDocentes',$p);
  }
  
  public static function registrarDocente($p,$f){
    DelegateFunction::exec('ManejoDocentes/RegistrarDocente',$p,$f);
  }
  
  public static function formularioEdicion($p){
    DelegateFunction::exec('ManejoDocentes/FormularioEdicionDocente',$p);
  }
  public static function editarDocente($p,$f){ 
    DelegateFunction::exec('ManejoDocentes/EditarDocente',$p,$f);
  }
  public static function confirmarEliminacion($p){
    DelegateFunction::exec('ManejoDocentes/ConfirmarEliminacionDocente',$p);
  }
  public static function eliminarDocente($p,$f){
    DelegateFunction::exec('ManejoDocentes/EliminarDocente',$p,$f);
  }
}