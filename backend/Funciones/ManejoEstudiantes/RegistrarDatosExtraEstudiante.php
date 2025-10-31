<?php

namespace Funciones\ManejoEstudiantes;

use Liki\Plantillas\Plantilla;
use Funciones\Edad;
use App\Direccion\Ubicacion;
use App\Direccion\LugarNacimiento;
use App\Personas\Estudiante;
use App\Inscripcion\Parentesco;

use Funciones\ManejoEstudiantes\RegistrarDocumentosInscripcion;
use Funciones\ManejoEstudiantes\RegistrarPeso;
use Funciones\ManejoEstudiantes\RegistrarTalla;
use Funciones\ManejoEstudiantes\RegistrarInscripcionEstudiante;
use Funciones\ManejoEstudiantes\RegistrarInscripcion;



class RegistrarDatosExtraEstudiante{
  public static function registrarDatosExtraEstudiante(){

 
   $Estras = func_get_args();
   extract($Estras[0]);
   


  
   RegistrarDocumentosInscripcion::registrarDocumentosInscripcion($cedula_escolar,1,$partida_nacimiento);
   RegistrarDocumentosInscripcion::registrarDocumentosInscripcion($cedula_escolar,2,$copia_cedula_madre);
   RegistrarDocumentosInscripcion::registrarDocumentosInscripcion($cedula_escolar,3,$copia_cedula_padre);
   RegistrarDocumentosInscripcion::registrarDocumentosInscripcion($cedula_escolar,4,$fotos_tipo_carnet);
   RegistrarDocumentosInscripcion::registrarDocumentosInscripcion($cedula_escolar,5,$copia_certificado_vacuna);
   RegistrarTalla::registrarTalla($cedula_escolar,1,$talla_camisa);
   RegistrarTalla::registrarTalla($cedula_escolar,2,$talla_pantalon);
   RegistrarTalla::registrarTalla($cedula_escolar,3,$talla_zapato);
   RegistrarTalla::registrarTalla($cedula_escolar,4,$circunferencia_braquial);
   RegistrarPeso::registrarPeso($cedula_escolar,$peso);
    
   $id_inscripcion = RegistrarInscripcion::registrarInscripcion($cedula_escolar, date("Y-m-d")); 
   RegistrarInscripcionEstudiante::registrarInscripcionEstudiante($cedula_escolar,$id_inscripcion);

   Plantilla::HTML("Inscripcion/Inscribir",[
     "ci_escolar"=>$cedula_escolar
   ]);
  }
}
