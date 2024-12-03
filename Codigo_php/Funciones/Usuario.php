<?php
$consultar_usuario_ci = function (){
   $datos =[ 'campos' => ['ci', 'nombre', 'apellido','contrasena', 'id_rol'], 'longitud' => 8,'valor'=>$_GET['ci']];
   
   $usuarios = new Personal_Administrativo;
  $lista_usuarios = $usuarios->consultar_datos($datos);
  
    echo json_encode(['lista_usuarios'=>$lista_usuarios, 
    'rol'=>$_SESSION['rol']]);
};



$consultar_usuario = function () {
  session_start();
  $datos = [ 'campos' => ['ci', 'nombre', 'apellido', 'id_rol','estado'], 'longitud' => 8];
  
  if($_SESSION['rol'] == 3){
    $datos =[ 'campos' => ['ci', 'nombre', 'apellido', 'id_rol','estado'], 'longitud' => 8,'valor'=>$_SESSION['ci']];
  }
  
  $usuarios = new Personal_Administrativo;
  $lista_usuarios = $usuarios->consultar_datos($datos);
  
    echo json_encode(['lista_usuarios'=>$lista_usuarios, 
    'rol'=>$_SESSION['rol']]);
  
};

$crear_usuario = function () {
  extract($_POST);

  $usuarios = new Personal_Administrativo;
  $contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);
  $usuarios->registrar_datos(['campos'=>['ci','nombre','apellido','id_rol','contrasena'],'valores'=>[$cedula,$nombre,$apellido,$rol,$contraseña_hash]]);
};

$editar_usuario =function (){
extract($_POST);
  $usuarios = new Personal_Administrativo;
  if($contraseña != ''){
  $contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);
  $usuarios->editar_datos(['campos'=>['ci','nombre','apellido','id_rol','contrasena'],'valores'=>[$ci,$nombre,$apellido,$rol,$contraseña_hash],'valor'=>$ci]);
  
  }else{
    $usuarios->editar_datos(['campos'=>['ci','nombre','apellido','id_rol'],'valores'=>[$ci,$nombre,$apellido,$rol],'valor'=>$ci]);
  
  }
};

$eliminar_usuario=function (){
  extract($_GET);
  $usuarios = new Personal_Administrativo;
  
  $usuarios->eliminar_datos(['campos'=>['ci'],'valor'=>$ci]);
};

$activarUsuario = function (){
  extract($_GET);
  $usuarios = new Personal_Administrativo;
  $usuarios->editar_datos(['campos'=>['ci','estado'],'valores'=>[$ci,'activo'],'valor'=>$ci]);
  
};

$desactivarUsuario = function (){
  extract($_GET);
  $usuarios = new Personal_Administrativo;
  $usuarios->editar_datos(['campos'=>['ci','estado'],'valores'=>[$ci,'desactivo'],'valor'=>$ci]);
};