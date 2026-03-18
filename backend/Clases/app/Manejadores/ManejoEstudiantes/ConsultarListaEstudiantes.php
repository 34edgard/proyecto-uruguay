<?php


use Liki\Plantillas\Flow;
use Funciones\Edad;
use App\Controladores\Direccion\Ubicacion;
use App\Controladores\Direccion\LugarNacimiento;
use App\Controladores\Personas\Estudiante;
use App\Controladores\Inscripcion\Parentesco;

use Funciones\ManejoDireccion\LugarDeNacimiento;

return new class {
public static function run(){
    session_start();
  $estudiantes =  (new Estudiante)->consultar([ "campos"=>
       ['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
       'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
       'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,      'id_discapacidad', 'id_estado_nutricional']
    ]);
    
    
    
    
    foreach($estudiantes as $estudiante){
        
     $estudiante['lugar_nacimiento']  = LugarDeNacimiento::consultar_lugar_nacimiento($estudiante['id_lugar_nacimiento']);
     $estudiante['reprecentantes'] = [];
     Flow::html('Reportes/listaDeEstudiantes',$estudiante);
    }
}
};

