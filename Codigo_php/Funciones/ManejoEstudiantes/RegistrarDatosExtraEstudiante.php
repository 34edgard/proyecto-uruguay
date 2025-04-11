<?php
(function (){
  global $registrarDatosExtraEstudiante;
  $registrarDatosExtraEstudiante =function (){

 

   extract($_POST);
   
   registrarDocumentosInscripcion($cedula_escolar,1,$partida_nacimiento);
   registrarDocumentosInscripcion($cedula_escolar,2,$copia_cedula_madre);
   registrarDocumentosInscripcion($cedula_escolar,3,$copia_cedula_padre);
   registrarDocumentosInscripcion($cedula_escolar,4,$fotos_tipo_carnet);
   registrarDocumentosInscripcion($cedula_escolar,5,$copia_certificado_vacuna);
   registrarTalla($cedula_escolar,1,$talla_camisa);
   registrarTalla($cedula_escolar,2,$talla_pantalon);
   registrarTalla($cedula_escolar,3,$talla_zapato);
   registrarTalla($cedula_escolar,4,$circunferencia_braquial);
   registrarPeso($cedula_escolar,$peso);
    
   $id_inscripcion = registrarInscripcion($cedula_escolar, date("d-m-Y")); 
   registrarInscripcionEstudiante($cedula_escolar,$id_inscripcion);

    plantilla("Inscripcion/Inscribir");
  };
})();