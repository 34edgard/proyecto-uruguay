<?php
interface IDatosExtra{
 public function registrarDato($dato);
 public function consultarDato($dato);
 public function editarDato($dato);
 public function eliminarDato($dato);
 
}
abstract class DatosExtras implements IDatosExtra{
  protected  $tabla ;
  public function __construct(string $tabla){
    $this->tabla = $tabla;
    $this->Consultas_BD = new ConsultasBD;
    $this->consultar = new Consultar;
    $this->registrar = new Registrar;
    $this->editar = new Editar;
    $this->eliminar = new Eliminar;
  }
  
  public function registrarDato($dato){
    $dato['tabla'] = $this->tabla;
    $sql = $this->registrar->generar_sql($dato);
  //  echo "<br>$sql<br>";
    $this->Consultas_BD->ejecutarConsulta($sql);
    
  }
 public function consultarDato($dato){
   $dato['tabla'] = $this->tabla;
  
   $where="";
    if(isset($dato['valor'])){
      $where = " WHERE `".$dato['campos'][0]."` = ".$dato['valor'];
    }
    
   $sql = $this->consultar->generar_sql($dato) .$where;
   
  return  $this->Consultas_BD->consultarRegistro($sql,$dato['longitud']);
 }
 public function editarDato($dato){
   $dato['tabla'] = $this->tabla;
  
   $where = " `".$datos['campos'][0]."` = ".$datos['valor'];
    $sql = $this->editar->generar_sql($datos);
    $sql = $sql.$where;
    //echo $where;
   // echo $sql;
    $this->Consultas_BD->ejecutarConsulta($sql);
 }
 public function consultarId($dato){
   $dato['tabla'] = $this->tabla;
    $sql = $this->consultar->generar_sql($dato) ." ORDER BY `".$dato['campos'][0]."` DESC LIMIT 1 ";
   
    echo "<br>$sql<br>";
    
   return $this->Consultas_BD->consultarRegistro($sql,0);
    
    
  }
 
 public function eliminarDato($dato){
   $dato['tabla'] = $this->tabla;
  
   $sql = $this->eliminar->generar_sql($datos);
   $sql = $sql." `".$datos['campos'][0]."` = ".$datos['valor'];
    
    $this->Consultas_BD->ejecutarConsulta($sql);
 }
}

class Telefono extends DatosExtras{
  protected  $tabla = 'telefono';
  public function __construct(){
    parent::__construct($this->tabla);
  }
  
}
class sexo extends DatosExtras{
  protected $tabla = 'sexo';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class ocupacion extends DatosExtras{
protected  $tabla = 'ocupacion';
  public function __construct(){
    parent::__construct($this->tabla);
  }
  
}
class nivel_instruccion extends DatosExtras{
  protected  $tabla = 'nivel_instruccion';
  public function __construct(){
    parent::__construct($this->tabla);
  }
}
class rol extends DatosExtras{
  
  protected  $tabla = 'roles';
  public function __construct(){
    parent::__construct($this->tabla);
  }
  
}

