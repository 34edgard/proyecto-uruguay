<?php

//namespace Funciones\ManejoDocentes;
use App\DatosExtra\Telefono;

return new class {

public static function run($id_docente){
return  (new Telefono())->consultar([
    "campos" => ["id_docente","numero_telefono"],
        "where"=>[
          ["campo"=>'id_docente',"operador"=>'=',"valor"=>$id_docente]
        ]  
      ])[0]["numero_telefono"]; 
}
};