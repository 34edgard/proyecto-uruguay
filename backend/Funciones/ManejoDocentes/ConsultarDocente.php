<?php
namespace Funciones\ManejoDocentes;
use Liki\Plantillas\Plantilla;
use App\Personas\Docente;
use Funciones\ManejoDocentes\NumeroTelefono;

  class ConsultarDocente{
  
  public static function consultarDocente(){
    $DOCENTE = new Docente();
    $res = $DOCENTE->consultar([
      "campos" => ["id_docente","cedula", "nombres", "apellidos", "fecha_nacimiento"]
    ]);
   
   $i=0;
    foreach ($res as $user) {
      $i++;
      $numero_telefono = NumeroTelefono::consultar($user['id_docente']);
$aula_asignada = "ningina";
$user['i'] = $i;
$user['numero_telefono'] = $numero_telefono;
$user['aula_asignada'] = $aula_asignada;
Plantilla::HTML("Docente/tabla",$user);

      
    }
  }
}
