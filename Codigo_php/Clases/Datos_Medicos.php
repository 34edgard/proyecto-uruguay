<?php
interface iDatos_Medicos{
  public function registrar();
  public function consultar();
  public function editar();
  public function eliminar();
}
class datos_medicos implements iDatos_Medicos{
  public function registrar(){
    
  }
  public function consultar(){
    
  }
  public function editar(){
    
  }
  public function eliminar(){
    
  }
}

class condicion_medica extends datos_medicos{
}
class tratamiento extends datos_medicos{
}
class discapacidad extends datos_medicos{
}
class Estado_Nutricional extends datos_medicos{
}