<?php
$iniciar_sesion = function (){
  
 $extras = func_get_args();
  extract($_POST);
  
  session_start();
$arreglo = $extras[1]($cedula,$contraseña);
if($arreglo[0]){
  $_SESSION["ci"] = $arreglo[1][0][0];
  $_SESSION["contraseña"] = $arreglo[1][0][1];
  $_SESSION["rol"] = $arreglo[1][0][2];
  $_SESSION["nombre"] = $arreglo[1][0][3];
  
}

};
$validar_datosDB = function ($cedula,$contraseña){
$PA = new Personal_Administrativo();
 $arreglo = $PA->consultar_datos([ 'campos' => ['ci','contrasena','id_rol','nombre'],'valor'=>$cedula,'longitud'=>3]);
 
  if ( password_verify($contraseña, $arreglo[0][1])){
    //
  	echo json_encode( ['error'=>false,'data'=>"	<div class='alert alert-success alert-dismissible fade show container text-center mt-5' role='alert'>
	<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
	<strong>puede acceder! que tenga buen dia <br>
	</strong><br>
	<a href='./Paginas/Pag_1.php' class='btn btn-primary'>puede acceder</a>
	</div>"]);
		return [true,$arreglo];
  } 
			echo json_encode(['error'=>true,'data'=>'<h2 class="text-center text-danger">el usuario o la contraseña son incorrectos</h2>']);
	return [false];
		
};

$cerrar_sesion = function (){
session_start();
session_unset();
session_destroy();
};