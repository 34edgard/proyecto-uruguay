<?php
include "includer.php";

Peticion::metodo_post($crearPeriodoEscolar,['inicio_periodo','fin_periodo'],[$consultarPeriodoEscolar]);
Peticion::metodo_post($consultarPeriodoEscolar,[]);
Peticion::metodo_get($consultarPeriodo,['periodo_escolar']);
Peticion::metodo_get($consultarAulas,['aula']);
Peticion::metodo_get($crearNivel,['nombre_nivel'],[$consultarNivel]);
Peticion::metodo_get($consultarNivel,['id_nivel']);
Peticion::metodo_get($consultarNiveles,['id_niveles']);

Peticion::metodo_post($crearSeccion,['nombre_seccion','id_nivel'],[$consultarSecciones]);
Peticion::metodo_get($consultarSecciones,['id_secciones']);
Peticion::metodo_get($consultarSeccion,['id_seccion']);

Peticion::metodo_post($crearAula,['id_seccion','nombre_aula'],[$consultarAula]);
Peticion::metodo_get($consultarAulas,['id_aulas']);
Peticion::metodo_get($consultarAula,['id_aula']);
