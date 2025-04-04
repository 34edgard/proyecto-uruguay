<?php
(function (){
  global $registrarReprecentante;
  $registrarReprecentante =function (){
    extract($_POST);
    [ 
  'parroquia1'  ,
  'parroquia2'  ,
  'cedula'  ,
  'nombres' ,
  'apellidos' ,
  'fecha_nacimiento' ,
  'id_nacionalidad'  ,
  'id_nivel_instruccion'  ,
  'id_ocupacion'  ,
  'id_direccion_habitacion'  ,
  'descripcion_direccion_habitacion',
  'id_direccion_trabajo'  ,
  'descripcion_direccion_trabajo'
  ];
    
    $datosDireccion = [
      "campos"=>['id_sector','nro_vivienda','calle_vereda_avenida']  ];
    $datosDireccionHabitacion = $datosDireccion;
    $datosDireccionHabitacion[  'valores']=[
        $id_direccion_habitacion,
        $nro_vivienda2,   $descripcion_direccion_habitacion
        ];
    $datosDireccionTrabajo= $datosDireccion;
    $datosDireccionTrabajo['valores']=[
        $id_direccion_trabajo,
        $nro_vivienda2,
        $descripcion_direccion_trabajo
        ];
  
        
   (new ubicacion)->registrar_info($datosDireccionHabitacion);
$id_ubiHabi=(new ubicacion)->consultar_info([
     "campos"=>['id_sector','id_ubicacion'],
     "valor"=>"$id_direccion_habitacion ORDER BY `id_ubicacion` DESC LIMIT 1"
     ])[0]['id_ubicacion'];

   (new ubicacion)->registrar_info($datosDireccionTrabajo);
 $id_ubitraba =  (new ubicacion)->consultar_info([
     "campos"=>['id_sector','id_ubicacion'],
     "valor"=>"$id_direccion_trabajo ORDER BY `id_ubicacion` DESC LIMIT 1"
     ])[0]['id_ubicacion'];
     
     echo "el id trabajo es $id_ubitraba";
    ( (new direccion)->registrar_info([
      "campos"=>[  'id_ubicacion', 
  'tipo_direccion'  ],
"valores"=>[  $id_ubitraba,'trabajo'
  ]      ]));
     
      
 $id_dirtraba = (new direccion)->consultar_info([
     "campos"=>['id_ubicacion','id_direccion'],
     "valor"=>"$id_ubitraba ORDER BY `id_direccion` DESC LIMIT 1"
     ])[0]['id_direccion'];
     echo "<br>";
     echo "el id habitación es $id_ubiHabi";
    ( (new direccion)->registrar_info([
      "campos"=>[  'id_ubicacion', 
  'tipo_direccion'  ],
"valores"=>[  $id_ubiHabi,'habitacion'
  ]      ]));
     $id_dirHabi = (new direccion)->consultar_info([
     "campos"=>['id_ubicacion','id_direccion'],
     "valor"=>"$id_ubiHabi ORDER BY `id_direccion` DESC LIMIT 1"
     ])[0]['id_direccion'];
  //  
  // 
 ((new Reprecentante)->registrar_datos(["campos"=>['cedula','nombres','apellidos','fecha_nacimiento','edad','id_nacionalidad','id_nivel_instruccion','id_ocupacion','id_direccion_habitacion','id_direccion_trabajo'],
 "valores"=>[
   $cedula,$nombres,$apellidos,
   $fecha_nacimiento,Edad($fecha_nacimiento),
   $id_nacionalidad,$id_nivel_instruccion,$id_ocupacion,$id_dirHabi,$id_dirtraba
   ]
 
 ]));
 


     $id_propietario = (new Reprecentante)->consultar_datos([
       "campos"=>['cedula','id_representante'],
       "valor"=>$cedula
     ])[0]['id_representante'];

     $dataPlantilla = [
"id_propietario"=>$id_propietario
     ];
    plantilla("Inscripcion/DatosExtraRepresentante",$dataPlantilla);
  };
})();
