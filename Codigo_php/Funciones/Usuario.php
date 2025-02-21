<?php
(function (){
global $consultar_usuario_ci ;
$consultar_usuario_ci = function (){
  
   $datos =[ 'campos' => ['cedula', 'nombres', 'apellidos','contrasena', 'id_rol'],'valor'=>$_GET['ci']];
   
   $usuarios = new Personal_Administrativo;
  $lista_usuarios = $usuarios->consultar_datos($datos);
  
    echo json_encode(['lista_usuarios'=>$lista_usuarios, 
    'rol'=>$_SESSION['rol']]);
};



global $consultar_usuario;
$consultar_usuario = function () {
  session_start();
  $datos = [ 'campos' => ['cedula', 'nombres', 'apellidos', 'id_rol','estado']];
  
  if($_SESSION['rol'] == 3){
    $datos[]=['valor'=>$_SESSION['ci']];
  }
  
  $usuarios = new Personal_Administrativo;
  $lista_usuarios = $usuarios->consultar_datos($datos);
  
  foreach($lista_usuarios as $usuario){
      if($usuario['estado'] == 'activo'){
        $usuarioEstado = 'desactivo';
        $estado = 'success';
      }else{
        $usuarioEstado = 'activo';
        
        $estado = 'secondary';
      }
     $resul .=  "<tr>
          <td>${usuario['cedula']}</td>
          <td>${usuario['nombres']}</td>
          <td>${usuario['apellidos']}</td>
          <td>${usuario['id_rol']}</td>
          <td><button class='btn btn-${estado}'  onclick='{$usuarioEstado}Usuario({$usuario['cedula']})'>{$usuario['estado']}</button></td>
      <td><button class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#firefoxModal' onclick='insertarDatosUsuario({$usuario['cedula']})'>editar</button></td>";
          
     if($_SESSION['rol'] ==1){
  $resul .=  "<td><button class='btn btn-danger' onclick='eliminarUsuario({$usuario['cedula']})'>eliminar</button></td>";
    }
     $resul .= "</tr>";
    }
     	  echo $resul;
    
};

global $crear_usuario ;
$crear_usuario = function () {
  extract($_POST);
(new correo)->registrarDato(['campos'=>['email'],'valores'=>[$correo]]);
$id_correo=(new correo)->consultarId(['campos'=>['id_correo']])[0]['id_correo'];
  $usuarios = new Personal_Administrativo;
  $contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);
  $usuarios->registrar_datos(['campos'=>['cedula','nombres','apellidos','usuario','id_rol','id_correo','contrasena'],'valores'=>[$cedula,$nombre,$apellido,$usuario,$rol,$id_correo,$contraseña_hash]]);
};

global $editar_usuario ;
$editar_usuario =function (){
extract($_POST);
  $usuarios = new Personal_Administrativo;
  if($contraseña != ''){
  $contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);
  $usuarios->editar_datos(['campos'=>['cedula','nombres','apellidos','id_rol','contrasena'],'valores'=>[$ci,$nombre,$apellido,$rol,$contraseña_hash],'valor'=>$ci]);
  
  }else{
    $usuarios->editar_datos(['campos'=>['cedula','nombres','apellidos','id_rol'],'valores'=>[$ci,$nombre,$apellido,$rol],'valor'=>$ci]);
  
  }
};

global $eliminar_usuario;
$eliminar_usuario=function (){
  extract($_GET);
  $usuarios = new Personal_Administrativo;
  
  $usuarios->eliminar_datos(['campos'=>['cedula'],'valor'=>$ci]);
};

global $activarUsuario;
$activarUsuario = function (){
  extract($_GET);
  $usuarios = new Personal_Administrativo;
  $usuarios->editar_datos(['campos'=>['cedula','estado'],'valores'=>[$ci,'activo'],'valor'=>$ci]);
  
};

global $desactivarUsuario ;
$desactivarUsuario = function (){
  extract($_GET);
  $usuarios = new Personal_Administrativo;
  $usuarios->editar_datos(['campos'=>['cedula','estado'],'valores'=>[$ci,'desactivo'],'valor'=>$ci]);
};
})();
