<?php


use Liki\Routing\Ruta;





use Funciones\ManejoReportes\GenerarMatriculaEscolar;
use Funciones\ManejoReportes\EstadisticaGeneral;
use Funciones\ManejoReportes\ConsultarPlanilla;
use Funciones\ManejoReportes\GenerarPlanilla;
use Funciones\ManejoReportes\ImprimirPlanillaDeInscripcion;
use App\Controladores\Personas\Estudiante;





return  function (){
        
 Ruta::get("/reportes/matricula",[Estudiante::class,'consultarMatriculaEscolar']);
Ruta::post("/matricula/generar",[GenerarMatriculaEscolar::class,'GenerarMatriculaEscolar'],['periodo','edad','sexo']);
Ruta::get("/estadistica/general",[EstadisticaGeneral::class,'estadisticaGeneral']);


Ruta::get("/planillas",[ConsultarPlanilla::class,'consultarPlanilla']);
Ruta::post("/planillas/tablas",[GenerarPlanilla::class,'generarPlanilla'],['periodo','edad','sexo','numeroEstudiantes']);




Ruta::get("/planilla/imprimir",[ImprimirPlanillaDeInscripcion::class,'imprimirPlanilla'],['ci_escolar']);


 
};