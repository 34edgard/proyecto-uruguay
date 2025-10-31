<?php

namespace Funciones;

use App\DatosExtra\Telefono;

class RegistrarTelefono{

public static function registrarTelefono($numero, $Propietario,$tipo,$id_Propietario){
  //echo 'ddddl';
 // $id_Propietario = ['ci_escolar','id_representante','id_docente'];
  
  $TELEFONO = new Telefono;
  $TELEFONO->registrar([ 'campos' => ['tipo_telefono', 'numero_telefono',$Propietario],'valores' =>[$tipo,$numero,$id_Propietario]]);
 // $id = $TELEFONO->consultarId([ 'campos' => [ 'id_telefono']]);
  
//  return $id[0][0];
}
  
}
