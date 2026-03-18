<?php

namespace Funciones\ManejoReportes;
use App\Controladores\Personas\Estudiante;
use Liki\Plantillas\Flow;
use Funciones\Edad;

class GenerarPlanilla{
    public static function generarPlanilla(){
 // periodo,edad,sexo,numeroEstudiantes
$Estras = func_get_args();

extract($Estras[0]);

$data = [ "campos"=>
 ['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
 'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
 'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,   
 'id_discapacidad', 'id_estado_nutricional'],

"limit"=>$numeroEstudiantes
];


if($sexo != 'todo') $data["where"] = [
    ["campo"=>'sexo',"operador"=>'=',"valor"=>$sexo]
];



  $estudiantes =  (new Estudiante)->consultar($data);
          
          foreach($estudiantes as $estudiante){
              $estudiante['edad'] =Edad::Edad($estudiante['fecha_nacimiento']);
          if($estudiante['edad'] != $edad && $edad != '') continue;
          Flow::html('Reportes/tablaPlanillas',$estudiante);
          }
        
        
        
        
    }
}