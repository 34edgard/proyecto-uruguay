<?php

include './includer.php';

Peticion::metodo_post($crear_usuario,['Crear_usuario','cedula','nombre','apellido','correo','usuario','rol','contraseña']);
Peticion::metodo_get($consultar_usuario);
Peticion::metodo_get($consultar_usuario_ci,['consultar_usuario_ci','ci']);

Peticion::metodo_get($eliminar_usuario,['eliminarUsuario','ci']);


Peticion::metodo_get($cambiarEstado,['cambiarEstadoUsuario','ci']);


Peticion::metodo_post($editar_usuario,['EditarUsuario','ci','nombre','apellido','contraseña','rol']);