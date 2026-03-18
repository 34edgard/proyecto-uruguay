<?php

namespace Funciones\ManejoReportes;
use App\Controladores\Personas\Estudiante;

use Liki\Plantillas\Flow;
use App\Controladores\Plantel\AnioEscolar;

use Funciones\Edad;
use Funciones\ManejoDireccion\LugarDeNacimiento;



class GenerarMatriculaEscolar{
public static function GenerarMatriculaEscolar(){
   
$Extras = func_get_args();
 extract($Extras[0]);
   // print_r($Extras);



$data = [ "campos"=>
      ['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
      'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
      'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,      'id_discapacidad', 'id_estado_nutricional']
];

if($sexo != 'todos')  $data['where'][] = ["campo"=>'sexo',"operador"=>'=',"valor"=>$sexo];

$añoEscolar = (new AnioEscolar)->consultar([
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
      
 // print_r($edad);
    foreach($estudiantes as $estudiante){
        $estudiante['lugar_nacimiento']  = LugarDeNacimiento::consultar_lugar_nacimiento($estudiante['id_lugar_nacimiento']);
        $estudiante['edad']= Edad::Edad($estudiante['fecha_nacimiento']);
        if($estudiante['edad'] != $edad && $edad != '') continue;
   

 
    Flow::html('Reportes/tablaMatricula',$estudiante);
    }
}
}