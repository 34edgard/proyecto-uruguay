<?php

namespace Funciones\ManejoReportes;
use App\Controladores\Personas\Estudiante;
use Liki\Plantillas\Flow;
use Funciones\Edad;


class ConsultarPlanilla{
    public static function consultarPlanilla(){
        
          $estudiantes =  (new Estudiante)->consultar([ "campos"=>
             ['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
             'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
             'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,      'id_discapacidad', 'id_estado_nutricional']
          ]);
          
          foreach($estudiantes as $estudiante){
              
                 $estudiante['edad'] =Edad::Edad($estudiante['fecha_nacimiento']);
              //   print_r($estudiante);
        
         Flow::html('Reportes/tablaPlanillas',$estudiante);
          }
        
        
        
        
    }
}