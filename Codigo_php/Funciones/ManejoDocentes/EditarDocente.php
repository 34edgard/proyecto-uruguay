<?php
(function (){
  global $editarDocente;
  $editarDocente = function (){
    $EXTRAS = func_get_args();
   extract($_POST);
    (new Docente)->editar_datos([
      "campos"=>['cedula','nombres','apellidos','fecha_nacimiento'],
      "valores"=>[$cedula,$nombre,$apellido,$fecha_nacimiento], "valor"=>$cedula
      ]);
    $EXTRAS[1][0]();
  };
})();