
<?php

$op = ["op"=>9];



$config = [
    "tituloPagina"=>'APP Uruguay - Iniciar Sesión',
    "estilos"=>['bootstrap.min','estilos'],
    "estilosD"=>['estilos'],
    "scripts"=>['color-modes','script','htmx','bootstrap.bundle.min'],
    "contenidos"=>[
        ["componente"=>'estructura/Header',"configuracion"=>$op],
        ["componente"=>'sesiones/Inicio_sesion',"configuracion"=>$op],
        
    ]
];


plantilla('estructura/pagina',$config);




