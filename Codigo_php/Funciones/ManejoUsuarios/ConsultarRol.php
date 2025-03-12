<?php
(function (){
  global $consultar_rol;
  $consultar_rol = function (){
    $roles = (new rol)->consultarDato(["campos"=>['id_rol','nombre_rol']]);
    foreach ($roles as $rol){
      echo "<option value=\"{$rol["id_rol"]}\">";
      echo $rol["nombre_rol"];
      echo "</option>";
    }
    
  };
  
})();