CREATE TABLE `anio_escolar` (
  `id_anio_escolar` int(11) NOT NULL AUTO_INCREMENT,
  `anio` int(11) NOT NULL,
  `id_periodo_escolar` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  PRIMARY KEY (`id_anio_escolar`),
  KEY `id_periodo_escolar` (`id_periodo_escolar`),
  KEY `id_aula` (`id_aula`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `anio_escolar_ibfk_1` FOREIGN KEY (`id_periodo_escolar`) REFERENCES `periodo_escolar` (`id_periodo_escolar`),
  CONSTRAINT `anio_escolar_ibfk_2` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`),
  CONSTRAINT `anio_escolar_ibfk_3` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ;

CREATE TABLE `anio_escolar_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_anio_escolar` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_anio_escolar`),
  KEY `id_anio_escolar` (`id_anio_escolar`),
  CONSTRAINT `anio_escolar_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `anio_escolar_estudiante_ibfk_2` FOREIGN KEY (`id_anio_escolar`) REFERENCES `anio_escolar` (`id_anio_escolar`)
) ;

CREATE TABLE `archivos` (
  `id_archivo` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `nombre_archivo` varchar(100) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `tipo_archivo` enum('documento','foto','otro') NOT NULL,
  PRIMARY KEY (`id_archivo`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ;

CREATE TABLE `asistencia` (
  `id_asistencia` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `asistio` enum('si','no') NOT NULL DEFAULT 'si',
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ;

CREATE TABLE `aulas` (
  `id_aula` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_aula` varchar(20) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  PRIMARY KEY (`id_aula`),
  KEY `id_seccion` (`id_seccion`),
  CONSTRAINT `aulas_ibfk_1` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id_seccion`)
) ;

CREATE TABLE `conceptos_pago` (
  `id_concepto_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_concepto` varchar(50) NOT NULL,
  PRIMARY KEY (`id_concepto_pago`)
) ;

CREATE TABLE `condicion_medica` (
  `id_condicion_medica` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_condicion_medica` varchar(50) NOT NULL,
  PRIMARY KEY (`id_condicion_medica`)
) ;

CREATE TABLE `condicion_medica_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_condicion_medica` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_condicion_medica`),
  KEY `id_condicion_medica` (`id_condicion_medica`),
  CONSTRAINT `condicion_medica_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `condicion_medica_estudiante_ibfk_2` FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica` (`id_condicion_medica`)
) ;

CREATE TABLE `configuracion` (
  `id_configuracion` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) NOT NULL,
  `valor` varchar(255) NOT NULL,
  PRIMARY KEY (`id_configuracion`)
) ;

CREATE TABLE `correo` (
  `id_correo` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id_correo`)
) ;

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_ubicacion` int(11) NOT NULL,
  `tipo_direccion` enum('habitacion','trabajo') NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `id_ubicacion` (`id_ubicacion`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`)
) ;

CREATE TABLE `discapacidad` (
  `id_discapacidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_discapacidad` varchar(70) NOT NULL,
  PRIMARY KEY (`id_discapacidad`)
);
CREATE TABLE `discapacidad_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_discapacidad` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_discapacidad`),
  KEY `id_discapacidad` (`id_discapacidad`),
  CONSTRAINT `discapacidad_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `discapacidad_estudiante_ibfk_2` FOREIGN KEY (`id_discapacidad`) REFERENCES `discapacidad` (`id_discapacidad`)
) ;

CREATE TABLE `docente` (
  `id_docente` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id_docente`)
) ;

CREATE TABLE `docente_aula` (
  `id_docente` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`,`id_aula`),
  KEY `id_aula` (`id_aula`),
  CONSTRAINT `docente_aula_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `docente_aula_ibfk_2` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`)
) ;

CREATE TABLE `docente_nivel` (
  `id_docente` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`,`id_nivel`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `docente_nivel_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `docente_nivel_ibfk_2` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id_nivel`)
) ;

CREATE TABLE `docente_seccion` (
  `id_docente` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`,`id_seccion`),
  KEY `id_seccion` (`id_seccion`),
  CONSTRAINT `docente_seccion_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `docente_seccion_ibfk_2` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id_seccion`)
) ;

CREATE TABLE `documentos_inscripcion` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `estado` enum('entregado','pendiente') NOT NULL DEFAULT 'pendiente',
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `ci_escolar` (`ci_escolar`),
  KEY `id_tipo_documento` (`id_tipo_documento`),
  CONSTRAINT `documentos_inscripcion_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `documentos_inscripcion_ibfk_2` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`)
) ;

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) NOT NULL,
  `nombre_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ;

CREATE TABLE `estado_nutricional` (
  `id_estado_nutricional` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_nutricional` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado_nutricional`)
) ;

CREATE TABLE `estado_nutricional_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_estado_nutricional` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_estado_nutricional`),
  KEY `id_estado_nutricional` (`id_estado_nutricional`),
  CONSTRAINT `estado_nutricional_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `estado_nutricional_estudiante_ibfk_2` FOREIGN KEY (`id_estado_nutricional`) REFERENCES `estado_nutricional` (`id_estado_nutricional`)
) ;

CREATE TABLE `estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_lugar_nacimiento` int(11) NOT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  `edad_ano` int(11) NOT NULL,
  `edad_meses` int(11) NOT NULL,
  `sexo` enum('masculino','femenino') NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `id_procedencia` int(11) NOT NULL,
  `id_condicion_medica` int(11) NOT NULL,
  `id_discapacidad` int(11) NOT NULL,
  `id_estado_nutricional` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`),
  KEY `id_lugar_nacimiento` (`id_lugar_nacimiento`),
  KEY `id_nacionalidad` (`id_nacionalidad`),
  KEY `id_ubicacion` (`id_ubicacion`),
  KEY `id_procedencia` (`id_procedencia`),
  KEY `id_condicion_medica` (`id_condicion_medica`),
  KEY `id_discapacidad` (`id_discapacidad`),
  KEY `id_estado_nutricional` (`id_estado_nutricional`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_lugar_nacimiento`) REFERENCES `lugar_nacimiento` (`id_lugar_nacimiento`),
  CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`),
  CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`),
  CONSTRAINT `estudiante_ibfk_4` FOREIGN KEY (`id_procedencia`) REFERENCES `procedencia` (`id_procedencia`),
  CONSTRAINT `estudiante_ibfk_5` FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica` (`id_condicion_medica`),
  CONSTRAINT `estudiante_ibfk_6` FOREIGN KEY (`id_discapacidad`) REFERENCES `discapacidad` (`id_discapacidad`),
  CONSTRAINT `estudiante_ibfk_7` FOREIGN KEY (`id_estado_nutricional`) REFERENCES `estado_nutricional` (`id_estado_nutricional`)
) ;

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(100) NOT NULL,
  `fecha_evento` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id_evento`)
) ;

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `id_aula` int(11) NOT NULL,
  `dia_semana` enum('lunes','martes','miércoles','jueves','viernes','sábado','domingo') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `actividad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `id_aula` (`id_aula`),
  CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`)
) ;

CREATE TABLE `incidentes` (
  `id_incidente` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `fecha_incidente` date NOT NULL,
  `descripcion` text NOT NULL,
  `acciones_tomadas` text DEFAULT NULL,
  PRIMARY KEY (`id_incidente`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `incidentes_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ;

CREATE TABLE `inscripciones` (
  `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ;

CREATE TABLE `inscripciones_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_inscripcion` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_inscripcion`),
  KEY `id_inscripcion` (`id_inscripcion`),
  CONSTRAINT `inscripciones_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `inscripciones_estudiante_ibfk_2` FOREIGN KEY (`id_inscripcion`) REFERENCES `inscripciones` (`id_inscripcion`)
) ;

CREATE TABLE `lugar_nacimiento` (
  `id_lugar_nacimiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_parroquia` int(11) NOT NULL,
  PRIMARY KEY (`id_lugar_nacimiento`),
  KEY `id_estado` (`id_estado`),
  KEY `id_municipio` (`id_municipio`),
  KEY `id_parroquia` (`id_parroquia`),
  CONSTRAINT `lugar_nacimiento_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  CONSTRAINT `lugar_nacimiento_ibfk_2` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`),
  CONSTRAINT `lugar_nacimiento_ibfk_3` FOREIGN KEY (`id_parroquia`) REFERENCES `parroquia` (`id_parroquia`)
) ;

CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `nombre_municipio` varchar(45) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`)
) ;

CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nacionalidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ;

CREATE TABLE `nivel_instruccion` (
  `id_nivel_instruccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nivel_instruccion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_nivel_instruccion`)
) ;

CREATE TABLE `niveles` (
  `id_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id_nivel`),
  KEY `id_tipo_nivel` (`id_tipo_nivel`),
  CONSTRAINT `niveles_ibfk_1` FOREIGN KEY (`id_tipo_nivel`) REFERENCES `tipo_nivel` (`id_tipo_nivel`)
) ;

CREATE TABLE `notificaciones` (
  `id_notificacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_representante` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `estado` enum('enviada','leida') NOT NULL DEFAULT 'enviada',
  PRIMARY KEY (`id_notificacion`),
  KEY `id_representante` (`id_representante`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_representante`) REFERENCES `representantes` (`id_representante`)
) ;

CREATE TABLE `ocupacion` (
  `id_ocupacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ocupacion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_ocupacion`)
) ;

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `id_concepto_pago` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `estado` enum('pendiente','pagado') NOT NULL DEFAULT 'pendiente',
  PRIMARY KEY (`id_pago`),
  KEY `ci_escolar` (`ci_escolar`),
  KEY `id_concepto_pago` (`id_concepto_pago`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_concepto_pago`) REFERENCES `conceptos_pago` (`id_concepto_pago`)
) ;

CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(45) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ;

CREATE TABLE `parroquia` (
  `id_parroquia` int(11) NOT NULL AUTO_INCREMENT,
  `id_municipio` int(11) NOT NULL,
  `nombre_parroquia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_parroquia`),
  KEY `id_municipio` (`id_municipio`),
  CONSTRAINT `parroquia_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`)
) ;

CREATE TABLE `periodo_escolar` (
  `id_periodo_escolar` int(11) NOT NULL AUTO_INCREMENT,
  `periodo` varchar(10) NOT NULL,
  PRIMARY KEY (`id_periodo_escolar`)
) ;

CREATE TABLE `peso` (
  `id_peso` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  PRIMARY KEY (`id_peso`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `peso_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ;

CREATE TABLE `prendas` (
  `id_prenda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_prenda` varchar(35) NOT NULL,
  PRIMARY KEY (`id_prenda`)
) ;

CREATE TABLE `procedencia` (
  `id_procedencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_procedencia` int(11) NOT NULL,
  `nombre_procedencia` varchar(40) NOT NULL,
  PRIMARY KEY (`id_procedencia`),
  KEY `id_tipo_procedencia` (`id_tipo_procedencia`),
  CONSTRAINT `procedencia_ibfk_1` FOREIGN KEY (`id_tipo_procedencia`) REFERENCES `tipo_procedencia` (`id_tipo_procedencia`)
) ;

CREATE TABLE `representantes` (
  `id_representante` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `edad` int(11) NOT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  `id_nivel_instruccion` int(11) NOT NULL,
  `id_ocupacion` int(11) NOT NULL,
  `id_direccion_habitacion` int(11) NOT NULL,
  `id_direccion_trabajo` int(11) NOT NULL,
  PRIMARY KEY (`id_representante`),
  KEY `id_nacionalidad` (`id_nacionalidad`),
  KEY `id_nivel_instruccion` (`id_nivel_instruccion`),
  KEY `id_ocupacion` (`id_ocupacion`),
  KEY `id_direccion_habitacion` (`id_direccion_habitacion`),
  KEY `id_direccion_trabajo` (`id_direccion_trabajo`),
  CONSTRAINT `representantes_ibfk_1` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`),
  CONSTRAINT `representantes_ibfk_2` FOREIGN KEY (`id_nivel_instruccion`) REFERENCES `nivel_instruccion` (`id_nivel_instruccion`),
  CONSTRAINT `representantes_ibfk_3` FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion` (`id_ocupacion`),
  CONSTRAINT `representantes_ibfk_4` FOREIGN KEY (`id_direccion_habitacion`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `representantes_ibfk_5` FOREIGN KEY (`id_direccion_trabajo`) REFERENCES `direccion` (`id_direccion`)
) ;

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(30) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ;

CREATE TABLE `salud_estudiante` (
  `id_salud` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `alergias` text DEFAULT NULL,
  `medicamentos` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_salud`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `salud_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ;

CREATE TABLE `secciones` (
  `id_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_seccion` varchar(20) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id_seccion`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `secciones_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id_nivel`)
) ;

CREATE TABLE `sector` (
  `id_sector` int(11) NOT NULL AUTO_INCREMENT,
  `id_parroquia` int(11) NOT NULL,
  `nombre_sector` varchar(45) NOT NULL,
  PRIMARY KEY (`id_sector`),
  KEY `id_parroquia` (`id_parroquia`),
  CONSTRAINT `sector_ibfk_1` FOREIGN KEY (`id_parroquia`) REFERENCES `parroquia` (`id_parroquia`)
) ;

CREATE TABLE `tallas` (
  `id_talla` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `id_prenda` int(11) NOT NULL,
  `talla` varchar(10) NOT NULL,
  PRIMARY KEY (`id_talla`),
  KEY `ci_escolar` (`ci_escolar`),
  KEY `id_prenda` (`id_prenda`),
  CONSTRAINT `tallas_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `tallas_ibfk_2` FOREIGN KEY (`id_prenda`) REFERENCES `prendas` (`id_prenda`)
) ;

CREATE TABLE `telefonos` (
  `id_telefono` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) DEFAULT NULL,
  `id_representante` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `tipo_telefono` enum('fijo','celular') NOT NULL,
  `codigo_area` int(11) DEFAULT NULL,
  `operadora` varchar(10) DEFAULT NULL,
  `numero_telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`id_telefono`),
  KEY `ci_escolar` (`ci_escolar`),
  KEY `id_representante` (`id_representante`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `telefonos_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `telefonos_ibfk_2` FOREIGN KEY (`id_representante`) REFERENCES `representantes` (`id_representante`),
  CONSTRAINT `telefonos_ibfk_3` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`)
) ;

CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_documento` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ;

CREATE TABLE `tipo_nivel` (
  `id_tipo_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nivel` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_nivel`)
) ;

CREATE TABLE `tipo_parentesco` (
  `id_tipo_parentesco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_parentesco`)
) ;

CREATE TABLE `tipo_procedencia` (
  `id_tipo_procedencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_procedencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_procedencia`)
) ;


CREATE TABLE `tratamiento` (
  `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_condicion_medica` int(11) NOT NULL,
  `nombre_tratamiento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `id_condicion_medica` (`id_condicion_medica`),
  CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica` (`id_condicion_medica`)
) ;

CREATE TABLE `ubicacion` (
  `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_sector` int(11) NOT NULL,
  `nro_vivienda` varchar(45) NOT NULL,
  `calle_vereda_avenida` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ubicacion`),
  KEY `id_sector` (`id_sector`),
  CONSTRAINT `ubicacion_ibfk_1` FOREIGN KEY (`id_sector`) REFERENCES `sector` (`id_sector`)
) ;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `id_correo` int(11) NOT NULL,
  `contrasena` varchar(166) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  KEY `id_correo` (`id_correo`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_correo`) REFERENCES `correo` (`id_correo`)
) ;