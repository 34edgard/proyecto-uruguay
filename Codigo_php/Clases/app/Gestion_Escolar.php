<?php


class año_escolar extends Tabla{
  public function __construct(){
    parent::__construct('anio_escolar');
  }
 
}
class fecha_inscripcion extends Tabla{
  public function __construct(){
    parent::__construct('inscripciones_estudiante');
  }
 
}
class periodo_escolar extends Tabla{
  public function __construct(){
    parent::__construct('periodo_escolar');
  }
 
}

class tipo_nivel extends Tabla{
  public function __construct(){
    parent::__construct('tipo_nivel');
  }
 
}

class niveles extends Tabla{
  public function __construct(){
    parent::__construct('niveles');
  }
 
}

class secciones extends Tabla{
  public function __construct(){
    parent::__construct('secciones');
  }
 
}

class aula extends Tabla{
  public function __construct(){
    parent::__construct('aulas');
  }
 
}
