<?php

interface IDatosInscripcion{
  public function registrarDato( $dato);
  public function consultarDato( $dato);
  public function editarDato( $dato);
  public function eliminarDato( $dato);
}

abstract class datosInscripcion implements IDatosInscripcion {
  protected  $tabla ;
  public $Consultas_BD;
  public $consultar;
  public $registrar;
  public $editar;
  public $eliminar;
  public function __construct( $tabla){
    $this->tabla = $tabla;
    $this->Consultas_BD = new ConsultasBD;
    $this->consultar = new Consultar;
    $this->registrar = new Registrar;
    $this->editar = new Editar;
    $this->eliminar = new Eliminar;
  }
  
  
  public function registrarDato( $dato){
    $dato['tabla'] = $this->tabla;
    $sql = $this->registrar->generar_sql($dato);
  //  echo "<br>$sql<br>";
    $this->Consultas_BD->ejecutarConsulta($sql);
    
  }
  public function consultarDato( $dato){
    $dato['tabla'] = $this->tabla;
   
   $sql = $this->consultar->generar_sql($dato) ;
   //echo $sql;
  return  $this->Consultas_BD->consultarRegistro2($sql);
  }
  public function editarDato( $dato){
    $dato['tabla'] = $this->tabla;
  
   $sql = $this->editar->generar_sql($dato);
   
    $this->Consultas_BD->ejecutarConsulta($sql);
  }
  public function eliminarDato( $dato){
    $dato['tabla'] = $this->tabla;
  
   $sql = $this->eliminar->generar_sql($dato);
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

class peso extends datosInscripcion{
  protected  $tabla = 'peso';
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

class documentos_inscripcion extends datosInscripcion{
  protected  $tabla = 'documentos_inscripcion';
  public function __construct(){
    parent::__construct($this->tabla);
  }
  
}

class inscripciones extends datosInscripcion{
  protected  $tabla = 'inscripciones';
  public function __construct(){
    parent::__construct($this->tabla);
  }
  
}
class inscripciones_estudiante extends datosInscripcion{
  protected  $tabla = 'inscripciones_estudiante';
  public function __construct(){
    parent::__construct($this->tabla);
  }
  
}
