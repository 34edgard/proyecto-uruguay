<?php
(function (){
  global $editarDocente;
  $editarDocente = function (){
    $EXTRAS = func_get_args();
   extract($_POST);
    (new Docente)->editar([
      "campos"=>['cedula','nombres','apellidos','fecha_nacimiento'],
      "valores"=>[$cedula,$nombre,$apellido,$fecha_nacimiento], 
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',"valor"=>$cedula]
      ]
      
      ]);
    $EXTRAS[1][0]();
  };
})();
