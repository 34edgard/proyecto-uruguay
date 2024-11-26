<?php

include './Objetos_Fuiones.php';

$PETICION->metodo_post($crear_usuario,['Crear_usuario','cedula','nombre','apellido','rol','contraseña']);
$PETICION->metodo_get($consultar_usuario);
$PETICION->metodo_get($consultar_usuario_ci,['consultar_usuario_ci','ci']);

$PETICION->metodo_get($eliminar_usuario,['eliminarUsuario','ci']);

$PETICION->metodo_post($editar_usuario,['EditarUsuario','ci','nombre','apellido','contraseña','rol']);