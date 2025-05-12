<?php
$op = ["op"=>1];
include "./Publico/Paginas/validar_sesion.php";
include "./Publico/Paginas/enunciado.php";

plantilla('Head',$op);
plantilla('Header',$op);
plantilla('Bienvenida');
plantilla('Footer',$op);

