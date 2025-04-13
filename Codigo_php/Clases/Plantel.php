<?php

interface iPlantel{
  
  public function registrar($datos);
  public function consultar($datos);
  public function editar($datos);
  public function eliminar($datos);
}

class plantel implements iPlantel{
  public function registrar($datos){
    
  }
  public function consultar($datos){
    
  }
  public function editar($datos){
    
  }
  public function eliminar($datos){
    
  }
}
class aulas extends datosInscripcion{
    protected  $tabla = 'aulas';
  public function __construct(){
    parent::__construct($this->tabla);
  }
 
}

class seccion extends plantel{
  
}
class nivel extends plantel{
  
}
