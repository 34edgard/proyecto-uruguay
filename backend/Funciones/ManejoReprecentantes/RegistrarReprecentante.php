<?php



use Liki\Plantillas\Plantilla;
use App\Personas\Reprecentante;
use App\Direccion\Ubicacion;
use App\Direccion\Direccion;
use Funciones\Edad;



return new class {
  
  public static function run($p){
    
    
    extract($p);
  
   // print_r($_POST);
    $datosDireccion = [
      "campos"=>['id_sector','nro_vivienda','calle_vereda_avenida']  ];
    $datosDireccionHabitacion = $datosDireccion;
    $datosDireccionTrabajo = $datosDireccion;
    
    
    $datosDireccionHabitacion[  'valores']=[
        $id_direccion_habitacion,
        $nro_vivienda2,   $descripcion_direccion_habitacion
        ];
 

    $datosDireccionTrabajo['valores']=[
        $id_direccion_trabajo,
        $nro_vivienda2,
        $descripcion_direccion_trabajo
        ];
  
        
   (new Ubicacion)->registrar($datosDireccionHabitacion);
   (new Ubicacion)->registrar($datosDireccionTrabajo);


$id_ubiHabi = (new Ubicacion)->consultar([
  "campos"=>['id_sector','id_ubicacion'],
  "where"=>[   [ "campo"=>'id_sector',"operador"=>'=',"valor"=>$id_direccion_habitacion ] ],
  "orderBy"=>["campo"=>'id_ubicacion',"direccion"=>'DESC'],
  "limit"=>1])[0]['id_ubicacion'];

 $id_ubitraba = (new Ubicacion)->consultar([
   "campos"=>['id_sector','id_ubicacion'],
   "where"=>[ ["campo"=>'id_sector',"operador"=>'=',"valor"=>$id_direccion_trabajo] ],
   "orderBy"=>["campo"=>'id_ubicacion',"direccion"=>'DESC'],
   "limit"=>1 ])[0]['id_ubicacion'];
     
     
    
    
    
    ((new Direccion)->registrar([
      "campos"=>['id_ubicacion', 'tipo_direccion'],
"valores"=>[$id_ubitraba,'trabajo' ] ]));
     
      
  ((new Direccion)->registrar([
      "campos"=>['id_ubicacion', 'tipo_direccion'],
  "valores"=>[$id_ubiHabi,'habitacion' ] ]));  
    
    
 $id_dirtraba = (new Direccion)->consultar([
   "campos"=>['id_ubicacion','id_direccion'],
       "where"=>[
         ["campo"=>'id_ubicacion',"operador"=>'=',"valor"=>$id_ubitraba]
       ],
       "orderBy"=>[
         "campo"=>'id_ubicacion',"direccion"=>'DESC'
       ],
       "limit"=>1 ])[0]['id_direccion'];
     
     
    
     $id_dirHabi = (new Direccion)->consultar([
       "campos"=>['id_ubicacion','id_direccion'],
       "where"=>[
         ["campo"=>'id_ubicacion',"operador"=>'=',"valor"=>$id_ubiHabi]
       ],
       "orderBy"=>[
         "campo"=>'id_ubicacion',"direccion"=>'DESC'
       ],
       "limit"=>1])[0]['id_direccion'];
  
  




/*
 *
 */ ((new Reprecentante)->registrar([
    "campos"=>['cedula','nombres',
    'apellidos','fecha_nacimiento',
    'edad','id_nacionalidad',
    'id_nivel_instruccion',
    'id_ocupacion',
    'id_direccion_habitacion',
'id_direccion_trabajo'],
 "valores"=>[
   $cedula,$nombres,
   $apellidos,
   $fecha_nacimiento,
   Edad::Edad($fecha_nacimiento),
   $id_nacionalidad,
   $id_nivel_instruccion,
   $id_ocupacion,
   $id_dirHabi,
   $id_dirtraba
   ]
 
 ]));
 


     $id_propietario = (new Reprecentante)->consultar([
       "campos"=>['cedula','id_representante'],
       "where"=>[
         ["campo"=>'cedula',"operador"=>'=',"valor"=>$cedula]
       ]
       
     ])[0]['id_representante'];
    
    //print_r($id_propietario);

    $dataPlantilla = [
"id_propietario"=>$id_propietario
     ];
   Plantilla::HTML("Inscripcion/DatosExtraRepresentante",$dataPlantilla);
 


 }
};
