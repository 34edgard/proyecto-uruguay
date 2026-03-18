<?php

use Liki\Routing\Ruta;


use Funciones\DatosPersonales\Sexos;
use Funciones\DatosPersonales\ConsultaDeOcupacion;
use Funciones\DatosPersonales\NivelDeInstruccion;
use Funciones\DatosPersonales\CedulaEscolar;




use Funciones\ManejoDatosExtras\ConsultarProcedencia;
use Funciones\ManejoDatosExtras\ConsultarNacionalidad;
use Funciones\ManejoDatosExtras\ConsultarEstadoNutricional;
use Funciones\ManejoDatosExtras\ConsultarCondicionMedica;
use Funciones\ManejoDatosExtras\ConsultarDiscapacidad;


use App\Controladores\Personas\Estudiante;


return  function (){
        


Ruta::get('/estudiante/sexo',[Sexos::class,'optenerSexos'],["sexo"]);

Ruta::get('/estudiante/procedencia',[ConsultarProcedencia::class,'consultarProcedencia'],['id_procedencia']);

Ruta::get('/estudiante/cedula',[CedulaEscolar::class,'generarCedulaEscolar'],['ci_escolar']);

Ruta::get('/estudiante/ocupacion',[ConsultaDeOcupacion::class,'consultarOcupacion'],['id_ocupacion']);

Ruta::get('/estudiante/nacionalidad',[ConsultarNacionalidad::class,'consultarNacionalidad'],['id_nacionalidad']);

Ruta::get('/estudiante/nivel_instruccion',[NivelDeInstruccion::class,'consultarNivelInstruccion'],['id_nivel_instruccion']);

Ruta::get('/estudiante/estado_nutricional',[ConsultarEstadoNutricional::class,'consultarEstadoNutricional'],['id_estado_nutricional']);

Ruta::get('/estudiante/condicion_medica',[ConsultarCondicionMedica::class,'consultarCondicionMedica'],['id_condicion_medica']);

Ruta::get('/estudiante/discapacidad',[ConsultarDiscapacidad::class,'consultarDiscapacidad'],['id_discapacidad']);


Ruta::get('/estudiante/form/edicion',[Estudiante::class,'FormularioEdicionEstudiante'],['formularioEdicion']);

Ruta::get('/estudiante/eliminar_confir',[Estudiante::class,'confirmarEliminacionEstudiante'],['ci_escolar']);

Ruta::get('/estudiante/eliminar',[Estudiante::class,'EliminarEstudiante'],['ci_escolar'],
[[Estudiante::class,'ConsultarListaEstudiantes']]);





Ruta::post('/estudiante/registrar',[Estudiante::class,'registrarEstudiante'] ,[
    'ci_escolar',
    'ci_madre',
    'ci_padre',
    'buscar_ci',
  'nombres',
  'apellidos',
  'fecha_nacimiento',
  'Municipio1',
  'id_nacionalidad',
    'estado1',
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
  'id_estado_nutricional'],[[CedulaEscolar::class,'generarCedulaEscolar']]);


//print_r($_POST);
Ruta::post('/estudiante/extra',[Estudiante::class,'registrarDatosExtraEstudiante'] ,[
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





Ruta::get('/reportes/ListaEstudiantes',[Estudiante::class,'ConsultarListaEstudiantes']);





};