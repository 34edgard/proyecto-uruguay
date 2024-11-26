<?php
interface Peticion_Server {
 public function validar_metodo(string $metodo);
 public function validar_parametros($parametros,$variable_global);
 public function metodo_get($funcion,$parametros,$funcion_extra);
 public function metodo_post($funcion,$parametros,$funcion_extra);
}





class Peticion implements Peticion_Server {
  /*  public function __construct($objetos){
        $this->objetos=$objetos;
    }*/
 public function validar_parametros($parametros,$variable_global){
   
     foreach ($parametros as $parametro){
        
       if(!isset($variable_global[$parametro])){
        return false;
       }
     }
    return true;
 }
 
 public function validar_metodo(string $metodo){
   
   if($_SERVER['REQUEST_METHOD'] === $metodo){
     return true;
   }
     return false;
   
 }
 public function metodo_get($funcion, $parametros = [],$funcion_extra=[]){
    
   if($this->validar_metodo('GET')){
    
     switch(sizeof($parametros)){
      
    case sizeof($_GET):
    if($this->validar_parametros($parametros,$_GET) ){
        
    $funcion($_GET,$funcion_extra);
    }
    break;
    case 0:
    if(sizeof($_GET) == 0){
      
    $funcion($funcion_extra);
    }
    break;
    
     }
   }
 }
 public function metodo_post($funcion, $parametros = [],$funcion_extra =[]){
   if($this->validar_metodo('POST')){
     
      switch(sizeof($parametros)){
       case sizeof($_POST):
        if($this->validar_parametros($parametros,$_POST) ){
      
          $funcion($_POST,$funcion_extra);
          
        }
       break;
       case 0 :
         if(sizeof($_POST) == 0){
          $funcion($funcion_extra);
         }
       break;
      }
   }
 }
 
}



