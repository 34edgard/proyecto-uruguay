<?php

include '../includer.php';

Peticion::metodo_get($consultarDocente);
Peticion::metodo_get($consultarDocenteCI,['ci']);
Peticion::metodo_get($formularioEdicion,['formularioEdicion']);
Peticion::metodo_get($eliminarDocente,['eliminar'],[$consultarDocente]);
Peticion::metodo_get($ConfirmarEliminacion,['ConfirmarEliminacion']);
Peticion::metodo_post($registrarDocente,['formulario','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono'],[$registrarTelefono]);
Peticion::metodo_post($editarDocente,['Editar','cedula','nombre','apellido','fecha_nacimiento','telefono','tipo_telefono'],[$consultarDocente]);
