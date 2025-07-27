<?php
(function(){
  global $GenerarMatriculaEscolar;
$GenerarMatriculaEscolar = function(){
    extract($_POST);
//periodo','edad','sexo
/*
 * id_anio_escolar INTEGER PRIMARY KEY AUTOINCREMENT,
 anio INTEGER NOT NULL,
 id_periodo_escolar INTEGER NOT NULL,
 id_aula INTEGER NOT NULL,
 ci_escolar INTEGER NOT NULL,
 */


$data = [ "campos"=>
      ['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
      'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
      'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,      'id_discapacidad', 'id_estado_nutricional']
];

if($sexo != 'todos')  $data['where'][] = ["campo"=>'sexo',"operador"=>'=',"valor"=>$sexo];

$añoEscolar = (new año_escolar)->consultar([
        "campos"=>['ci_escolar'],
        "where"=>[
           [ "campo"=>'id_periodo_escolar',
            "operador"=>'=',
            "valor"=>$periodo]
        ]
    ]);

if(count($añoEscolar) > 0){
    

foreach($añoEscolar as $año){
    $cis[] = $año['ci_escolar'];
}


  $data['where'][] = [
      "campo"=>'ci_escolar',
      "operador"=>'IN',
      "valores"=>$cis
  ];
}else{
    echo "<tr><td colspan='11' class='text-center'>No hay estudiantes de este periodo</td></tr>";
return;
}

//print_r($data);



  $estudiantes =  (new Estudiante)->consultar($data);
    
    if(count($estudiantes) < 1) {
            echo "<tr><td colspan='11' class='text-center'>No se an encontrado estudiantes </td></tr>";
            return;
    }
      
  
    foreach($estudiantes as $estudiante){
        
        if(Edad($estudiante['fecha_nacimiento']) != $edad && $edad != '') continue;
    
    plantilla('Reportes/tablaMatricula',$estudiante);
    }
};
})();