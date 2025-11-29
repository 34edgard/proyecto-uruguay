<?php


use Liki\Plantillas\Plantilla;
use Funciones\Edad;
use App\Direccion\Ubicacion;
use App\Direccion\LugarNacimiento;
use App\Personas\Estudiante;
use App\Inscripcion\Parentesco;


return new class {
  public static function run($p,$f){
    
   
   extract($p);



    //registrando la direccion
    
  (new Ubicacion)->registrar([
    "campos"=>['id_sector','nro_vivienda','calle_vereda_avenida'],  
     "valores"=>[$id_direccion,$nro_vivienda1,$descripcion_direccion]
  ]);



    /// consultando el id de la dieccion registrada
 $id_ubicacion=(new Ubicacion)->consultar([
   "campos"=>['id_sector','id_ubicacion'],
   "where"=>[
     ["campo"=>'id_sector',"operador"=>'=',"valor"=>$id_direccion]
   ],
   "orderBy"=>[
     "campo"=>'id_ubicacion',"direccion"=>'DESC'
   ],
   "limit"=>1

     ])[0]['id_ubicacion'];




    // registrando el lugar de nacimiento 
    //

    (new LugarNacimiento)->registrar([
      "campos"=>["id_estado","id_municipio","id_parroquia"],
      "valores"=>[$id_estado,$id_municipio,$id_parroquia]
    ]);

    //consultar id_lugar_nacimiento
      

$id_lugar_nacimiento=(new LugarNacimiento)->consultar([
  "campos"=>['id_estado','id_lugar_nacimiento'],
  "where"=>[
    ["campo"=>'id_estado',"operador"=>'=',"valor"=>$id_estado ]
  ],
  "orderBy"=>[
"campo"=>'id_lugar_nacimiento',"direccion"=>'DESC'
  ],
  "limit"=>1
     ])[0]['id_lugar_nacimiento'];




       $nci_escolar = $f[0]($ci_escolar,$fecha_nacimiento);

       $edad_ano = Edad::Edad($fecha_nacimiento);
       $edad_meses = Edad::Edad($fecha_nacimiento);
    
    
    (new Estudiante)->registrar([ "campos"=>
      ['ci_escolar',
       'nombres' , 
       'apellidos',   
       'fecha_nacimiento',
       'id_lugar_nacimiento', 
       'id_nacionalidad', 
       'edad_ano', 
       'edad_meses',
       'sexo' , 
       'id_ubicacion' , 
       'id_procedencia', 
       'id_condicion_medica' ,
       'id_discapacidad', 
       'id_estado_nutricional'],
      "valores"=>
      [$nci_escolar,
       $nombres,
       $apellidos,
       $fecha_nacimiento,
       $id_lugar_nacimiento,
       $id_nacionalidad,
       $edad_ano,$edad_meses,
       $sexo,$id_ubicacion,
       $id_procedencia,
       $id_condicion_medica,
       $id_discapacidad, 
       $id_estado_nutricional]

]);





$cedulas = [$ci_escolar,$ci_madre,$ci_padre];

foreach($cedulas as $id => $cedula){
    $reprecentantes[] = [
         "parentesco"=>$id,
         "cedula"=>$cedula
    ];
}


foreach($reprecentantes as $reprecentante){
      
 (new Parentesco)->registrar([
     "campos"=>['id_tipo_parentesco','cedula','ci_escolar'],
    "valores"=>[$reprecentante['parentesco'],$reprecentante['cedula'],$nci_escolar]
 ]);
}



    Plantilla::HTML("Inscripcion/DatosExtraNiño" ,[
      "cedula_escolar"=>$nci_escolar
    ]);
  }
};
