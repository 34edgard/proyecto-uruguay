<?php

include './Objetos_Fuiones.php';
$PETICION->metodo_get($cerrar_sesion,['cerrar_sesion']);
$PETICION->metodo_post($iniciar_sesion,['Inicio_secion','cedula','contraseña'],[$validar_datosDB]);