<?php
interface IDatosExtra{
 public function registrarDato($dato);
 public function consultarDato($dato);
 public function editarDato($dato);
 public function eliminarDato($dato);
 
}
abstract class DatosExtras implements IDatosExtra{
  protected  $tabla ;
  public $Consultas_BD;
  public $consultar;
  public $registrar;
  public $editar;
  public $eliminar;
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
 // echo "<br>$sql<br>";
    $this->Consultas_BD->ejecutarConsulta($sql);
    
  }
 public function consultarDato($dato){
   $dato['tabla'] = $this->tabla;
  
   
   $sql = $this->consultar->generar_sql($dato) ;
   
  return  $this->Consultas_BD->consultarRegistro2($sql);
 }
 public function editarDato($dato){
   $dato['tabla'] = $this->tabla;
  
   $sql = $this->editar->generar_sql($datos);
   $this->Consultas_BD->ejecutarConsulta($sql);
 }
 public function consultarId($dato){
   $dato['tabla'] = $this->tabla;
    $sql = $this->consultar->generar_sql($dato);
   
    
    
   return $this->Consultas_BD->consultarRegistro2($sql);
    
    
  }
 
 public function eliminarDato($dato){
   $dato['tabla'] = $this->tabla;
  
   $sql = $this->eliminar->generar_sql($dato);
   $this->Consultas_BD->ejecutarConsulta($sql);
 }
}

class Telefono extends DatosExtras{
  protected  $tabla = 'telefonos';
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
class correo extends DatosExtras{
  
  protected  $tabla = 'correo';
  public function __construct(){
    parent::__construct($this->tabla);
  }
  
}

