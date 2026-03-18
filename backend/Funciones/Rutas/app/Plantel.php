<?php
use Liki\Routing\Ruta;

use App\Controladores\Plantel\Niveles;
use App\Controladores\Plantel\Secciones;
use App\Controladores\Plantel\Aulas;
use App\Controladores\Plantel\PeriodoEscolar;


//use Funciones\ManejoPeriodoEscolar\ConsultarPeriodoEscolar;
//use Funciones\ManejoPeriodoEscolar\ConsultarPeriodo;
//use Funciones\ManejoPeriodoEscolar\CrearPeriodoEscolar;




//use Funciones\ManejoAnioEscolar\RegistroAnioEscolar;
//use Funciones\ManejoAnioEscolar\ConsultoAnioEscolar;



return  function (){
        
    Ruta::post('/plantel/periodo/crear',[PeriodoEscolar::class,'crearPeriodoEscolar'],['inicio_periodo','fin_periodo'],[[PeriodoEscolar::class,'consultarPeriodoEscolar']]);
Ruta::post('/plantel/periodo/consultar',[PeriodoEscolar::class,'consultarPeriodoEscolar']);
Ruta::get('/plantel/periodo/escolar',[PeriodoEscolar::class,'consultarPeriodo'],['periodo_escolar']);




Ruta::post('/plantel/nivel/crear',[Niveles::class,'crearNivel'],['nombre_nivel'],[[Niveles::class,'consultarNivel']]);
Ruta::get('/plantel/nivele',[Niveles::class,'consultarNivel'],['id_nivel']);
Ruta::get('/plantel/niveles',[Niveles::class,'consultarNiveles'],['id_niveles']);

Ruta::post('/plantel/seccion/crear',[Secciones::class,'crearSeccion'],['nombre_seccion','id_nivel'],[[Secciones::class,'consultarSecciones']]);
Ruta::get('/plantel/secciones',[Secciones::class,'consultarSecciones'],['id_secciones']);
Ruta::get('/plantel/seccion',[Secciones::class,'consultarSeccion'],['id_seccion']);
Ruta::get('/plantel/seccion/eliminar',[Secciones::class,'eliminarSeccion'],['eliminarSeccion'],[
    [Secciones::class,'consultarSecciones']
]);


Ruta::get('/plantel/seccion/confirm_eliminar',[Secciones::class,'confirmarEliminacion'],['ConfirmarEliminacion']);

Ruta::get('/plantel/aulas',[Aulas::class,'consultarAulas'],['aula']);

Ruta::post('/plantel/aula/crear',[Aulas::class,'crearAula'],['id_seccion','nombre_aula'],[[Aulas::class,'consultarAula']]);
Ruta::get('/plantel/aulas/select',[Aulas::class,'consultarAulas']);

Ruta::get('/plantel/aula',[Aulas::class,'consultarAula'],['id_aula']);

//Ruta::post('/plantel/AnioEscolar/registrar',[RegistroAnioEscolar::class,'registrarAnioEscolar'],['tipo_plantel','ci_escolar','aula','periodo_escolar']);

//Ruta::get('/plantel/AnioEscolar',[ConsultoAnioEscolar::class,'consultarAnioEscolar'],['id_inscritos']);



  
};