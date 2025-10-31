<?php

namespace Funciones\ManejoEstudiantes;

use App\Inscripcion\Inscripciones;


class RegistrarInscripcion{

public static function registrarInscripcion($cedula_escolar,$fechaInscripcion){
    (new Inscripciones)->registrar([
        "campos"=>["ci_escolar","fecha_inscripcion"],
        "valores"=>[$cedula_escolar, $fechaInscripcion]
       ]);

  return  (new Inscripciones)->consultar([
    "campos"=>["ci_escolar","id_inscripcion"],
    "where"=>[
      ["campo"=>'ci_escolar',"operador"=>'=',"valor"=>$cedula_escolar]
    ],
    "orderBy"=>[
     "campo"=>'id_inscripcion',"direccion"=>'DESC'
    ],
    "limit"=>1
        ]
    )[0]["id_inscripcion"];
}


}



///inscripciones_estudiante

