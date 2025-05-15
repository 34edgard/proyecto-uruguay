<?php
$op =["op"=>6];
include "./Publico/Paginas/validar_sesion.php";
include "./Publico/Paginas/enunciado.php";

plantilla('Head',$op);
plantilla('Header',$op);
plantilla('Main',$op);
plantilla('Ajustes',$op);
plantilla('Footer',$op);


