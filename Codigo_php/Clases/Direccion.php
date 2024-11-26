<?php

interface Locacion {
  public function registrar_info($info);
  public function consultar_info($info);
  public function editar_info($info);
  public function eliminar_info($info);
}

class lugar implements Locacion{
  public function __construct($conexion) {
    
  }
  public function registrar_info($info){
    
  }
  public function consultar_info($info){
    
  }
  public function editar_info($info){
    
  }
  public function eliminar_info($info){
    
  }
}

class pais extends lugar{}
class estado extends lugar{}
class municipio extends lugar{}
class parroquia extends lugar{}
class sector extends lugar{}
class calle extends lugar{}
