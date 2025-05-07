<?php

include '../includer.php';

Peticion::metodo_post($crear_usuario,['Crear_usuario','cedula','nombre','apellido','correo','usuario','rol','contraseña'],[$consultar_usuario]);
Peticion::metodo_get($consultar_usuario);
Peticion::metodo_get($consultar_rol,['rol']);
Peticion::metodo_get($consultar_usuario_ci,['consultar_usuario_ci','ci']);

Peticion::metodo_get($eliminar_usuario,['eliminarUsuario','ci'],[$consultar_usuario]);


Peticion::metodo_get($cambiarEstado,['cambiarEstadoUsuario','ci']);


Peticion::metodo_get($editar_usuario_form,['formularioEdicion']);
Peticion::metodo_get($confirmarEliminacion,['confimarEliminacion']);
Peticion::metodo_post($editar_usuario,['EditarUsuario','ci','nombre','apellido','contraseña','rol'],[$consultar_usuario]);
//print_r($_POST);
