<?php
include "./Codigo_php/includer.php";
//print_r($_POST);
Peticion::metodo_get('/inicio',function(){
include "./Publico/Paginas/pag_1.php";
});

Peticion::metodo_get('/Administrar',function(){
  include "./Publico/Paginas/pag_6.php";
});
Peticion::metodo_get('/',function(){
  include "./Publico/Paginas/index.php";
});

//Gestion_Sesion
Peticion::metodo_get('/Gestion_Sesion',function(){
include "./Publico/Paginas/pag_0.php";
});

Peticion::metodo_get('/Gestion_Sesion',$cerrar_sesion,['cerrar_sesion']);
Peticion::metodo_post('/Gestion_Sesion',$iniciar_sesion,['Inicio_secion','cedula','contraseña'],[$validar_datosDB]);

//Gestion_Usuario
//


Peticion::metodo_post('/Gestion_Usuario',$crear_usuario,['Crear_usuario','cedula','nombre','apellido','correo','usuario','rol','contraseña'],[$consultar_usuario]);

Peticion::metodo_get('/Gestion_Usuario',$consultar_usuario);
Peticion::metodo_get('/Gestion_Usuario',$consultar_rol,['rol']);
Peticion::metodo_get('/Gestion_Usuario',$consultar_usuario_ci,['consultar_usuario_ci','ci']);

Peticion::metodo_get('/Gestion_Usuario',$eliminar_usuario,['eliminarUsuario','ci'],[$consultar_usuario]);


Peticion::metodo_get('/Gestion_Usuario',$cambiarEstado,['cambiarEstadoUsuario','ci']);


Peticion::metodo_get('/Gestion_Usuario',$editar_usuario_form,['formularioEdicion']);
Peticion::metodo_get('/Gestion_Usuario',$confirmarEliminacion,['confimarEliminacion']);
Peticion::metodo_post('/Gestion_Usuario',$editar_usuario,['EditarUsuario','ci','nombre','apellido','contraseña','rol'],[$consultar_usuario]);

//
//
// Gestion_Docente.php
//


Peticion::metodo_get('/Gestion_Docente',$consultarDocente);
Peticion::metodo_get('/Gestion_Docente',$consultarDocenteCI,['ci']);
Peticion::metodo_get('/Gestion_Docente',$formularioEdicion,['formularioEdicion']);
Peticion::metodo_get('/Gestion_Docente',$eliminarDocente,['eliminar'],[$consultarDocente]);
Peticion::metodo_get('/Gestion_Docente',$ConfirmarEliminacion,['ConfirmarEliminacion']);
Peticion::metodo_post('/Gestion_Docente',$registrarDocente,['formulario','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono'],[$registrarTelefono]);
Peticion::metodo_post('/Gestion_Docente',$editarDocente,['Editar','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono'],[$consultarDocente]);


//
//Gestion_plantel
//




Peticion::metodo_post('/Gestion_plantel',$crearPeriodoEscolar,['inicio_periodo','fin_periodo'],[$consultarPeriodoEscolar]);
Peticion::metodo_post('/Gestion_plantel',$consultarPeriodoEscolar,[]);
Peticion::metodo_get('/Gestion_plantel',$consultarPeriodo,['periodo_escolar']);
Peticion::metodo_get('/Gestion_plantel',$consultarAulas,['aula']);
Peticion::metodo_get('/,Gestion_plantel',$crearNivel,['nombre_nivel'],[$consultarNivel]);
Peticion::metodo_get('/Gestion_plantel',$consultarNivel,['id_nivel']);
Peticion::metodo_get('/Gestion_plantel',$consultarNiveles,['id_niveles']);

Peticion::metodo_post('/Gestion_plantel',$crearSeccion,['nombre_seccion','id_nivel'],[$consultarSecciones]);
Peticion::metodo_get('/Gestion_plantel',$consultarSecciones,['id_secciones']);
Peticion::metodo_get('/Gestion_plantel',$consultarSeccion,['id_seccion']);

Peticion::metodo_post('/Gestion_plantel',$crearAula,['id_seccion','nombre_aula'],[$consultarAula]);
Peticion::metodo_get('/Gestion_plantel',$consultarAulas,['id_aulas']);
Peticion::metodo_get('/Gestion_plantel',$consultarAula,['id_aula']);

Peticion::metodo_post('Gestion_plantel',$registrarAnioEscolar,['ci_escolar','aula','periodo_escolar']);

Peticion::metodo_get('/Gestion_plantel',$consultarAnioEscolar,['id_inscritos']);

//
//
//
//Gestion_Info_Estudiante_Reprecentante
//
//



Peticion::metodo_get('/Gestion_Info_Estudiante_Reprecentante',$optenerSexos,["sexo"]);


Peticion::metodo_get('/Gestion_Info_Estudiante_Reprecentante',$generarCedulaEscolar,['ci_escolar']);
Peticion::metodo_get('/Gestion_Info_Estudiante_Reprecentante',$consultarOcupacion,['id_ocupacion']);
Peticion::metodo_get('Gestion_Info_Estudiante_Reprecentante',$consultarNacionalidad,['id_nacionalidad']);
Peticion::metodo_get('/Gestion_Info_Estudiante_Reprecentante',$consultarNivelInstruccion,['id_nivel_instruccion']);
Peticion::metodo_get('/Gestion_Info_Estudiante_Reprecentante',$consultarEstadoNutricional,['id_estado_nutricional']);
Peticion::metodo_get('/Gestion_Info_Estudiante_Reprecentante',$consultarCondicionMedica,['id_condicion_medica']);
Peticion::metodo_get('/Gestion_Info_Estudiante_Reprecentante',$consultarDiscapacidad,['id_discapacidad']);
Peticion::metodo_get('Gestion_Info_Estudiante_Reprecentante',$consultarProcedencia,['id_procedencia']);

Peticion::metodo_post('/Gestion_Info_Estudiante_Reprecentante',$registrarReprecentante ,[ 
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
Peticion::metodo_post('/Gestion_Info_Estudiante_Reprecentante',$registrarDatosExtraReprecentante ,['numero_telefono','id_propietario','tipo_telefono'],[ $registrarTelefono]);
Peticion::metodo_post('/Gestion_Info_Estudiante_Reprecentante',$registrarEstudiante ,['ci_escolar',
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
Peticion::metodo_post('/Gestion_Info_Estudiante_Reprecentante',$registrarDatosExtraEstudiante ,[
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

Peticion::metodo_get('/Gestion_Inscripcion_Estudiante',$consultarEstado,['pais']);
Peticion::metodo_get('/Gestion_Inscripcion_Estudiante',$consultarMunicipio,['id_estado']);


Peticion::metodo_get('/Gestion_Inscripcion_Estudiante',$consultarParroquia2,['id_municipio']);
Peticion::metodo_get('/Gestion_Inscripcion_Estudiante',$consultarParroquia,['estado']);

Peticion::metodo_get('/Gestion_Inscripcion_Estudiante',$consultarSector,['parroquia1']);
Peticion::metodo_get('Gestion_Inscripcion_Estudiante',$consultarSector,['parroquia2']);
Peticion::metodo_get('/Gestion_Inscripcion_Estudiante',$consultarCalle,['calle']);
