<?php


use Liki\Plantillas\Flow;
use App\Controladores\Personas\Estudiante;


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
       
    
    Flow::html('Estudiante/ConfirmarEliminacion',$estudiante);
   return;
 }
    echo 'el niño no esta registrado';
    
     
    }
};