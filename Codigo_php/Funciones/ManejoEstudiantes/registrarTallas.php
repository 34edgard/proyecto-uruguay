<?php
function registrarTalla($cedula_escolar,$id_penda,$talla){
    (new tallas)->registrarDato([
        "campos"=>["ci_escolar","id_prenda","talla"],
        "valores"=>[$cedula_escolar, $id_penda, $talla]
       ]);
}