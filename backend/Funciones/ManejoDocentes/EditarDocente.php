<?php

use App\Personas\Docente;

return new class {

  public static function run($p,$f){
    
   extract($p);
    (new Docente)->editar([
      "campos"=>['cedula','nombres','apellidos','fecha_nacimiento'],
      "valores"=>[$cedula,$nombre,$apellido,$fecha_nacimiento], 
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',"valor"=>$cedula]
      ]
      
      ]);
    $f[0]();
  }
};
