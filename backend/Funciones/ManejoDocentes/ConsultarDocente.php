<?php
namespace Funciones\Docentes;

(function (){
  global $consultarDocente;
  
  $consultarDocente = function () {
    $DOCENTE = new Docente();
    $res = $DOCENTE->consultar([
      "campos" => ["id_docente","cedula", "nombres", "apellidos", "fecha_nacimiento"]
    ]);
   
   $i=0;
    foreach ($res as $user) {
      $i++;
      $numero_telefono = consultarNumeroTelefonoDocente($user['id_docente']);
$aula_asignada = "ningina";
$user['i'] = $i;
$user['numero_telefono'] = $numero_telefono;
$user['aula_asignada'] = $aula_asignada;
plantilla("Docente/tabla",$user);

      
    }
  };
})();
