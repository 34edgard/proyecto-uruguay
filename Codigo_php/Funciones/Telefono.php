<?php
(function (){
  global $registrarTelefono;
$registrarTelefono =function ($numero){
  $TELEFONO = new Telefono;
  $TELEFONO->registrarDato([ 'campos' => [ 'numero_telefono'],'valores' =>[$numero],'campo'=>['id_telefono'], 'longitud' => 0]);
  $id = $TELEFONO->consultarId([ 'campos' => [ 'id_telefono'], 'longitud' => 0]);
  print_r($id);
  return $id[0][0];
};
  
})();