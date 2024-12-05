<?php
/*interface Peticion_Server {
 public function validar_metodo(string $metodo);
 public function validar_parametros($parametros,$variable_global);
 public function metodo_get($funcion,$parametros,$funcion_extra);
 public function metodo_post($funcion,$parametros,$funcion_extra);
}





class Peticion implements Peticion_Server {
  /*  public function __construct($objetos){
        $this->objetos=$objetos;
    }*/ /*
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

*/



interface Peticion_Server {
    public function validar_metodo(string $metodo): bool;
    public function validar_parametros(array $parametros, array $variable_global): bool;
    public function metodo_get(callable $funcion, array $parametros = [], array $funcion_extra = []);
    public function metodo_post(callable $funcion, array $parametros = [], array $funcion_extra = []);
}

class Peticion implements Peticion_Server {

    public function validar_parametros(array $parametros, array $variable_global): bool {
        foreach ($parametros as $parametro) {
            if (!isset($variable_global[$parametro])) {
                return false;
            }
        }
        return true;
    }

    public function validar_metodo(string $metodo): bool {
        return $_SERVER['REQUEST_METHOD'] === $metodo;
    }

    public function metodo_get(callable $funcion, array $parametros = [], array $funcion_extra = []) {
        if ($this->validar_metodo('GET')) {
            $numero_parametros = count($parametros);
            $numero_get = count($_GET);

            if ($numero_parametros === 0 && $numero_get === 0) {
                // No hay parámetros esperados y tampoco se recibieron
                $funcion($funcion_extra);
            } elseif ($numero_parametros === $numero_get && $this->validar_parametros($parametros, $_GET)) {
                // Se recibieron los parámetros esperados
                $funcion($_GET, $funcion_extra);
            }
        }
    }

    public function metodo_post(callable $funcion, array $parametros = [], array $funcion_extra = []) {
        if ($this->validar_metodo('POST')) {
            $numero_parametros = count($parametros);
            $numero_post = count($_POST);

            if ($numero_parametros === 0 && $numero_post === 0) {
                // No hay parámetros esperados y tampoco se recibieron
                $funcion($funcion_extra);
            } elseif ($numero_parametros === $numero_post && $this->validar_parametros($parametros, $_POST)) {
                // Se recibieron los parámetros esperados
                $funcion($_POST, $funcion_extra);
            }
        }
    }
}