
<?php
use App\Controladores\Personas\Docente;
use App\Controladores\DatosExtra\Telefono;
use Liki\Routing\Ruta;
use Liki\Plantillas\Flow;



return  function (){
        



Ruta::get('/docente',[Docente::class,'consultarDocente']);

Ruta::get('/docente/ci',[Docente::class,'consultarDocenteCI'],['ci']);

Ruta::get('/docente/ci/imprimir',[Docente::class,'imprimirDocenteCI'],['ci']);

Ruta::get('/docente/formulario',[Docente::class,'formularioEdicion'],['formularioEdicion']);

Ruta::get('/docente/eliminar',[Docente::class,'eliminarDocente'],['eliminar'],
[[Docente::class,'consultarDocente']]);

Ruta::get('/docente/confirmar/eliminacion',[Docente::class,'confirmarEliminacion'],['ConfirmarEliminacion']);

Ruta::post('/docente/registrar',[Docente::class,'registrarDocente'],['formulario','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono','id_aula'],
[[Telefono::class,'registrarTelefono']]);




Ruta::post('/docente/editar',[Docente::class,'editarDocente'],['Editar','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono','id_aula'],
[[Docente::class,'consultarDocente']]);

};