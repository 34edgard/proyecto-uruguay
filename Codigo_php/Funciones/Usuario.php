<?php
$consultar_usuario_ci = function (){
   $datos =['tabla' => 'personal_administrativo', 'campos' => ['ci', 'nombre', 'apellido','contrasena', 'id_rol'], 'longitud' => 4,'valor'=>$_GET['ci']];
   
   $usuarios = new Personal_Administrativo;
  $lista_usuarios = $usuarios->consultar_datos($datos);
  
    echo json_encode(['lista_usuarios'=>$lista_usuarios, 
    'rol'=>$_SESSION['rol']]);
};



$consultar_usuario = function () {
  session_start();
  $datos = ['tabla' => 'personal_administrativo', 'campos' => ['ci', 'nombre', 'apellido', 'id_rol','estado'], 'longitud' => 4];
  
  if($_SESSION['rol'] == 3){
    $datos =['tabla' => 'personal_administrativo', 'campos' => ['ci', 'nombre', 'apellido', 'id_rol','estado'], 'longitud' => 4,'valor'=>$_SESSION['ci']];
  }
  
  $usuarios = new Personal_Administrativo;
  $lista_usuarios = $usuarios->consultar_datos($datos);
  
    echo json_encode(['lista_usuarios'=>$lista_usuarios, 
    'rol'=>$_SESSION['rol']]);
  
};

$crear_usuario = function () {
  extract($_POST);
  $usuarios = new Personal_Administrativo;
  $usuarios->registrar_datos(['tabla'=>'personal_administrativo','campos'=>['ci','nombre','apellido','id_rol','contrasena'],'valores'=>[$cedula,$nombre,$apellido,$rol,$contraseña]]);
};

$editar_usuario =function (){
extract($_POST);
  $usuarios = new Personal_Administrativo;
  
  $usuarios->editar_datos(['tabla'=>'personal_administrativo','campos'=>['ci','nombre','apellido','id_rol','contrasena'],'valores'=>[$ci,$nombre,$apellido,$rol,$contraseña],'valor'=>$ci]);
  
  
};

$eliminar_usuario=function (){
  extract($_GET);
  $usuarios = new Personal_Administrativo;
  
  $usuarios->eliminar_datos(['tabla'=>'personal_administrativo','campos'=>['ci'],'valor'=>$ci]);
};

$activarUsuario = function (){
  extract($_GET);
  $usuarios = new Personal_Administrativo;
  $usuarios->editar_datos(['tabla'=>'personal_administrativo','campos'=>['ci','estado'],'valores'=>[$ci,'activo'],'valor'=>$ci]);
  
};

$desactivarUsuario = function (){
  extract($_GET);
  $usuarios = new Personal_Administrativo;
  $usuarios->editar_datos(['tabla'=>'personal_administrativo','campos'=>['ci','estado'],'valores'=>[$ci,'desactivo'],'valor'=>$ci]);
};