<?php
namespace Liki\Routing;
use Liki\Routing\ControlInterfaz;

class ValidarSesion{
public static function validar_sesion($name = 'cedula'){
    

if (session_id() == "") {
  session_start();
  if (!isset($_SESSION[$name])) {
 //header("Location: ./");
 //$_SERVER['REQUEST_URI']='/';
 //print_r($_SESSION);
  //print_r($_SERVER['REQUEST_URI']);
 //include "./Publico/Paginas/index.php";
ControlInterfaz::cambiarPagina('');
   exit();
  }
}

}
}