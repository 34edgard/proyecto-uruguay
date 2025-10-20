<?php
(function (){
  
  global $iniciar_sesion;
  $iniciar_sesion = function () {
    $extras = func_get_args();
    extract( $extras[0]);
    // var_dump($extras);
    session_start();
    $arreglo = $extras[1][0]($correo, $contraseña);
    //return;
    if ($arreglo[0]) {
        
        foreach($arreglo[1][0] as $id => $campo){
            $_SESSION[$id] = $campo;
            
        }
        
       }
    
    
  };
  })();