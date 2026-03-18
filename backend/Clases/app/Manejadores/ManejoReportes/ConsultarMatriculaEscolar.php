<?php
use App\Controladores\Personas\Estudiante;
use Liki\Database\FlowDB;
use Liki\Plantillas\Flow;
use Funciones\ManejoDireccion\LugarDeNacimiento;
use Funciones\Edad;
return new class {
public static function consultarMatriculaEscolar(){
    
  $estudiantes =  FlowDB::conf(Estudiante::class)->campos(['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
       'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
       'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,      'id_discapacidad', 'id_estado_nutricional']
    )->get();
    
    foreach($estudiantes as $estudiante){
       // print_r($estudiante);
     $estudiante['lugar_nacimiento']  = LugarDeNacimiento::consultar_lugar_nacimiento($estudiante['id_lugar_nacimiento']);
     $estudiante['edad']= Edad::Edad($estudiante['fecha_nacimiento']);
       
    Flow::html('Reportes/tablaMatricula',$estudiante);
    }
}
};