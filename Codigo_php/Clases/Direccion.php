<?php

interface Locacion {
  public function registrar_info( $dato);
  public function consultar_info( $dato);
  public function editar_info( $dato);
  public function eliminar_info( $dato);
}

class lugar implements Locacion{
  protected  $tabla ;
  public function __construct( $tabla){
    $this->tabla = $tabla;
    $this->Consultas_BD = new ConsultasBD;
    $this->consultar = new Consultar;
    $this->registrar = new Registrar;
    $this->editar = new Editar;
    $this->eliminar = new Eliminar;
  }
  
  public function registrar_info( $dato){
    $dato['tabla'] = $this->tabla;
    $sql = $this->registrar->generar_sql($dato);
  //  echo "<br>$sql<br>";
    $this->Consultas_BD->ejecutarConsulta($sql);
    
  }
  public function consultar_info( $dato){
    $dato['tabla'] = $this->tabla;
  
   $where="";
    if(isset($dato['valor'])){
      $where = " WHERE `".$dato['campos'][0]."` = ".$dato['valor'];
    }
    
   $sql = $this->consultar->generar_sql($dato) .$where;
   
  return  $this->Consultas_BD->consultarRegistro2($sql);
  
  }
  public function editar_info( $dato){
    $dato['tabla'] = $this->tabla;
  
   $where = " `".$datos['campos'][0]."` = ".$datos['valor'];
    $sql = $this->editar->generar_sql($datos);
    $sql = $sql.$where;
    //echo $where;
   // echo $sql;
    $this->Consultas_BD->ejecutarConsulta($sql);
  }
  public function eliminar_info( $dato){
    $dato['tabla'] = $this->tabla;
  
   $sql = $this->eliminar->generar_sql($datos);
   $sql = $sql." `".$datos['campos'][0]."` = ".$datos['valor'];
    
    $this->Consultas_BD->ejecutarConsulta($sql);
  }
}

class pais extends lugar{
  protected  $tabla = 'pais';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class estado extends lugar{
  protected  $tabla = 'estado';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class municipio extends lugar{
  protected  $tabla = 'municipio';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class parroquia extends lugar{
  protected  $tabla = 'parroquia';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class sector extends lugar{
  protected  $tabla = 'sector';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class calle extends lugar{
  protected  $tabla = 'calle';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
