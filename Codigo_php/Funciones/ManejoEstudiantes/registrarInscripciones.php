<?php
function registrarInscripcion($cedula_escolar,$fechaInscripcion){
    (new inscripciones)->registrarDato([
        "campos"=>["ci_escolar","fecha_inscripcion"],
        "valores"=>[$cedula_escolar, $fechaInscripcion]
       ]);

  return  (new inscripciones)->consultarDato([
        "campos"=>["ci_escolar","id_inscripcion"],
        "valores"=>$cedula_escolar." ORDER BY `id_inscripcion` DESC LIMIT 1" 
        ]
    )[0]["id_inscripcion"];
}






///inscripciones_estudiante

