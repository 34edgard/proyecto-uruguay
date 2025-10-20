<?php
(function () {
  
    global $cerrar_sesion;
  $cerrar_sesion = function () {
    session_start();
    session_unset();
    session_destroy();
    cambiarPagina("");
  };
})();
