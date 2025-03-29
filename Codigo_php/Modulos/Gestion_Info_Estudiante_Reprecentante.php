<?php

include './includer.php';
print_r($_POST);

//echo '<option> sexo</option>';
//Peticion::metodo_get($optenerSexos,["Datos_Niño_Sexo"]);
//Peticion::metodo_post($optenerSexos);


Peticion::metodo_get($consultarOcupacion,['id_ocupacion']);
Peticion::metodo_get($consultarNacionalidad,['id_nacionalidad']);
Peticion::metodo_get($consultarNivelInstruccion,['id_nivel_instruccion']);
Peticion::metodo_get($consultarEstadoNutricional,['id_estado_nutricional']);

Peticion::metodo_post($registrarReprecentante ,[ 
  'cedula'  ,
  'nombres' ,
  'apellidos' ,
  'fecha_nacimiento' ,
  'id_nacionalidad'  ,
  'id_nivel_instruccion'  ,
  'id_ocupacion'  ,
  'id_direccion_habitacion'  ,
  'descripcion_direccion_habitacion',
  'id_direccion_trabajo'  ,
  'descripcion_direccion_trabajo'
  ]);
Peticion::metodo_post($registrarDatosExtraReprecentante ,['numero_telefono']);
Peticion::metodo_post($registrarEstudiante ,['ci_escolar',
  'nombres',
  'apellidos',
  'fecha_nacimiento',
  'id_lugar_nacimiento',
  'id_nacionalidad',
  
  'sexo',
  'id_ubicacion',
  'id_procedencia',
  'id_condicion_medica',
  'id_discapacidad',
  'id_estado_nutricional']);
Peticion::metodo_post($registrarDatosExtraEstudiante ,[
  'apellidos','nombres','fecha_nacimiento','id_lugar_nacimiento','id_procedencia','id_nacionalidad','id_estado_nutricional','id_condicion_medica','id_discapacidad'
  ]);




