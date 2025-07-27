<?php
$op =["op"=>6];
validar_sesion();


$config = [
    "tituloPagina"=>'Administración',
    "estilos"=>['bootstrap.min','estilos'],
    "estilosD"=>['estilos'],
    "scripts"=>['color-modes','chart.umd','CambiarTitulo','htmx','bootstrap.bundle.min','main'],
    "contenidos"=>[
        ["componente"=>'estructura/Header',"configuracion"=>$op],
        ["componente"=>'usuario/Ajustes',"configuracion"=>$op],
        
    ]
];


plantilla('estructura/pagina',$config);







