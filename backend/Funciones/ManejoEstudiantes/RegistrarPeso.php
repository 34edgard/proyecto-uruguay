<?php

namespace Funciones\ManejoEstudiantes;

use App\Inscripcion\Peso;

class RegistrarPeso{
public static function registrarPeso($cedula_escolar,$peso){
    (new Peso)->registrar([
        "campos"=>["ci_escolar","peso"],
        "valores"=>[$cedula_escolar, $peso]
       ]);
}

}
