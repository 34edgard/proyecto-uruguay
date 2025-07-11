<?php


class Telefono extends Tabla{
  public function __construct(){
    parent::__construct('telefonos');
  }
  
}

class ocupacion extends Tabla{
  public function __construct(){
    parent::__construct('ocupacion');
  }
  
}
class nivel_instruccion extends Tabla{
  public function __construct(){
    parent::__construct('nivel_instruccion');
  }
}
class rol extends Tabla{
  
  public function __construct(){
    parent::__construct('roles');
  }
  
}
class correo extends Tabla{
  
  public function __construct(){
    parent::__construct('correo');
  }
  
}

