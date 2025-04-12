<?php


class año_escolar extends datosInscripcion{
    protected  $tabla = 'anio_escolar';
  public function __construct(){
    parent::__construct($this->tabla);
  }
 
}
class fecha_inscripcion extends datosInscripcion{
    protected  $tabla = 'inscripciones_estudiante';
  public function __construct(){
    parent::__construct($this->tabla);
  }
 
}
class periodo_escolar extends datosInscripcion{
    protected  $tabla = 'periodo_escolar';
  public function __construct(){
    parent::__construct($this->tabla);
  }
 
}
