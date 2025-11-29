<?php


use Liki\Plantillas\Plantilla;
use App\Personas\Estudiante;




 return new class {
  public static function run($p){
 
extract($p);



 $estudiante =  (new Estudiante)->consultar([ "campos"=>
    ['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
    'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
    'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,      'id_discapacidad', 'id_estado_nutricional'],
    
    "where"=>[
        ["campo"=>'ci_escolar',"operador"=>'=',"valor"=>$formularioEdicion]
    ]
]);

//print_r($estudiante);

$datos['estudiante'] = $estudiante[0];
    Plantilla::HTML('Estudiante/MenuDeEdicion',$datos);
  }
};
