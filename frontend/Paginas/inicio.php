<?php
$op = ["op"=>1];
validar_sesion();



$config = [
    "tituloPagina"=>'Inicio',
    "estilos"=>['bootstrap.min','estilos'],
    "estilosD"=>['estilos'],
    "scripts"=>['NiñosPorSexo','color-modes','chart.umd','htmx','bootstrap.bundle.min','CambiarTitulo'],
    "contenidos"=>[
        ["componente"=>'estructura/Header',"configuracion"=>$op],
        ["componente"=>'Bienvenida',"configuracion"=>$op],
        
    ]
];


plantilla('estructura/pagina',$config);





