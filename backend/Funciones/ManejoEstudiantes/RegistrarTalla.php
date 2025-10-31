<?php


namespace Funciones\ManejoEstudiantes;


use App\DatosExtra\Tallas;


class RegistrarTalla{
public static function registrarTalla($cedula_escolar,$id_penda,$talla){
    (new Tallas)->registrar([
        "campos"=>["ci_escolar","id_prenda","talla"],
        "valores"=>[$cedula_escolar, $id_penda, $talla]
       ]);
}
}