<?php

include '../includer.php';
Peticion::metodo_get($cerrar_sesion,['cerrar_sesion']);
Peticion::metodo_post($iniciar_sesion,['Inicio_secion','cedula','contraseña'],[$validar_datosDB]);
