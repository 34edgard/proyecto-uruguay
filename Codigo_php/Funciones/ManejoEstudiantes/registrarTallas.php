<?php
function registrarTalla($cedula_escolar,$id_penda,$talla){
    (new tallas)->registrar([
        "campos"=>["ci_escolar","id_prenda","talla"],
        "valores"=>[$cedula_escolar, $id_penda, $talla]
       ]);
}