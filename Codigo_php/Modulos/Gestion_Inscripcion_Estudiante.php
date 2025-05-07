<?php 

include '../includer.php';
include './ValoresDeRuta/ValoresDeInscripcion.php';

Peticion::metodo_get($registrarNiños,$valoresParaInscrion);

Peticion::metodo_get($consultarEstado,['pais']);
Peticion::metodo_get($consultarMunicipio,['id_estado']);


Peticion::metodo_get($consultarParroquia2,['id_municipio']);
Peticion::metodo_get($consultarParroquia,['estado']);

Peticion::metodo_get($consultarSector,['parroquia1']);
Peticion::metodo_get($consultarSector,['parroquia2']);
Peticion::metodo_get($consultarCalle,['calle']);
