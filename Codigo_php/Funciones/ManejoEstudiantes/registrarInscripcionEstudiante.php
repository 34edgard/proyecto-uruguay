<?php
function registrarInscripcionEstudiante($cedula_escolar,$id_inscripcion){
    (new inscripciones_estudiante)->registrarDato([
        "campos"=>["ci_escolar","id_inscripcion"],
        "valores"=>[$cedula_escolar, $id_inscripcion]
       ]);



    }







