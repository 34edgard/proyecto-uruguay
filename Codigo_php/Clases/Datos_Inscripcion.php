<?php

interface IDatosInscripcion{
  public function registrarDato(string $dato);
  public function consultarDato(string $dato);
  public function editarDato(string $dato);
  public function eliminarDato(string $dato);
}

abstract class datosInscripcion implements IDatosInscripcion {
   protected  $tabla ;
  public function __construct(string $tabla){
    $this->tabla = $tabla;
    $this->Consultas_BD = new ConsultasBD;
    $this->consultar = new Consultar;
    $this->registrar = new Registrar;
    $this->editar = new Editar;
    $this->eliminar = new Eliminar;
  }
  
  
  public function registrarDato(string $dato){
    $dato['tabla'] = $this->tabla;
    $sql = $this->registrar->generar_sql($dato);
  //  echo "<br>$sql<br>";
    $this->Consultas_BD->ejecutarConsulta($sql);
    
  }
  public function consultarDato(string $dato){
    $dato['tabla'] = $this->tabla;
  
   $where="";
    if(isset($dato['valor'])){
      $where = " WHERE `".$dato['campos'][0]."` = ".$dato['valor'];
    }
    
   $sql = $this->consultar->generar_sql($dato) .$where;
   
  return  $this->Consultas_BD->consultarRegistro2($sql);
  }
  public function editarDato(string $dato){
    $dato['tabla'] = $this->tabla;
  
   $where = " `".$datos['campos'][0]."` = ".$datos['valor'];
    $sql = $this->editar->generar_sql($datos);
    $sql = $sql.$where;
    //echo $where;
   // echo $sql;
    $this->Consultas_BD->ejecutarConsulta($sql);
  }
  public function eliminarDato(string $dato){
    $dato['tabla'] = $this->tabla;
  
   $sql = $this->eliminar->generar_sql($datos);
   $sql = $sql." `".$datos['campos'][0]."` = ".$datos['valor'];
    
    $this->Consultas_BD->ejecutarConsulta($sql);
  }
  
  
}


class tallas extends datosInscripcion{
  protected  $tabla = 'tallas';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class prendas extends datosInscripcion{
  protected  $tabla = 'prendas';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}

class parentesco extends datosInscripcion{
  protected  $tabla = 'parentesco';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class tipo_parentesco extends datosInscripcion{
  protected  $tabla = 'tipo_parentesco';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class procedencia extends datosInscripcion{
  protected  $tabla = 'procedencia';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class nacionalidad extends datosInscripcion{
  protected  $tabla = 'nacionalidad';
  public function __construct(){
    parent::__construct($this->tabla);
  }
  
}