<?php
include "./conf.php";
include "./backend/includer.php";

//print_r($_POST);
//print_r($_GET);
Ruta::get('/bdSQLWeb',function(){
    bdSQLWeb();
});

Ruta::get("/webEditor",function(){
    webEditor();
});

Ruta::get("/file",function(){
    filesGet();
},['f']);



Ruta::get('/imprimir/planilla',function(){
    imprimirPlanilla();
});


Ruta::get('/src',function($p2){
    plantilla($_GET['html']);
},['html']);

Ruta::get('/inicio',function(){
 paginas('inicio');
});

Ruta::get('/Administrar',function(){
  paginas('Administrar');
});
Ruta::get('/',function(){
    
   paginas('index');
});
Ruta::get('/index.php',function(){
//bdSQLWeb();
paginas('index');
});
//Gestion_Sesion
Ruta::get('/Gestion_Sesion',function(){
paginas('Gestion_Sesion');
});

Ruta::get('/Cerrar_Sesion',$cerrar_sesion);
Ruta::post('/iniciar/sesion',$iniciar_sesion,['Inicio_secion','correo','contraseña'],[$validar_datosDB]);

//Gestion_Usuario
//


Ruta::post('/usuario/crear',$crear_usuario,['Crear_usuario','cedula','nombre','apellido','correo','usuario','rol','contraseña'],[$consultar_usuario]);

Ruta::get('/usuario/list',$consultar_usuario);
Ruta::get('/usuario/rol',$consultar_rol,['rol']);
Ruta::get('/usuario/cedula',$consultar_usuario_ci,['consultar_usuario_ci','ci']);

Ruta::get('/usuario/eliminar',$eliminar_usuario,['eliminarUsuario','ci'],[$consultar_usuario]);


Ruta::get('/usuario/cambiarEstadoUsuario',$cambiarEstado,['cambiarEstadoUsuario','ci']);


Ruta::get('/usuario/form/edicion',$editar_usuario_form,['formularioEdicion']);
Ruta::get('/usuario/eliminar_confir',$confirmarEliminacion,['confimarEliminacion']);
//"/usuario/editar

Ruta::post('/usuario/editar',$editar_usuario,['EditarUsuario','ci','nombre','nombre_usuario','correo','apellido','contraseña','rol'],[$consultar_usuario]);

//
//
// Gestion_Docente.php
//


Ruta::get('/docente',$consultarDocente);
Ruta::get('/docente/ci',$consultarDocenteCI,['ci']);
Ruta::get('/docente/ci/imprimir',$imprimirDocenteCI,['ci']);

Ruta::get('/docente/formulario',$formularioEdicion,['formularioEdicion']);
Ruta::get('/docente/eliminar',$eliminarDocente,['eliminar'],[$consultarDocente]);
Ruta::get('/docente/confirmar/eliminacion',$ConfirmarEliminacion,['ConfirmarEliminacion']);
Ruta::post('/docente/registrar',$registrarDocente,['formulario','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono'],[$registrarTelefono]);
Ruta::post('/docente/editar',$editarDocente,['Editar','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono'],[$consultarDocente]);


//
//Gestion_plantel
//




Ruta::post('/plantel/periodo/crear',$crearPeriodoEscolar,['inicio_periodo','fin_periodo'],[$consultarPeriodoEscolar]);
Ruta::post('/plantel/periodo/consultar',$consultarPeriodoEscolar,[]);
Ruta::get('/plantel/periodo/escolar',$consultarPeriodo,['periodo_escolar']);
Ruta::get('/plantel/aulas',$consultarAulas,['aula']);
Ruta::post('/plantel/nivel/crear',$crearNivel,['nombre_nivel'],[$consultarNivel]);
Ruta::get('/plantel/nivele',$consultarNivel,['id_nivel']);
Ruta::get('/plantel/niveles',$consultarNiveles,['id_niveles']);

Ruta::post('/plantel/seccion/crear',$crearSeccion,['nombre_seccion','id_nivel'],[$consultarSecciones]);
Ruta::get('/plantel/secciones',$consultarSecciones,['id_secciones']);
Ruta::get('/plantel/seccion',$consultarSeccion,['id_seccion']);

Ruta::post('/plantel/aula/crear',$crearAula,['id_seccion','nombre_aula'],[$consultarAula]);
Ruta::get('/plantel/aulas/select',$consultarAulas);
Ruta::get('/plantel/aula',$consultarAula,['id_aula']);

Ruta::post('/plantel/AnioEscolar/registrar',$registrarAnioEscolar,['ci_escolar','aula','periodo_escolar']);

Ruta::get('/plantel/AnioEscolar',$consultarAnioEscolar,['id_inscritos']);



/*
 * 
 * 
 * reportes
 * 
 */

Ruta::get("/reportes/matricula",$consultarMatriculaEscolar);
Ruta::post("/matricula/generar",$GenerarMatriculaEscolar,['periodo','edad','sexo']);
Ruta::get("/estadistica/general",$estadisticaGeneral);
//Ruta::post("/estadistica/generar")


Ruta::get("/planillas",$consultarPlanilla);
Ruta::post("/planillas/tablas",$generarPlanilla,['periodo','edad','sexo','numeroEstudiantes']);




Ruta::get("/planilla/imprimir",$imprimirPlanilla,['ci_escolar']);


//
//
//
//Gestion_Info_Estudiante_Reprecentante
//
//



Ruta::get('/estudiante/sexo',$optenerSexos,["sexo"]);


Ruta::get('/estudiante/cedula',$generarCedulaEscolar,['ci_escolar']);
Ruta::get('/estudiante/ocupacion',$consultarOcupacion,['id_ocupacion']);
Ruta::get('/estudiante/nacionalidad',$consultarNacionalidad,['id_nacionalidad']);
Ruta::get('/estudiante/nivel_instruccion',$consultarNivelInstruccion,['id_nivel_instruccion']);
Ruta::get('/estudiante/estado_nutricional',$consultarEstadoNutricional,['id_estado_nutricional']);
Ruta::get('/estudiante/condicion_medica',$consultarCondicionMedica,['id_condicion_medica']);
Ruta::get('/estudiante/discapacidad',$consultarDiscapacidad,['id_discapacidad']);
Ruta::get('/estudiante/procedencia',$consultarProcedencia,['id_procedencia']);



Ruta::get('/reprecentantes/ci',$consultarReprecentanteCi);


Ruta::post('/reprecentante/registrar',$registrarReprecentante ,[ 
  'nro_vivienda1',
  'nro_vivienda2',
  'parroquia1'  ,
  'parroquia2'  ,
   'estado1',
   'estado2',
   'Municipio1',
   'Municipio2',
  'cedula'  ,
   'trabaja',
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
Ruta::post('/reprecentante/extra',$registrarDatosExtraReprecentante ,['numero_telefono','id_propietario','tipo_telefono'],[ $registrarTelefono]);
Ruta::post('/estudiante/registrar',$registrarEstudiante ,['ci_escolar',
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
  'id_estado_nutricional'],[$generarCedulaEscolar]);

Ruta::post('/estudiante/extra',$registrarDatosExtraEstudiante ,[
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


//
//
//Gestion_Inscripcion_Estudiante
//

//Peticion::metodo_get('/Gestion_Inscripcion_Estudiante',$registrarNiños,$valoresParaInscrion);

Ruta::get('/direccion/estado',$consultarEstado,['pais']);
Ruta::get('/direccion/municipio',$consultarMunicipio,['id_estado']);
Ruta::get('/direccion/municipio1',$consultarMunicipio,['estado1']);
Ruta::get('/direccion/municipio2',$consultarMunicipio,['estado2']);






Ruta::get('/direccion/parroquia2',$consultarParroquia2,['id_municipio']);
Ruta::get('/direccion/parroquia',$consultarParroquia,['estado']);

Ruta::get('/direccion/parroquia_1',$consultarParroquia2,['Municipio1']);

Ruta::get('/direccion/parroquia_2',$consultarParroquia2,['Municipio2']);



Ruta::get('/direccion/sector1',$consultarSector,['parroquia1']);
Ruta::get('/direccion/sector',$consultarSector,['parroquia2']);
//Ruta::get('/Gestion_Inscripcion_Estudiante',$consultarCalle,['calle']);


// Run the router 
Ruta::dispatch();