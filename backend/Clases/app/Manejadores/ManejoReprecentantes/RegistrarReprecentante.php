<?php
use Liki\Database\FlowDB;
use Liki\Plantillas\Flow;
use App\Controladores\Personas\Reprecentante;
use App\Controladores\Direccion\Ubicacion;
use App\Controladores\Direccion\Direccion;
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
  
        
  FlowDB::conf(Ubicacion::class)
  ->campos($datosDireccionHabitacion['campos'])
  ->post($datosDireccionHabitacion['valores']);
  FlowDB::conf(Ubicacion::class)
  ->campos($datosDireccionTrabajo['campos'])
  ->post($datosDireccionTrabajo['valores']);


$id_ubiHabi = FlowDB::conf(Ubicacion::class)->campos(['id_sector','id_ubicacion'])
->orderBy('id_ubicacion')
->limit(1)
->get(['id_sector'=>$id_direccion_habitacion ] )[0]['id_ubicacion'];

 $id_ubitraba = FlowDB::conf(Ubicacion::class)->campos(['id_sector','id_ubicacion')
 ->orderBy('id_ubicacion')
 ->limit(1)
 ->get(['id_sector'=>$id_direccion_trabajo] )[0]['id_ubicacion'];
     
     
    
    
    
 FlowDB::conf(Direccion::class)
->campos(['id_ubicacion', 'tipo_direccion'])
->post([$id_ubitraba,'trabajo']);
     
      
  FlowDB::conf(Direccion::class)->campos(['id_ubicacion', 'tipo_direccion'])
  ->post([$id_ubiHabi,'habitacion']);  
    
    
 $id_dirtraba = FlowDB::conf(Direccion::class)->campos(['id_ubicacion','id_direccion'])
 ->orderBy('id_ubicacion')
 ->limit(1)
 ->get(['id_ubicacion'=>$id_ubitraba])[0]['id_direccion'];
     
     
    
     $id_dirHabi = FlowDB::conf(Direccion::class)->campos(['id_ubicacion','id_direccion'])
     ->orderBy('id_ubicacion')
     ->limit(1)
     ->get(['id_ubicacion'=>$id_ubiHabi] )[0]['id_direccion'];
  
  
 FlowDB::conf(Reprecentante::class)->campos(['cedula','nombres',
    'apellidos','fecha_nacimiento',
    'edad','id_nacionalidad',
    'id_nivel_instruccion',
    'id_ocupacion',
    'id_direccion_habitacion',
'id_direccion_trabajo'])->post([
   $cedula,$nombres,
   $apellidos,
   $fecha_nacimiento,
   Edad::Edad($fecha_nacimiento),
   $id_nacionalidad,
   $id_nivel_instruccion,
   $id_ocupacion,
   $id_dirHabi,
   $id_dirtraba
   ]);
 


     $id_propietario = FlowDB::conf(Reprecentante::class)
     ->campos(['cedula','id_representante'])
     ->get(['cedula'=>$cedula])[0]['id_representante'];
    
    $dataPlantilla = [
"id_propietario"=>$id_propietario
     ];
   Flow::html("Inscripcion/DatosExtraRepresentante",$dataPlantilla);
 }
};