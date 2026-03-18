<?php


use Liki\Routing\Ruta;
use App\Controladores\Personas\Reprecentante;
use Funciones\RegistrarTelefono;

return  function (){
        
 
   Ruta::post('/reprecentante/registrar',[Reprecentante::class,'registrarReprecentante'],[ 
  'nro_vivienda1',
  'nro_vivienda2',
  'parroquia1'  ,
  'parroquia2'  ,
   'estado1',
   'estado2',
   'Municipio1',
   'Municipio2',
  'cedula'  ,
   'trabaja',
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
  ]);



Ruta::post('/reprecentante/extra',[Reprecentante::class,'registrarDatosExtraReprecentante'],['numero_telefono','id_propietario','tipo_telefono'],[ [RegistrarTelefono::class,'registrarTelefono']]);



Ruta::get('/reprecentantes/ci',[Reprecentante::class,'consultarReprecentanteCi']);
Ruta::post('/reprecentantes/buscar/ci',[Reprecentante::class,'consultarReprecentanteBuscarCi'],['buscar_ci']);






  
};