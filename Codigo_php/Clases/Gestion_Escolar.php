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

class tipo_nivel extends datosInscripcion{
    protected  $tabla = 'tipo_nivel';
  public function __construct(){
    parent::__construct($this->tabla);
  }
 
}

class niveles extends datosInscripcion{
    protected  $tabla = 'niveles';
  public function __construct(){
    parent::__construct($this->tabla);
  }
 
}

class secciones extends datosInscripcion{
    protected  $tabla = 'secciones';
  public function __construct(){
    parent::__construct($this->tabla);
  }
 
}

class aula extends datosInscripcion{
    protected  $tabla = 'aulas';
  public function __construct(){
    parent::__construct($this->tabla);
  }
 
}
