<?php

namespace Funciones\ManejoEstudiantes;

use Liki\Plantillas\Plantilla;
use Funciones\Edad;
use App\Direccion\Ubicacion;
use App\Direccion\LugarNacimiento;
use App\Personas\Estudiante;
use App\Inscripcion\Parentesco;

use Funciones\ManejoDireccion\LugarDeNacimiento;



class ConsultarEstudiantes{
public static function consultarEstudiantes(){
    session_start();
  $estudiantes =  (new Estudiante)->consultar([ "campos"=>
       ['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
       'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
       'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,      'id_discapacidad', 'id_estado_nutricional']
    ]);
    
    
    
    
    foreach($estudiantes as $estudiante){
        
       // print_r($estudiante);
     $estudiante['lugar_nacimiento']  = LugarDeNacimiento::consultar_lugar_nacimiento($estudiante['id_lugar_nacimiento']);
      $estudiante['reprecentantes'] = [];
    Plantilla::HTML('Reportes/listaDeEstudiantes',$estudiante);
    }
}
}

