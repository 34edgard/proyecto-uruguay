<?php


use Liki\Plantillas\Plantilla;
use App\Personas\Estudiante;


return new class {
    
    public static function run($p){
      
    extract($p);
    
    $estudiante =  (new Estudiante)->consultar([ "campos"=>
       ['ci_escolar', 'nombres' , 'apellidos'],
    "where"=>[
        ["campo"=>'ci_escolar',"operador"=>'=',"valor"=>$ci_escolar]
    ]
    ])[0];
    
    if(count($estudiante) > 0){
       
    
    Plantilla::HTML('Estudiante/ConfirmarEliminacion',$estudiante);
   return;
 }
    echo 'el niño no esta registrado';
    
     
    }
};