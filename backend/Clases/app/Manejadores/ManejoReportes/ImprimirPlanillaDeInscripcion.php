<?php

namespace Funciones\ManejoReportes;
use App\Controladores\Personas\Estudiante;
use App\Controladores\Inscripcion\Nacionalidad;
use Funciones\ImprimirPlanilla;
use Funciones\Edad;
use Funciones\ManejoDireccion\LugarDeNacimiento;


class ImprimirPlanillaDeInscripcion{
    public static function imprimirPlanilla(){
        $Extras = func_get_args();
        extract($Extras[0]);
        
        
          $estudiantes =  (new Estudiante)->consultar([ "campos"=>
             ['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
             'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
             'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,      'id_discapacidad', 'id_estado_nutricional'],
            "where"=>[
                ["campo"=>'ci_escolar',"operador"=>'=',"valor"=>$ci_escolar]
            ]
         
         ]);
        $estudiante = $estudiantes[0];
                     
  $estudiante['nacionalidad'] = (new Nacionalidad)->consultar(["campos"=>['nombre_nacionalidad'],
        "where"=>[
            ["campo"=>'id_nacionalidad',"operador"=>'=',"valor"=>$estudiantes[0]['id_nacionalidad']]
        ]])[0]['nombre_nacionalidad'];
    $estudiante['edad'] = Edad::Edad($estudiante['fecha_nacimiento']);
    $estudiante['lugar_nacimiento'] = LugarDeNacimiento::consultar_lugar_nacimiento($estudiante['id_lugar_nacimiento']);
      //  print_r($estudiantes);
         ImprimirPlanilla::imprimirPlanilla($estudiante);
        
        
    }
}