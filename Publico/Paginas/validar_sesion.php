<?php

if (session_id() == "") {
  session_start();
  if (!isset($_SESSION['ci'])) {
 //header("Location: ./");
 //$_SERVER['REQUEST_URI']='/';
 //print_r($_SESSION);
  //print_r($_SERVER['REQUEST_URI']);
 //include "./Publico/Paginas/index.php";
cambiarPagina('');
   exit();
  }
}
