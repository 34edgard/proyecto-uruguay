<?php
function consultarNumeroTelefonoDocente($id_docente){
return  (new Telefono())->consultarDato([
    "campos" => ["id_docente","numero_telefono"],
        "where"=>[
          ["campo"=>'id_docente',"operador"=>'=',"valor"=>$id_docente]
        ]  
      ])[0]["numero_telefono"]; 
}
