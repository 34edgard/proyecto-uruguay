<?php
include "includer.php";

Peticion::metodo_post($crearPeriodoEscolar,['inicio_periodo','fin_periodo']);
Peticion::metodo_post($consultarPeriodoEscolar,[]);
 
