<?php
include "includer.php";

Peticion::metodo_post($crearPeriodoEscolar,['inicio_periodo','fin_periodo'],[$consultarPeriodoEscolar]);
Peticion::metodo_post($consultarPeriodoEscolar,[]);
 
