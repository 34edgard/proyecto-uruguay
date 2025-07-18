<?php
(function (){
  global $consultar_rol;
  $consultar_rol = function (){
    $roles = (new rol)->consultar(["campos"=>['id_rol','nombre_rol']]);
    foreach ($roles as $dato){
        plantilla("componentes/option",[
            "value"=>$dato['id_rol'],
            "contenido"=>$dato['nombre_rol']
        ]);
    }
    
  };
  
})();