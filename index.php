<?php
include "./Codigo_php/includer.php";


Peticion::metodo_get('/inicio',function(){
include "./Publico/Paginas/pag_1.php";
});


Peticion::metodo_get('/',function(){
  include "./Publico/Paginas/index.php";
});
Peticion::metodo_get('/Gestion_Sesion',function(){
include "./Publico/Paginas/pag_0.php";
});

Peticion::metodo_get('Gestion_Sesion',$cerrar_sesion,['cerrar_sesion']);
Peticion::metodo_post('/Gestion_Sesion',$iniciar_sesion,['Inicio_secion','cedula','contraseña'],[$validar_datosDB]);


