<?php
function registrarDocumentosInscripcion($cedula_escolar,$id_tipo_documento,$estado,$observaciones="ninguna"){
    (new documentos_inscripcion)->registrar([
        "campos"=>["ci_escolar","id_tipo_documento","estado","observaciones"],
        "valores"=>[$cedula_escolar, $id_tipo_documento, $estado, $observaciones]
       ]);
}