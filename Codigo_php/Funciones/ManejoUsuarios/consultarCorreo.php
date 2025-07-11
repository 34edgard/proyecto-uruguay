<?php

function optenerEmail($id_correo){
  return  (new correo())->consultar([
      "campos" => ["id_correo", "email"],
      "where"=>[
        ["campo"=>'id_correo',"operador"=>'=',"valor"=>$id_correo]
      ]  ])[0]["email"];
}