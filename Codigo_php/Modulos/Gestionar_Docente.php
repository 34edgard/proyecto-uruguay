<?php

include './includer.php';

Peticion::metodo_get($consultarDocente);
Peticion::metodo_get(function (){
  echo 'dddd';
},['eliminar']);
Peticion::metodo_post($registrarDocente,['formulario','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono'],[$registrarTelefono]);