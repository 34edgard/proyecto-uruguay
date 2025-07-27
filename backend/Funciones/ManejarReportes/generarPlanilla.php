<?php
(function(){
    global $generarPlanilla;
    $generarPlanilla =function(){
 // periodo,edad,sexo,numeroEstudiantes
extract($_POST);

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
              
          if(Edad($estudiante['fecha_nacimiento']) != $edad && $edad != '') continue;
          plantilla('Reportes/tablaPlanillas',$estudiante);
          }
        
        
        
        
    };
})();