<?php




class tallas extends Tabla{
  public function __construct(){
    parent::__construct('tallas');
  }
}
class prendas extends Tabla{
  public function __construct(){
    parent::__construct('prendas');
  }
}

class peso extends Tabla{
  
  public function __construct(){
    parent::__construct('peso');
  }
}

class parentesco extends Tabla{
  public function __construct(){
    parent::__construct('parentesco');
  }
}
class tipo_parentesco extends Tabla{
  
  public function __construct(){
    parent::__construct('tipo_parentesco');
  }
}
class procedencia extends Tabla{
  public function __construct(){
    parent::__construct('procedencia');
  }
}
class nacionalidad extends Tabla{
    public function __construct(){
    parent::__construct('nacionalidad');
  }
  
}

class documentos_inscripcion extends Tabla{
  public function __construct(){
    parent::__construct('documentos_inscripcion');
  }                      
  
}

class inscripciones extends Tabla{
  public function __construct(){
    parent::__construct('inscripciones');
  }
  
}
class inscripciones_estudiante extends Tabla{
  public function __construct(){
    parent::__construct('inscripciones_estudiante');
  }
  
}
