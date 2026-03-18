<?php

use Liki\Routing\Ruta;


use Funciones\ManejoDireccion\ConsultarEstados;
use Funciones\ManejoDireccion\ConsultarMunicipio;
use Funciones\ManejoDireccion\ConsultarParroquia;
use Funciones\ManejoDireccion\ConsultarParroquias;
use Funciones\ManejoDireccion\ConsultarSector;




return  function (){
        



Ruta::get('/direccion/estado',[ConsultarEstados::class,'consultarEstado'],['pais']);
Ruta::get('/direccion/municipio',[ConsultarMunicipio::class,'consultarMunicipio'],['id_estado']);
Ruta::get('/direccion/municipio1',[ConsultarMunicipio::class,'consultarMunicipio'],['estado1']);
Ruta::get('/direccion/municipio2',[ConsultarMunicipio::class,'consultarMunicipio'],['estado2']);
Ruta::get('/direccion/parroquia2',[ConsultarParroquias::class,'consultarParroquias'],['id_municipio']);
Ruta::get('/direccion/parroquia',[ConsultarParroquia::class,'consultarParroquia'],['estado']);
Ruta::get('/direccion/parroquia_1',[ConsultarParroquias::class,'consultarParroquias'],['Municipio1']);
Ruta::get('/direccion/parroquia_2',[ConsultarParroquias::class,'consultarParroquias'],['Municipio2']);
Ruta::get('/direccion/sector1',[ConsultarSector::class,'consultarSector'],['parroquia1']);
Ruta::get('/direccion/sector',[ConsultarSector::class,'consultarSector'],['parroquia2']);

};