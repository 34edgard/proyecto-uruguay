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

class aula extends plantel{
  
}
class seccion extends plantel{
  
}
class nivel extends plantel{
  
}
