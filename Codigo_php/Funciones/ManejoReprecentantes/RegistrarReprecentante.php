<?php
(function (){
  global $registrarReprecentante;
  $registrarReprecentante =function (){
    extract($_POST);
  
    
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
  "where"=>[
    [
      "campo"=>'id_sector',"operador"=>'=',"valor"=>$id_direccion_habitacion
    ]
  ],
  "orderBy"=>[
"campo"=>'id_ubicacion',"direccion"=>'DESC'
  ],
  "limit"=>1
     ])[0]['id_ubicacion'];

   (new ubicacion)->registrar_info($datosDireccionTrabajo);
 $id_ubitraba =  (new ubicacion)->consultar_info([
   "campos"=>['id_sector','id_ubicacion'],
   "where"=>[
     ["campo"=>'id_sector',"operador"=>'=',"valor"=>$id_direccion_trabajo]
   ],
   "orderBy"=>[
     "campo"=>'id_ubicacion',"direccion"=>'DESC'
   ],
   "limit"=>1
     ])[0]['id_ubicacion'];
     
     
    ( (new direccion)->registrar_info([
      "campos"=>[  'id_ubicacion', 
  'tipo_direccion'  ],
"valores"=>[  $id_ubitraba,'trabajo'
  ]      ]));
     
      
 $id_dirtraba = (new direccion)->consultar_info([
   "campos"=>['id_ubicacion','id_direccion'],
   "where"=>[
     ["campo"=>'id_ubicacion',"operador"=>'=',"valor"=>$id_ubitraba]
   ],
   "orderBy"=>[
     "campo"=>'id_direccion',"direccion"=>'DESC'
   ],
   "limit"=>1
     ])[0]['id_direccion'];
     
     
    ( (new direccion)->registrar_info([
      "campos"=>[  'id_ubicacion', 
  'tipo_direccion'  ],
"valores"=>[  $id_ubiHabi,'habitacion'
  ]      ]));
     $id_dirHabi = (new direccion)->consultar_info([
       "campos"=>['id_ubicacion','id_direccion'],
       "where"=>[
         ["campo"=>'id_ubicacion',"operador"=>'=',"valor"=>$id_ubiHabi]
       ],
       "orderBy"=>[
         "campo"=>'id_ubicacion',"direccion"=>'DESC'
       ],
       "limit"=>1
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
       "where"=>[
         ["campo"=>'cedula',"operador"=>'=',"valor"=>$cedula]
       ]
       
     ])[0]['id_representante'];

     $dataPlantilla = [
"id_propietario"=>$id_propietario
     ];
    plantilla("Inscripcion/DatosExtraRepresentante",$dataPlantilla);
  };
})();
