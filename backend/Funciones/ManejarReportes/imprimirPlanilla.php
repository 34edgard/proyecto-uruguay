<?php
(function(){
    global $imprimirPlanilla;
    $imprimirPlanilla =function(){
        extract($_GET);
          $estudiantes =  (new Estudiante)->consultar([ "campos"=>
             ['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
             'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
             'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,      'id_discapacidad', 'id_estado_nutricional'],
            "where"=>[
                ["campo"=>'ci_escolar',"operador"=>'=',"valor"=>$ci_escolar]
            ]
         
         ]);
        
                     
  $estudiantes[0]['nacionalidad'] = (new nacionalidad)->consultar(["campos"=>['nombre_nacionalidad'],
        "where"=>[
            ["campo"=>'id_nacionalidad',"operador"=>'=',"valor"=>$estudiantes[0]['id_nacionalidad']]
        ]])[0]['nombre_nacionalidad'];
        
      //  print_r($estudiantes);
         imprimirPlanilla($estudiantes[0]);
        
        
    };
})();