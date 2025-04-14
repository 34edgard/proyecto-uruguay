<?php
(function (){
  global $registrarEstudiante;
  $registrarEstudiante =function (){
    extract($_POST);
   $extras = func_get_args();

    //registrando la direccion
    
  (new ubicacion)->registrar_info([
    "campos"=>['id_sector','nro_vivienda','calle_vereda_avenida'],  
     "valores"=>[$id_direccion,$nro_vivienda1,$descripcion_direccion]
  ]);
    /// consultando el id de la dieccion registrada
 $id_ubicacion=(new ubicacion)->consultar_info([
     "campos"=>['id_sector','id_ubicacion'],
     "valor"=>"$id_direccion ORDER BY `id_ubicacion` DESC LIMIT 1"
     ])[0]['id_ubicacion'];




    // registrando el lugar de nacimiento 
    //

    (new lugar_nacimiento)->registrar_info([
      "campos"=>["id_estado","id_municipio","id_parroquia"],
      "valores"=>[$id_estado,$id_municipio,$id_parroquia]
    ]);

    //consultar id_lugar_nacimiento
      

$id_lugar_nacimiento=(new lugar_nacimiento)->consultar_info([
     "campos"=>['id_estado','id_lugar_nacimiento'],
     "valor"=>"$id_estado ORDER BY `id_lugar_nacimiento` DESC LIMIT 1"
     ])[0]['id_lugar_nacimiento'];




 $nci_escolar = $extras[1][0]($ci_escolar,$fecha_nacimiento);

       $edad_ano = Edad($fecha_nacimiento);
       $edad_meses = Edad($fecha_nacimiento);
    (new Estudiante)->registrar_datos([ "campos"=>
      ['ci_escolar', 'nombres' , 'apellidos',   'fecha_nacimiento',
      'id_lugar_nacimiento', 'id_nacionalidad', 'edad_ano', 'edad_meses',
      'sexo' , 'id_ubicacion' , 'id_procedencia', 'id_condicion_medica' ,      'id_discapacidad', 'id_estado_nutricional'],
      "valores"=>
      [$nci_escolar,$nombres,$apellidos,$fecha_nacimiento,
      $id_lugar_nacimiento,$id_nacionalidad,$edad_ano,$edad_meses,
      $sexo,$id_ubicacion,$id_procedencia,$id_condicion_medica,
      $id_discapacidad, $id_estado_nutricional]

]);

      
  




    plantilla("Inscripcion/DatosExtraNiño" ,[
      "cedula_escolar"=>$nci_escolar
    ]);
  };
})();
