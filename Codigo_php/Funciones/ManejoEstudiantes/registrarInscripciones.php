<?php
function registrarInscripcion($cedula_escolar,$fechaInscripcion){
    (new inscripciones)->registrarDato([
        "campos"=>["ci_escolar","fecha_inscripcion"],
        "valores"=>[$cedula_escolar, $fechaInscripcion]
       ]);

  return  (new inscripciones)->consultarDato([
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






///inscripciones_estudiante

