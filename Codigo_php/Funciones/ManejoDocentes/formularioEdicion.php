<?php
(function (){
  global $formularioEdicion;
  $formularioEdicion = function(){
   //formularioEdicion
   $datos = (new Docente)->consultar_datos([
     "campos"=>['cedula','nombres','apellidos','id_docente','fecha_nacimiento'],
     "valor"=>$_GET['formularioEdicion']
     ])[0];
   $datosTel = (new Telefono)->consultarDato([
     "campos"=>['id_docente','tipo_telefono','numero_telefono'],
     "valor"=>$datos['id_docente']
     ])[0];
  //   print_r($datosTel);
     $datos['telefono'] = $datosTel['numero_telefono'];
     $datos['tipo_telefono'] = $datosTel['tipo_telefono'];
   //  print_r($datos);
    plantilla('Docente/FormularioEdicion',$datos);
  };
})();