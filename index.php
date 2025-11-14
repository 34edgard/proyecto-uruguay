<?php
include "./conf.php";
include "./backend/autoload.php";





use Liki\Testing\TestingRutas;

use Liki\Routing\Ruta;
use Liki\Plantillas\Plantilla;
use Liki\Sesion;

use App\DatosExtra\Rol;
use App\Personas\Usuario;
use App\Personas\Docente;







//use Funciones\ManejoDocentes\ConsultarDocente;
use Funciones\ManejoDocentes\ConsultarDocenteCI;
use Funciones\ManejoDocentes\ImprimirDocentes;
use Funciones\ManejoDocentes\RegistrarDocente;
use Funciones\ManejoDocentes\EditarDocente;
use Funciones\ManejoDocentes\FormularioEdicionDocente;
use Funciones\ManejoDocentes\ConfirmarEliminacionDocente;
use Funciones\ManejoDocentes\EliminarDocente;






use Funciones\RegistrarTelefono;



use Funciones\DatosPersonales\Sexos;
use Funciones\DatosPersonales\ConsultaDeOcupacion;
use Funciones\DatosPersonales\NivelDeInstruccion;
use Funciones\DatosPersonales\CedulaEscolar;




use Funciones\ManejoDatosExtras\ConsultarProcedencia;
use Funciones\ManejoDatosExtras\ConsultarNacionalidad;
use Funciones\ManejoDatosExtras\ConsultarEstadoNutricional;
use Funciones\ManejoDatosExtras\ConsultarCondicionMedica;
use Funciones\ManejoDatosExtras\ConsultarDiscapacidad;


use Funciones\ManejoDireccion\ConsultarEstados;
use Funciones\ManejoDireccion\ConsultarMunicipio;
use Funciones\ManejoDireccion\ConsultarParroquia;
use Funciones\ManejoDireccion\ConsultarParroquias;
use Funciones\ManejoDireccion\ConsultarSector;




use Funciones\ManejoReprecentantes\RegistrarReprecentante;
use Funciones\ManejoReprecentantes\RegistrarDatosExtraReprecentante;
use Funciones\ManejoReprecentantes\ConsultarReprecentanteBuscarCi;
use Funciones\ManejoReprecentantes\ConsultarReprecentanteCi;


use Funciones\ManejoEstudiantes\RegistrarEstudiante;
use Funciones\ManejoEstudiantes\RegistrarDatosExtraEstudiante;
use Funciones\ManejoEstudiantes\ConsultarEstudiantes;
use Funciones\ManejoEstudiantes\FormularioEdicionEstudiante;
use Funciones\ManejoEstudiantes\ConfirmarEliminacionEstudiante;

use Funciones\ManejoPeriodoEscolar\ConsultarPeriodoEscolar;
use Funciones\ManejoPeriodoEscolar\ConsultarPeriodo;
use Funciones\ManejoPeriodoEscolar\CrearPeriodoEscolar;


use Funciones\ManejoNiveles\ConsultarNivel;
use Funciones\ManejoNiveles\ConsultarNiveles;
use Funciones\ManejoNiveles\CrearNivel;


use Funciones\ManejoSecciones\ConsultarSecciones;
use Funciones\ManejoSecciones\ConsultarSeccion;
use Funciones\ManejoSecciones\CrearSeccion;



use Funciones\ManejoAulas\ConsultarAulas;
use Funciones\ManejoAulas\ConsultoAula;
use Funciones\ManejoAulas\CrearAula;




use Funciones\ManejoAnioEscolar\RegistroAnioEscolar;
use Funciones\ManejoAnioEscolar\ConsultoAnioEscolar;


use Funciones\ManejoReportes\ConsultarMatriculaEscolar;
use Funciones\ManejoReportes\GenerarMatriculaEscolar;
use Funciones\ManejoReportes\EstadisticaGeneral;
use Funciones\ManejoReportes\ConsultarPlanilla;
use Funciones\ManejoReportes\GenerarPlanilla;
use Funciones\ManejoReportes\ImprimirPlanillaDeInscripcion;




use Funciones\BdSQLWeb;

use Liki\ErrorHandler;


use Liki\Database\MigrationRunner;







Ruta::get('/migracion',function(){
    
  $d = new  MigrationRunner();
    
});




Ruta::get('/testing/rutas',function(){
    TestingRutas::procesar_testing();
    
    // Mostrar interfaz de testing
    TestingRutas::mostrar_rutas_disponibles();
});



Ruta::get('/',function(){
    
  Plantilla::pagijnas('Gestion_Sesion');
  
});

Ruta::get('/index.php',function(){

Plantilla::paginas('Gestion_Sesion');

});


Ruta::get('/inicio',function(){
 Plantilla::paginas('inicio');
});

Ruta::get('/Administrar',function(){
  Plantilla::paginas('Administrar');
});


Ruta::get('/Cerrar_Sesion',[Sesion::class,'cerrar_sesion']);

Ruta::post('/iniciar/sesion',[Sesion::class,'iniciar_sesion'],['Inicio_secion','correo','contraseña']);



//Gestion_Usuario

Ruta::post('/usuario/crear',[Usuario::class,'crear_usuario'],
['Crear_usuario','cedula','nombre','apellido','correo','usuario','rol','contraseña']);


Ruta::get('/usuario/list',[Usuario::class,'consultar_usuario']);

Ruta::get('/usuario/rol',[Rol::class,'consultar_rol'],['rol']);


Ruta::get('/usuario/cedula',[Usuario::class,'consultar_usuario_ci'],['ci']);

Ruta::get('/usuario/eliminar',[Usuario::class,'eliminar_usuario'],['eliminarUsuario','ci'],
[[Usuario::class,'consultar_usuario']]);


Ruta::get('/usuario/cambiarEstadoUsuario',[Usuario::class,'cambiarEstado'],['cambiarEstadoUsuario','ci']);


Ruta::get('/usuario/form/edicion',[Usuario::class,'editar_usuario_form'],['formularioEdicion']);

Ruta::get('/usuario/eliminar_confir',[Usuario::class,'confirmarEliminacion'],['confimarEliminacion']);


Ruta::post('/usuario/editar',[Usuario::class,'editar_usuario'],['EditarUsuario','ci','nombre','nombre_usuario','correo','apellido','contraseña','rol'],[[Usuario::class,'consultar_usuario']]);



// Gestion_Docente.php
//



Ruta::get('/docente',[Docente::class,'consultarDocente']);

Ruta::get('/docente/ci',[ConsultarDocenteCI::class,'consultarDocenteCI'],['ci']);

Ruta::get('/docente/ci/imprimir',[ImprimirDocentes::class,'imprimirDocenteCI'],['ci']);

Ruta::get('/docente/formulario',[FormularioEdicionDocente::class,'formularioEdicion'],['formularioEdicion']);

Ruta::get('/docente/eliminar',[EliminarDocente::class,'eliminarDocente'],['eliminar'],
[[ConsultarDocente::class,'consultarDocente']]);

Ruta::get('/docente/confirmar/eliminacion',[ConfirmarEliminacionDocente::class,'confirmarEliminacion'],['ConfirmarEliminacion']);

Ruta::post('/docente/registrar',[RegistrarDocente::class,'registrarDocente'],['formulario','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono'],
[[RegistrarTelefono::class,'registrarTelefono']]);

Ruta::post('/docente/editar',[EditarDocente::class,'editarDocente'],['Editar','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono'],
[[ConsultarDocente::class,'consultarDocente']]);





Ruta::get('/estudiante/sexo',[Sexos::class,'optenerSexos'],["sexo"]);

Ruta::get('/estudiante/procedencia',[ConsultarProcedencia::class,'consultarProcedencia'],['id_procedencia']);

Ruta::get('/estudiante/cedula',[CedulaEscolar::class,'generarCedulaEscolar'],['ci_escolar']);

Ruta::get('/estudiante/ocupacion',[ConsultaDeOcupacion::class,'consultarOcupacion'],['id_ocupacion']);

Ruta::get('/estudiante/nacionalidad',[ConsultarNacionalidad::class,'consultarNacionalidad'],['id_nacionalidad']);

Ruta::get('/estudiante/nivel_instruccion',[NivelDeInstruccion::class,'consultarNivelInstruccion'],['id_nivel_instruccion']);

Ruta::get('/estudiante/estado_nutricional',[ConsultarEstadoNutricional::class,'consultarEstadoNutricional'],['id_estado_nutricional']);

Ruta::get('/estudiante/condicion_medica',[ConsultarCondicionMedica::class,'consultarCondicionMedica'],['id_condicion_medica']);

Ruta::get('/estudiante/discapacidad',[ConsultarDiscapacidad::class,'consultarDiscapacidad'],['id_discapacidad']);


Ruta::get('/estudiante/form/edicion',[FormularioEdicionEstudiante::class,'FormularioEdicionEstudiante'],['formularioEdicion']);

Ruta::get('/estudiante/eliminar_confir',[ConfirmarEliminacionEstudiante::class,'confirmarEliminacionEstudiante'],['ci_escolar']);

Ruta::get('/estudiante/eliminar',function(){
    echo 'ddddd';
},['ci_escolar']);


Ruta::get('/direccion/estado',[ConsultarEstados::class,'consultarEstado'],['pais']);
Ruta::get('/direccion/municipio',[ConsultarMunicipio::class,'consultarMunicipio'],['id_estado']);
Ruta::get('/direccion/municipio1',[ConsultarMunicipio::class,'consultarMunicipio'],['estado1']);
Ruta::get('/direccion/municipio2',[ConsultarMunicipio::class,'consultarMunicipio'],['estado2']);
Ruta::get('/direccion/parroquia2',[ConsultarParroquias::class,'consultarParroquias'],['id_municipio']);
Ruta::get('/direccion/parroquia',[ConsultarParroquia::class,'consultarParroquia'],['estado']);
Ruta::get('/direccion/parroquia_1',[ConsultarParroquias::class,'consultarParroquias'],['Municipio1']);
Ruta::get('/direccion/parroquia_2',[ConsultarParroquias::class,'consultarParroquias'],['Municipio2']);
Ruta::get('/direccion/sector1',[ConsultarSector::class,'consultarSector'],['parroquia1']);
Ruta::get('/direccion/sector',[ConsultarSector::class,'consultarSector'],['parroquia2']);







Ruta::post('/reprecentante/registrar',[RegistrarReprecentante::class,'registrarReprecentante'],[ 
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



Ruta::post('/reprecentante/extra',[RegistrarDatosExtraReprecentante::class,'registrarDatosExtraReprecentante'],['numero_telefono','id_propietario','tipo_telefono'],[ [RegistrarTelefono::class,'registrarTelefono']]);



Ruta::get('/reprecentantes/ci',[ConsultarReprecentanteCi::class,'consultarReprecentanteCi']);
Ruta::post('/reprecentantes/buscar/ci',[ConsultarReprecentanteBuscarCi::class,'consultarReprecentanteBuscarCi'],['buscar_ci']);





Ruta::post('/estudiante/registrar',[RegistrarEstudiante::class,'registrarEstudiante'] ,[
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
Ruta::post('/estudiante/extra',[RegistrarDatosExtraEstudiante::class,'registrarDatosExtraEstudiante'] ,[
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





//Gestion_plantel
//




Ruta::post('/plantel/periodo/crear',[CrearPeriodoEscolar::class,'crearPeriodoEscolar'],['inicio_periodo','fin_periodo'],[[ConsultarPeriodoEscolar::class,'consultarPeriodoEscolar']]);
Ruta::post('/plantel/periodo/consultar',[ConsultarPeriodoEscolar::class,'consultarPeriodoEscolar']);
Ruta::get('/plantel/periodo/escolar',[ConsultarPeriodo::class,'consultarPeriodo'],['periodo_escolar']);
Ruta::get('/plantel/aulas',[ConsultarAulas::class,'consultarAulas'],['aula']);
Ruta::post('/plantel/nivel/crear',[CrearNivel::class,'crearNivel'],['nombre_nivel'],[[ConsultarNivel::class,'consultarNivel']]);
Ruta::get('/plantel/nivele',[ConsultarNivel::class,'consultarNivel'],['id_nivel']);
Ruta::get('/plantel/niveles',[ConsultarNiveles::class,'consultarNiveles'],['id_niveles']);

Ruta::post('/plantel/seccion/crear',[CrearSeccion::class,'crearSeccion'],['nombre_seccion','id_nivel'],[[ConsultarSecciones::class,'consultarSecciones']]);
Ruta::get('/plantel/secciones',[ConsultarSecciones::class,'consultarSecciones'],['id_secciones']);
Ruta::get('/plantel/seccion',[ConsultarSeccion::class,'consultarSeccion'],['id_seccion']);

Ruta::post('/plantel/aula/crear',[CrearAula::class,'crearAula'],['id_seccion','nombre_aula'],[[ConsultoAula::class,'consultarAula']]);
Ruta::get('/plantel/aulas/select',[ConsultarAulas::class,'consultarAulas']);
Ruta::get('/plantel/aula',[ConsultoAula::class,'consultarAula'],['id_aula']);

Ruta::post('/plantel/AnioEscolar/registrar',[RegistroAnioEscolar::class,'registrarAnioEscolar'],['tipo_plantel','ci_escolar','aula','periodo_escolar']);

Ruta::get('/plantel/AnioEscolar',[ConsultoAnioEscolar::class,'consultarAnioEscolar'],['id_inscritos']);












Ruta::get("/reportes/matricula",[ConsultarMatriculaEscolar::class,'consultarMatriculaEscolar']);
Ruta::post("/matricula/generar",[GenerarMatriculaEscolar::class,'GenerarMatriculaEscolar'],['periodo','edad','sexo']);
Ruta::get("/estadistica/general",[EstadisticaGeneral::class,'estadisticaGeneral']);


Ruta::get("/planillas",[ConsultarPlanilla::class,'consultarPlanilla']);
Ruta::post("/planillas/tablas",[GenerarPlanilla::class,'generarPlanilla'],['periodo','edad','sexo','numeroEstudiantes']);




Ruta::get("/planilla/imprimir",[ImprimirPlanillaDeInscripcion::class,'imprimirPlanilla'],['ci_escolar']);




Ruta::get('/reportes/ListaEstudiantes',[ConsultarEstudiantes::class,'ConsultarEstudiantes']);



Ruta::get('/bdSQLWeb',function(){
    BdSQLWeb::bdSQLWeb();
});





// Run the router 
Ruta::dispatch();