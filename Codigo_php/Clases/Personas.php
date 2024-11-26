<?php 
interface Personas {
  
  public function registrar_datos($datos);
  public function consultar_datos($datos);
  public function editar_datos($datos);
  public function eliminar_datos($datos);
}
interface Personal_Institucional extends Personas{
    
   public function desactivar_estado($datos);
   public function activar_estado($datos);
}

class Persona_Normal implements Personas {
  public function __construct(){
    $this->Consultas_BD = new Consultas_BD;
    $this->consultar = new consultar;
    $this->registrar = new registrar;
    $this->editar = new editar;
    $this->eliminar = new eliminar;
  }
  public function registrar_datos($datos){
    $sql = $this->registrar->generar_sql($datos);
    
    $this->Consultas_BD->ejecutar_consulta($sql);
  }
  public function consultar_datos($datos){
    $where="";
    if(isset($datos['valor'])){
      $where = " WHERE `".$datos['campos'][0]."` = ".$datos['valor'];
    }
    
   $sql = $this->consultar->generar_sql($datos) .$where;
    
  return  $this->Consultas_BD->consultar_registro($sql,$datos['longitud']);
  }
  public function editar_datos($datos){
    $where = " `".$datos['campos'][0]."` = ".$datos['valor'];
    $sql = $this->editar->generar_sql($datos);
    $sql = $sql.$where;
    
    $this->Consultas_BD->ejecutar_consulta($sql);
  }
  public function eliminar_datos($datos){
    $sql = $this->eliminar->generar_sql($datos);
   $sql = $sql." `".$datos['campos'][0]."` = ".$datos['valor'];
    
    $this->Consultas_BD->ejecutar_consulta($sql);
  }
  
}

class Personal_Plantel extends Persona_Normal implements Personal_Institucional {
  
  public function desactivar_estado($datos){
    
  }
   public function activar_estado($datos){
     
   }
}


class Estudiante extends Persona_Normal{
  
}

class Reprecentante extends Persona_Normal{
  
}

class Docente extends Personal_Plantel {
  
}
class Personal_Administrativo extends Personal_Plantel{
  
}