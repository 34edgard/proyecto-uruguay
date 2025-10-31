<?php

namespace Funciones\ManejoEstudiantes;


use App\Inscripcion\DocumentosInscripcion;


class RegistrarDocumentosInscripcion{

public static function registrarDocumentosInscripcion($cedula_escolar,$id_tipo_documento,$estado,$observaciones="ninguna"){
    (new DocumentosInscripcion)->registrar([
        "campos"=>["ci_escolar","id_tipo_documento","estado","observaciones"],
        "valores"=>[$cedula_escolar, $id_tipo_documento, $estado, $observaciones]
       ]);
}

}