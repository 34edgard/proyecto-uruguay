<?php

include '../includer.php';
//print_r($_POST);

//echo '<option> sexo</option>';
Peticion::metodo_get($optenerSexos,["sexo"]);


Peticion::metodo_get($generarCedulaEscolar,['ci_escolar']);
Peticion::metodo_get($consultarOcupacion,['id_ocupacion']);
Peticion::metodo_get($consultarNacionalidad,['id_nacionalidad']);
Peticion::metodo_get($consultarNivelInstruccion,['id_nivel_instruccion']);
Peticion::metodo_get($consultarEstadoNutricional,['id_estado_nutricional']);
Peticion::metodo_get($consultarCondicionMedica,['id_condicion_medica']);
Peticion::metodo_get($consultarDiscapacidad,['id_discapacidad']);
Peticion::metodo_get($consultarProcedencia,['id_procedencia']);

Peticion::metodo_post($registrarReprecentante ,[ 
  'nro_vivienda1',
  'nro_vivienda2',
  'parroquia1'  ,
  'parroquia2'  ,
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
Peticion::metodo_post($registrarDatosExtraReprecentante ,['numero_telefono','id_propietario','tipo_telefono'],[ $registrarTelefono]);
Peticion::metodo_post($registrarEstudiante ,['ci_escolar',
  'nombres',
  'apellidos',
  'fecha_nacimiento',
  
  'id_nacionalidad',
    
  'sexo',
  'id_estado',
  'id_municipio',
  'id_parroquia',
  'parroquia1',
  'id_direccion',
  'nro_vivienda1',  
  'descripcion_direccion',
  'id_procedencia',
  'id_condicion_medica',
  'id_discapacidad',
  'id_estado_nutricional'],[$generarCedulaEscolar]);
Peticion::metodo_post($registrarDatosExtraEstudiante ,[
  "cedula_escolar",
  "talla_camisa",
  "talla_pantalon",
  "talla_zapato",
  "peso",
  "circunferencia_braquial",
  "partida_nacimiento",
  "copia_cedula_madre",
  "copia_cedula_padre",
  "fotos_tipo_carnet",
  "copia_certificado_vacuna"
  ]);




