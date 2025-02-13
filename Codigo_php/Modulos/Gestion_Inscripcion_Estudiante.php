<?php

include './includer.php';
include './ValoresDeRuta/ValoresDeInscripcion.php';

Peticion::metodo_get($registrarNiños,$valoresParaInscrion);
Peticion::metodo_get($consultarParroquia,['estado']);
Peticion::metodo_get($consultarSector,['parroquia']);
Peticion::metodo_get($consultarCalle,['calle']);