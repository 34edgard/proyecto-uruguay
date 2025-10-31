<?php

namespace Funciones\ManejoEstudiantes;

use App\Inscripcion\InscripcionesEstudiante;

class RegistrarInscripcionEstudiante{
public static function registrarInscripcionEstudiante($cedula_escolar,$id_inscripcion){
    (new InscripcionesEstudiante)->registrar([
        "campos"=>["ci_escolar","id_inscripcion"],
        "valores"=>[$cedula_escolar, $id_inscripcion]
       ]);



    }

}





