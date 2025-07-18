<?php
$op = ["op"=>1];
validar_sesion();



$config = [
    "tituloPagina"=>'Inicio',
    "estilos"=>['bootstrap.min','estilos'],
    "estilosD"=>['estilos'],
    "scripts"=>['color-modes','htmx','bootstrap.bundle.min','CambiarTitulo','main'],
    "contenidos"=>[
        ["componente"=>'estructura/Header',"configuracion"=>$op],
        ["componente"=>'Bienvenida',"configuracion"=>$op],
        
    ]
];


plantilla('estructura/pagina',$config);





