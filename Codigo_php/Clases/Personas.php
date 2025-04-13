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
  public $Consultas_BD;
  public $consultar;
  public $registrar;
  public $editar;
  public $eliminar;
  public function __construct(){
    $this->Consultas_BD = new ConsultasBD;
    $this->consultar = new Consultar;
    $this->registrar = new Registrar;
    $this->editar = new Editar;
    $this->eliminar = new Eliminar;
  }
  public function registrar_datos($datos){
    $sql = $this->registrar->generar_sql($datos);
  //  echo "<br>$sql<br>";
    $this->Consultas_BD->ejecutarConsulta($sql);
  }
  public  function consultar_datos($datos){
    $where="";
    if(isset($datos['valor'])){
      $where = " WHERE `".$datos['campos'][0]."` = ".$datos['valor'];
    }
    if(isset($datos['like'])){
      $where = " WHERE `".$datos['campos'][0]."` like '".$datos['like']."' ";
    }
    
   $sql = $this->consultar->generar_sql($datos) .$where;
    //echo $sql;
  return  $this->Consultas_BD->consultarRegistro2($sql);
  }
  public function editar_datos($datos){
    $where = " `".$datos['campos'][0]."` = ".$datos['valor'];
    $sql = $this->editar->generar_sql($datos);
    $sql = $sql.$where;
    //echo $where;
   // echo $sql;
    $this->Consultas_BD->ejecutarConsulta($sql);
  }
  public function eliminar_datos($datos){
    $sql = $this->eliminar->generar_sql($datos);
   $sql = $sql." `".$datos['campos'][0]."` = ".$datos['valor'];
  //  echo $sql;
    $this->Consultas_BD->ejecutarConsulta($sql);
  }
  
}

class Personal_Plantel extends Persona_Normal implements Personal_Institucional {
  
  public function desactivar_estado($datos){
    
  }
   public function activar_estado($datos){
     
   }
}


class Estudiante extends Persona_Normal{
  public $tabla = 'estudiante';
  public function registrar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::registrar_datos($datos);
  }
  public function consultar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::consultar_datos($datos);
  }
  public function editar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::editar_datos($datos);
  }
  public function eliminar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::eliminar_datos($datos);
  }
}

class Reprecentante extends Persona_Normal{
  public $tabla = 'representantes';
  public function registrar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::registrar_datos($datos);
  }
  public function consultar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::consultar_datos($datos);
  }
  public function editar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::editar_datos($datos);
  }
  public function eliminar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::eliminar_datos($datos);
  }
}

class Docente extends Personal_Plantel {
  public $tabla = 'docente';
  public function registrar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::registrar_datos($datos);
  }
  public function consultar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::consultar_datos($datos);
  }
  public function editar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::editar_datos($datos);
  }
  public function eliminar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::eliminar_datos($datos);
  }
}
class Personal_Administrativo extends Personal_Plantel{
  public $tabla = 'usuario';
  public function registrar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::registrar_datos($datos);
  }
  public function consultar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::consultar_datos($datos);
  }
  public function editar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::editar_datos($datos);
  }
  public function eliminar_datos($datos){
    $datos['tabla'] = $this->tabla;
   return parent::eliminar_datos($datos);
  }
}
