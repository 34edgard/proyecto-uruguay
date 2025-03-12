<?php
(function (){
  global $editar_usuario_form;
  $editar_usuario_form =function (){
if(!isset($_GET['formularioEdicion'])) return;
   extract($_GET);
   session_start();
   //formularioEdicion
   $campos =["campos"=>['cedula','nombres','apellidos'],
   "valor"=>$formularioEdicion];
   $datos = (new Personal_Administrativo)->consultar_datos($campos)[0];
   //print_r($datos);
   plantilla("EditarUsuario",$datos);
  };

  
})();