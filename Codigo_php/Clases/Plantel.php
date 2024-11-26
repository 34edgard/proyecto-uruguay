<?php

interface iPlantel{
  
  public function registrar();
  public function consultar();
  public function editar();
  public function eliminar();
}

class plantel implements iPlantel{
  public function registrar(){
    
  }
  public function consultar(){
    
  }
  public function editar(){
    
  }
  public function eliminar(){
    
  }
}

class aula extends plantel{
  
}
class seccion extends plantel{
  
}
class nivel extends plantel{
  
}