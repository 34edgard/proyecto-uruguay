<?php
interface iDatos_Medicos{
  public function registrar( $dato);
  public function consultar( $dato);
  public function editar($dato);
  public function eliminar( $dato);
}
class datos_medicos implements iDatos_Medicos{
  protected  $tabla ;
  public function __construct(string $tabla){
    $this->tabla = $tabla;
    $this->Consultas_BD = new ConsultasBD;
    $this->consultar = new Consultar;
    $this->registrar = new Registrar;
    $this->editar = new Editar;
    $this->eliminar = new Eliminar;
  }
  
  
  
  public function registrar( $dato){
    $dato['tabla'] = $this->tabla;
    $sql = $this->registrar->generar_sql($dato);
  //  echo "<br>$sql<br>";
    $this->Consultas_BD->ejecutarConsulta($sql);
    
  }
  public function consultar( $dato){
    $dato['tabla'] = $this->tabla;
  
   $where="";
    if(isset($dato['valor'])){
      $where = " WHERE `".$dato['campos'][0]."` = ".$dato['valor'];
    }
    
   $sql = $this->consultar->generar_sql($dato) .$where;
   
  return  $this->Consultas_BD->consultarRegistro2($sql);
  }
  public function editar( $dato){
    $dato['tabla'] = $this->tabla;
  
   $where = " `".$datos['campos'][0]."` = ".$datos['valor'];
    $sql = $this->editar->generar_sql($datos);
    $sql = $sql.$where;
    //echo $where;
   // echo $sql;
    $this->Consultas_BD->ejecutarConsulta($sql);
  }
  public function eliminar( $dato){
    $dato['tabla'] = $this->tabla;
  
   $sql = $this->eliminar->generar_sql($datos);
   $sql = $sql." `".$datos['campos'][0]."` = ".$datos['valor'];
    
    $this->Consultas_BD->ejecutarConsulta($sql);
  }
}

class condicion_medica extends datos_medicos{
   protected  $tabla = 'condicion_medica';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class tratamiento extends datos_medicos{
   protected  $tabla = 'tratamiento';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class discapacidad extends datos_medicos{
   protected  $tabla = 'discapacidad';
  public function __construct(){
    parent::__construct($this->tabla);
  }
} 
class Estado_Nutricional extends datos_medicos{
   protected  $tabla = 'estado_nutricional';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
