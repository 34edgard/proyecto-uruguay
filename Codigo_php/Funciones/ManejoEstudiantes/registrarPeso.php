<?php
function registrarPeso($cedula_escolar,$peso){
    (new peso)->registrar([
        "campos"=>["ci_escolar","peso"],
        "valores"=>[$cedula_escolar, $peso]
       ]);
}