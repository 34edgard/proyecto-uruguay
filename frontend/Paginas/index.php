<?php
$op = ["op"=>0];


$config = [
    "tituloPagina"=>"República del Uruguay",
    "estilos"=>['bootstrap.min','estilos'],
    "estilosD"=>['estilos'],
    
    "scripts"=>['color-modes','htmx','bootstrap.bundle.min'],
    "contenidos"=>[
        ["componente"=>'estructura/Header',"configuracion"=>$op],
        ["componente"=>'Inicio',"configuracion"=>$op],
       
    ]
];


plantilla('estructura/pagina',$config);

