<?php 



class Estudiante extends Tabla{
  public function __construct(){
    parent::__construct('estudiante');
  }
}

class Reprecentante extends Tabla{
  public function __construct(){
    parent::__construct('representantes');
  }
}

class Docente extends Tabla{
  public function __construct(){
    parent::__construct('docente');
  }
}

class Personal_Administrativo extends Tabla{
  public function __construct(){
    parent::__construct('usuario');
  }
}
