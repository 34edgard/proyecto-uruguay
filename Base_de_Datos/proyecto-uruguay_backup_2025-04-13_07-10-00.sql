

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `anio_escolar_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_anio_escolar` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_anio_escolar`),
  KEY `id_anio_escolar` (`id_anio_escolar`),
  CONSTRAINT `anio_escolar_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `anio_escolar_estudiante_ibfk_2` FOREIGN KEY (`id_anio_escolar`) REFERENCES `anio_escolar` (`id_anio_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `archivos` (
  `id_archivo` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `nombre_archivo` varchar(100) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `tipo_archivo` enum('documento','foto','otro') NOT NULL,
  PRIMARY KEY (`id_archivo`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `asistencia` (
  `id_asistencia` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `asistio` enum('si','no') NOT NULL DEFAULT 'si',
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `aulas` (
  `id_aula` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_aula` varchar(20) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  PRIMARY KEY (`id_aula`),
  KEY `id_seccion` (`id_seccion`),
  CONSTRAINT `aulas_ibfk_1` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id_seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `conceptos_pago` (
  `id_concepto_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_concepto` varchar(50) NOT NULL,
  PRIMARY KEY (`id_concepto_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `condicion_medica` (
  `id_condicion_medica` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_condicion_medica` varchar(50) NOT NULL,
  PRIMARY KEY (`id_condicion_medica`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO condicion_medica (id_condicion_medica, nombre_condicion_medica) VALUES ('1', 'Ninguna');
INSERT INTO condicion_medica (id_condicion_medica, nombre_condicion_medica) VALUES ('2', 'Asma');
INSERT INTO condicion_medica (id_condicion_medica, nombre_condicion_medica) VALUES ('3', 'Alergias (Especificar)');
INSERT INTO condicion_medica (id_condicion_medica, nombre_condicion_medica) VALUES ('4', 'Diabetes');
INSERT INTO condicion_medica (id_condicion_medica, nombre_condicion_medica) VALUES ('5', 'Epilepsia');
INSERT INTO condicion_medica (id_condicion_medica, nombre_condicion_medica) VALUES ('6', 'Enfermedad Cardíaca');
INSERT INTO condicion_medica (id_condicion_medica, nombre_condicion_medica) VALUES ('7', 'Problemas Renales');
INSERT INTO condicion_medica (id_condicion_medica, nombre_condicion_medica) VALUES ('8', 'Problemas Digestivos');
INSERT INTO condicion_medica (id_condicion_medica, nombre_condicion_medica) VALUES ('9', 'Problemas de Salud Mental (Especificar)');
INSERT INTO condicion_medica (id_condicion_medica, nombre_condicion_medica) VALUES ('10', 'Otra Condición Médica (Especificar)');


CREATE TABLE `condicion_medica_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_condicion_medica` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_condicion_medica`),
  KEY `id_condicion_medica` (`id_condicion_medica`),
  CONSTRAINT `condicion_medica_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `condicion_medica_estudiante_ibfk_2` FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica` (`id_condicion_medica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `configuracion` (
  `id_configuracion` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) NOT NULL,
  `valor` varchar(255) NOT NULL,
  PRIMARY KEY (`id_configuracion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `correo` (
  `id_correo` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id_correo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO correo (id_correo, email) VALUES ('1', 'correoDePrueva_1@gmail.com');
INSERT INTO correo (id_correo, email) VALUES ('2', 'correoDePrueva_2@gmail.com');
INSERT INTO correo (id_correo, email) VALUES ('3', 'phjhv@gmail.com');
INSERT INTO correo (id_correo, email) VALUES ('4', 'vjjvj');
INSERT INTO correo (id_correo, email) VALUES ('5', 'hchjjb');
INSERT INTO correo (id_correo, email) VALUES ('6', 'hchjjb');
INSERT INTO correo (id_correo, email) VALUES ('7', 'jokkl');
INSERT INTO correo (id_correo, email) VALUES ('8', 'jokkl');
INSERT INTO correo (id_correo, email) VALUES ('9', 'jokkl@ff');
INSERT INTO correo (id_correo, email) VALUES ('10', 'ghh@ghh');
INSERT INTO correo (id_correo, email) VALUES ('11', 'djj@hh');
INSERT INTO correo (id_correo, email) VALUES ('12', 'pelo@gmail.com');


CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_ubicacion` int(11) NOT NULL,
  `tipo_direccion` enum('habitacion','trabajo') NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `id_ubicacion` (`id_ubicacion`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('1', '10', 'trabajo');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('2', '9', 'habitacion');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('3', '12', 'trabajo');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('4', '11', 'habitacion');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('5', '14', 'trabajo');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('6', '13', 'habitacion');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('7', '16', 'trabajo');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('8', '15', 'habitacion');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('9', '18', 'trabajo');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('10', '17', 'habitacion');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('11', '20', 'trabajo');
INSERT INTO direccion (id_direccion, id_ubicacion, tipo_direccion) VALUES ('12', '19', 'habitacion');


CREATE TABLE `discapacidad` (
  `id_discapacidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_discapacidad` varchar(70) NOT NULL,
  PRIMARY KEY (`id_discapacidad`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO discapacidad (id_discapacidad, nombre_discapacidad) VALUES ('28', 'Ninguna');
INSERT INTO discapacidad (id_discapacidad, nombre_discapacidad) VALUES ('29', 'Discapacidad Visual');
INSERT INTO discapacidad (id_discapacidad, nombre_discapacidad) VALUES ('30', 'Discapacidad Auditiva');
INSERT INTO discapacidad (id_discapacidad, nombre_discapacidad) VALUES ('31', 'Discapacidad Motora');
INSERT INTO discapacidad (id_discapacidad, nombre_discapacidad) VALUES ('32', 'Discapacidad Intelectual');
INSERT INTO discapacidad (id_discapacidad, nombre_discapacidad) VALUES ('33', 'Trastorno del Espectro Autista (TEA)');
INSERT INTO discapacidad (id_discapacidad, nombre_discapacidad) VALUES ('34', 'Trastorno por Déficit de Atención e Hiperactividad (TDAH)');
INSERT INTO discapacidad (id_discapacidad, nombre_discapacidad) VALUES ('35', 'Discapacidad del Lenguaje');
INSERT INTO discapacidad (id_discapacidad, nombre_discapacidad) VALUES ('36', 'Otra Discapacidad (Especificar)');


CREATE TABLE `discapacidad_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_discapacidad` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_discapacidad`),
  KEY `id_discapacidad` (`id_discapacidad`),
  CONSTRAINT `discapacidad_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `discapacidad_estudiante_ibfk_2` FOREIGN KEY (`id_discapacidad`) REFERENCES `discapacidad` (`id_discapacidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `docente` (
  `id_docente` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO docente (id_docente, cedula, nombres, apellidos, fecha_nacimiento, estado) VALUES ('9', '5968', 'Pedro2', 'Culian', '2006-12-13', 'activo');
INSERT INTO docente (id_docente, cedula, nombres, apellidos, fecha_nacimiento, estado) VALUES ('19', '390390', 'Edgard', 'Marcano', '2002-06-07', 'activo');
INSERT INTO docente (id_docente, cedula, nombres, apellidos, fecha_nacimiento, estado) VALUES ('20', '868', 'Edgard', 'Marcano', '2004-03-18', 'activo');
INSERT INTO docente (id_docente, cedula, nombres, apellidos, fecha_nacimiento, estado) VALUES ('21', '2879208', 'Luis', 'Perez', '2002-06-07', 'activo');


CREATE TABLE `docente_aula` (
  `id_docente` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`,`id_aula`),
  KEY `id_aula` (`id_aula`),
  CONSTRAINT `docente_aula_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `docente_aula_ibfk_2` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `docente_nivel` (
  `id_docente` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`,`id_nivel`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `docente_nivel_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `docente_nivel_ibfk_2` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `docente_seccion` (
  `id_docente` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`,`id_seccion`),
  KEY `id_seccion` (`id_seccion`),
  CONSTRAINT `docente_seccion_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `docente_seccion_ibfk_2` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id_seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) NOT NULL,
  `nombre_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('1', '1', 'Amazonas');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('2', '1', 'Anzoátegui');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('3', '1', 'Aragua');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('4', '1', 'Barinas');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('5', '1', 'Bolívar');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('6', '1', 'Carabobo');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('7', '1', 'Cojedes');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('8', '1', 'Delta Amacuro');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('9', '1', 'Falcón');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('10', '1', 'Guárico');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('11', '1', 'Lara');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('12', '1', 'Mérida');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('13', '1', 'Miranda');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('14', '1', 'Monagas');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('15', '1', 'Nueva Esparta');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('16', '1', 'Portuguesa');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('17', '1', 'Sucre');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('18', '1', 'Táchira');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('19', '1', 'Trujillo');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('20', '1', 'Vargas');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('21', '1', 'Yaracuy');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('22', '1', 'Zulia');
INSERT INTO estado (id_estado, id_pais, nombre_estado) VALUES ('23', '1', 'Dependencias Federales');


CREATE TABLE `estado_nutricional` (
  `id_estado_nutricional` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_nutricional` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado_nutricional`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO estado_nutricional (id_estado_nutricional, nombre_estado_nutricional) VALUES ('1', 'Normal');
INSERT INTO estado_nutricional (id_estado_nutricional, nombre_estado_nutricional) VALUES ('2', 'Bajo Peso');
INSERT INTO estado_nutricional (id_estado_nutricional, nombre_estado_nutricional) VALUES ('3', 'Sobrepeso');
INSERT INTO estado_nutricional (id_estado_nutricional, nombre_estado_nutricional) VALUES ('4', 'Obesidad');


CREATE TABLE `estado_nutricional_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_estado_nutricional` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_estado_nutricional`),
  KEY `id_estado_nutricional` (`id_estado_nutricional`),
  CONSTRAINT `estado_nutricional_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `estado_nutricional_estudiante_ibfk_2` FOREIGN KEY (`id_estado_nutricional`) REFERENCES `estado_nutricional` (`id_estado_nutricional`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('309', 'Edgard', 'Marcano', '2025-04-12', '4', '1', '0', '0', 'masculino', '24', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('309309', 'Edgard', 'Marcano', '2024-04-09', '3', '1', '1', '1', 'masculino', '23', '1', '1', '28', '1');


CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(100) NOT NULL,
  `fecha_evento` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `incidentes` (
  `id_incidente` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `fecha_incidente` date NOT NULL,
  `descripcion` text NOT NULL,
  `acciones_tomadas` text DEFAULT NULL,
  PRIMARY KEY (`id_incidente`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `incidentes_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `inscripciones` (
  `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `inscripciones_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_inscripcion` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_inscripcion`),
  KEY `id_inscripcion` (`id_inscripcion`),
  CONSTRAINT `inscripciones_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `inscripciones_estudiante_ibfk_2` FOREIGN KEY (`id_inscripcion`) REFERENCES `inscripciones` (`id_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('1', '14', '5', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('2', '14', '7', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('3', '14', '7', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('4', '18', '7', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('5', '14', '1', '8');


CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `nombre_municipio` varchar(45) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('1', '14', 'Maturín');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('2', '14', 'Acosta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('3', '14', 'Aguasay');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('4', '14', 'Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('5', '14', 'Caripe');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('6', '14', 'Cedeño');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('7', '14', 'Ezequiel Zamora');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('8', '14', 'Libertador');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('9', '14', 'Piar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('10', '14', 'Punceres');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('11', '14', 'Santa Bárbara');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('12', '14', 'Sotillo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('13', '14', 'Uracoa');


CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nacionalidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO nacionalidad (id_nacionalidad, nombre_nacionalidad) VALUES ('1', 'Venezolana');
INSERT INTO nacionalidad (id_nacionalidad, nombre_nacionalidad) VALUES ('2', 'Extranjera');


CREATE TABLE `nivel_instruccion` (
  `id_nivel_instruccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nivel_instruccion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_nivel_instruccion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO nivel_instruccion (id_nivel_instruccion, nombre_nivel_instruccion) VALUES ('1', 'Ninguno');
INSERT INTO nivel_instruccion (id_nivel_instruccion, nombre_nivel_instruccion) VALUES ('2', 'Primaria Incompleta');
INSERT INTO nivel_instruccion (id_nivel_instruccion, nombre_nivel_instruccion) VALUES ('3', 'Primaria Completa');
INSERT INTO nivel_instruccion (id_nivel_instruccion, nombre_nivel_instruccion) VALUES ('4', 'Secundaria Incompleta');
INSERT INTO nivel_instruccion (id_nivel_instruccion, nombre_nivel_instruccion) VALUES ('5', 'Secundaria Completa');
INSERT INTO nivel_instruccion (id_nivel_instruccion, nombre_nivel_instruccion) VALUES ('6', 'Bachillerato/Preparatoria');
INSERT INTO nivel_instruccion (id_nivel_instruccion, nombre_nivel_instruccion) VALUES ('7', 'Técnico');
INSERT INTO nivel_instruccion (id_nivel_instruccion, nombre_nivel_instruccion) VALUES ('8', 'Universitario Incompleto');
INSERT INTO nivel_instruccion (id_nivel_instruccion, nombre_nivel_instruccion) VALUES ('9', 'Universitario Completo');
INSERT INTO nivel_instruccion (id_nivel_instruccion, nombre_nivel_instruccion) VALUES ('10', 'Postgrado');


CREATE TABLE `niveles` (
  `id_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id_nivel`),
  KEY `id_tipo_nivel` (`id_tipo_nivel`),
  CONSTRAINT `niveles_ibfk_1` FOREIGN KEY (`id_tipo_nivel`) REFERENCES `tipo_nivel` (`id_tipo_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `notificaciones` (
  `id_notificacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_representante` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `estado` enum('enviada','leida') NOT NULL DEFAULT 'enviada',
  PRIMARY KEY (`id_notificacion`),
  KEY `id_representante` (`id_representante`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_representante`) REFERENCES `representantes` (`id_representante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `ocupacion` (
  `id_ocupacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ocupacion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_ocupacion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('1', 'Ama de Casa');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('2', 'Obrero/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('3', 'Empleado/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('4', 'Comerciante');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('5', 'Técnico/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('6', 'Profesional Independiente');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('7', 'Docente');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('8', 'Jubilado/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('9', 'Desempleado/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('10', 'Estudiante');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('11', 'Agricultor/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('12', 'Ganadero/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('13', 'Pescador/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('14', 'Mecánico/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('15', 'Conductor/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('16', 'Enfermero/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('17', 'Médico/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('18', 'Abogado/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('19', 'Ingeniero/a');
INSERT INTO ocupacion (id_ocupacion, nombre_ocupacion) VALUES ('20', 'Militar');


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(45) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO pais (id_pais, nombre_pais) VALUES ('1', 'Venezuela');


CREATE TABLE `parroquia` (
  `id_parroquia` int(11) NOT NULL AUTO_INCREMENT,
  `id_municipio` int(11) NOT NULL,
  `nombre_parroquia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_parroquia`),
  KEY `id_municipio` (`id_municipio`),
  CONSTRAINT `parroquia_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO parroquia (id_parroquia, id_municipio, nombre_parroquia) VALUES ('1', '1', 'El Furrial');
INSERT INTO parroquia (id_parroquia, id_municipio, nombre_parroquia) VALUES ('2', '1', 'San Simón');
INSERT INTO parroquia (id_parroquia, id_municipio, nombre_parroquia) VALUES ('3', '1', 'Alto de Los Godos');
INSERT INTO parroquia (id_parroquia, id_municipio, nombre_parroquia) VALUES ('4', '1', 'Boquerón');
INSERT INTO parroquia (id_parroquia, id_municipio, nombre_parroquia) VALUES ('5', '1', 'Las Cocuizas');
INSERT INTO parroquia (id_parroquia, id_municipio, nombre_parroquia) VALUES ('6', '1', 'San Vicente');
INSERT INTO parroquia (id_parroquia, id_municipio, nombre_parroquia) VALUES ('7', '1', 'El Corozo');
INSERT INTO parroquia (id_parroquia, id_municipio, nombre_parroquia) VALUES ('8', '1', 'La Cruz');
INSERT INTO parroquia (id_parroquia, id_municipio, nombre_parroquia) VALUES ('9', '1', 'Maturín');
INSERT INTO parroquia (id_parroquia, id_municipio, nombre_parroquia) VALUES ('10', '1', 'Jusepín');


CREATE TABLE `periodo_escolar` (
  `id_periodo_escolar` int(11) NOT NULL AUTO_INCREMENT,
  `periodo` varchar(10) NOT NULL,
  PRIMARY KEY (`id_periodo_escolar`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO periodo_escolar (id_periodo_escolar, periodo) VALUES ('1', '2025-2025');
INSERT INTO periodo_escolar (id_periodo_escolar, periodo) VALUES ('2', '2025-2026');
INSERT INTO periodo_escolar (id_periodo_escolar, periodo) VALUES ('3', '2024-2025');
INSERT INTO periodo_escolar (id_periodo_escolar, periodo) VALUES ('4', '2025-2026');
INSERT INTO periodo_escolar (id_periodo_escolar, periodo) VALUES ('5', '2025-2027');


CREATE TABLE `peso` (
  `id_peso` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  PRIMARY KEY (`id_peso`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `peso_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `prendas` (
  `id_prenda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_prenda` varchar(35) NOT NULL,
  PRIMARY KEY (`id_prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `procedencia` (
  `id_procedencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_procedencia` int(11) NOT NULL,
  `nombre_procedencia` varchar(40) NOT NULL,
  PRIMARY KEY (`id_procedencia`),
  KEY `id_tipo_procedencia` (`id_tipo_procedencia`),
  CONSTRAINT `procedencia_ibfk_1` FOREIGN KEY (`id_tipo_procedencia`) REFERENCES `tipo_procedencia` (`id_tipo_procedencia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO procedencia (id_procedencia, id_tipo_procedencia, nombre_procedencia) VALUES ('1', '1', 'Hogar');
INSERT INTO procedencia (id_procedencia, id_tipo_procedencia, nombre_procedencia) VALUES ('2', '1', 'Del Mismo plantel');
INSERT INTO procedencia (id_procedencia, id_tipo_procedencia, nombre_procedencia) VALUES ('3', '1', 'De otro plantel');
INSERT INTO procedencia (id_procedencia, id_tipo_procedencia, nombre_procedencia) VALUES ('4', '1', 'Multihogar');
INSERT INTO procedencia (id_procedencia, id_tipo_procedencia, nombre_procedencia) VALUES ('5', '1', 'Hogar de cuidado');
INSERT INTO procedencia (id_procedencia, id_tipo_procedencia, nombre_procedencia) VALUES ('6', '1', 'Guarderia');
INSERT INTO procedencia (id_procedencia, id_tipo_procedencia, nombre_procedencia) VALUES ('7', '1', 'Otros');


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO representantes (id_representante, cedula, nombres, apellidos, fecha_nacimiento, edad, id_nacionalidad, id_nivel_instruccion, id_ocupacion, id_direccion_habitacion, id_direccion_trabajo) VALUES ('2', '309309', 'Edgard', 'Marcano', '2024-08-07', '0', '1', '6', '1', '2', '1');
INSERT INTO representantes (id_representante, cedula, nombres, apellidos, fecha_nacimiento, edad, id_nacionalidad, id_nivel_instruccion, id_ocupacion, id_direccion_habitacion, id_direccion_trabajo) VALUES ('3', '3063067', 'marco', 'lopez', '2003-09-08', '21', '2', '5', '12', '6', '5');
INSERT INTO representantes (id_representante, cedula, nombres, apellidos, fecha_nacimiento, edad, id_nacionalidad, id_nivel_instruccion, id_ocupacion, id_direccion_habitacion, id_direccion_trabajo) VALUES ('4', '4567', 'marco', 'lopez', '2025-04-16', '-1', '1', '1', '1', '8', '7');
INSERT INTO representantes (id_representante, cedula, nombres, apellidos, fecha_nacimiento, edad, id_nacionalidad, id_nivel_instruccion, id_ocupacion, id_direccion_habitacion, id_direccion_trabajo) VALUES ('5', '2858', 'Edgard', 'Marcano', '2025-04-04', '0', '1', '1', '1', '10', '9');
INSERT INTO representantes (id_representante, cedula, nombres, apellidos, fecha_nacimiento, edad, id_nacionalidad, id_nivel_instruccion, id_ocupacion, id_direccion_habitacion, id_direccion_trabajo) VALUES ('6', '888', 'Edgard', 'Marcano', '2025-04-05', '0', '1', '1', '1', '12', '11');


CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(30) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO roles (id_rol, nombre_rol) VALUES ('1', 'ADMINISTRADOR');
INSERT INTO roles (id_rol, nombre_rol) VALUES ('2', 'SECRETARIA');


CREATE TABLE `salud_estudiante` (
  `id_salud` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `alergias` text DEFAULT NULL,
  `medicamentos` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_salud`),
  KEY `ci_escolar` (`ci_escolar`),
  CONSTRAINT `salud_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `secciones` (
  `id_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_seccion` varchar(20) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id_seccion`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `secciones_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `sector` (
  `id_sector` int(11) NOT NULL AUTO_INCREMENT,
  `id_parroquia` int(11) NOT NULL,
  `nombre_sector` varchar(45) NOT NULL,
  PRIMARY KEY (`id_sector`),
  KEY `id_parroquia` (`id_parroquia`),
  CONSTRAINT `sector_ibfk_1` FOREIGN KEY (`id_parroquia`) REFERENCES `parroquia` (`id_parroquia`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('1', '9', 'Zona Centro');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('2', '9', 'Barrio Obrero');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('3', '9', 'Las Cocuizas');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('4', '9', 'Los Guaritos I');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('5', '9', 'Los Guaritos II');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('6', '9', 'Los Guaritos III');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('7', '9', 'Los Guaritos IV');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('8', '9', 'Los Guaritos V');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('9', '9', 'El Parquecito');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('10', '9', 'La Muralla');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('11', '9', 'La Floresta');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('12', '9', 'Fundemos');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('13', '9', 'Simón Bolívar');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('14', '9', 'Juanico');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('15', '9', 'Los Cortijos');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('16', '9', 'Ciudad Universitaria');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('17', '9', 'Alto Paramaconi');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('18', '9', 'Paramaconi');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('19', '9', 'Villas del Paramaconi');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('20', '9', 'Terrazas del Paramaconi');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('21', '9', 'Doña Menca I');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('22', '9', 'Doña Menca II');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('23', '9', 'Prados del Este');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('24', '9', 'Avenida Bella Vista');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('25', '9', 'Las Brisas del Orinoco');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('26', '9', 'La Concordia');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('27', '9', 'Complejo Habitacional Paramaconi');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('28', '9', 'Lomas del Viento');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('29', '9', 'Valle Verde');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('30', '9', 'El Guayabal');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('31', '9', 'La Cruz');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('32', '9', 'Virgen del Valle');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('33', '9', '23 de Enero');


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO telefonos (id_telefono, ci_escolar, id_representante, id_docente, tipo_telefono, codigo_area, operadora, numero_telefono) VALUES ('2', '', '', '9', 'fijo', '', '', '8658');
INSERT INTO telefonos (id_telefono, ci_escolar, id_representante, id_docente, tipo_telefono, codigo_area, operadora, numero_telefono) VALUES ('12', '', '', '19', 'celular', '', '', '8658');
INSERT INTO telefonos (id_telefono, ci_escolar, id_representante, id_docente, tipo_telefono, codigo_area, operadora, numero_telefono) VALUES ('13', '', '', '20', 'celular', '', '', '8998');
INSERT INTO telefonos (id_telefono, ci_escolar, id_representante, id_docente, tipo_telefono, codigo_area, operadora, numero_telefono) VALUES ('14', '', '', '21', 'celular', '', '', '4128719412');
INSERT INTO telefonos (id_telefono, ci_escolar, id_representante, id_docente, tipo_telefono, codigo_area, operadora, numero_telefono) VALUES ('15', '', '3', '', 'fijo', '', '', '345331');
INSERT INTO telefonos (id_telefono, ci_escolar, id_representante, id_docente, tipo_telefono, codigo_area, operadora, numero_telefono) VALUES ('16', '', '4', '', 'fijo', '', '', '579753');
INSERT INTO telefonos (id_telefono, ci_escolar, id_representante, id_docente, tipo_telefono, codigo_area, operadora, numero_telefono) VALUES ('17', '', '5', '', 'celular', '', '', '222');
INSERT INTO telefonos (id_telefono, ci_escolar, id_representante, id_docente, tipo_telefono, codigo_area, operadora, numero_telefono) VALUES ('18', '', '6', '', 'celular', '', '', '688');


CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_documento` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `tipo_nivel` (
  `id_tipo_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nivel` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `tipo_parentesco` (
  `id_tipo_parentesco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_parentesco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `tipo_procedencia` (
  `id_tipo_procedencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_procedencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_procedencia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tipo_procedencia (id_tipo_procedencia, nombre_procedencia) VALUES ('1', 'otros');


CREATE TABLE `tratamiento` (
  `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_condicion_medica` int(11) NOT NULL,
  `nombre_tratamiento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `id_condicion_medica` (`id_condicion_medica`),
  CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica` (`id_condicion_medica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



CREATE TABLE `ubicacion` (
  `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_sector` int(11) NOT NULL,
  `nro_vivienda` varchar(45) NOT NULL,
  `calle_vereda_avenida` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ubicacion`),
  KEY `id_sector` (`id_sector`),
  CONSTRAINT `ubicacion_ibfk_1` FOREIGN KEY (`id_sector`) REFERENCES `sector` (`id_sector`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('1', '7', '', 'Casa2');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('2', '4', '', 'calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('3', '1', '', 'o 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('4', '7', '', 'alle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('5', '1', 'nimguno', 'Hhhhh');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('6', '1', 'nimguno', 'nto colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('7', '7', 'nimguno', 'Hkok');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('8', '1', 'nimguno', 'olao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('9', '1', 'nimguno', 'Jdjdud');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('10', '1', 'nimguno', 'to colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('11', '15', 'nimguno', 'cas');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('12', '6', 'nimguno', 'mi casa');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('13', '18', 'nimguno', 'cas');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('14', '14', 'nimguno', 'mi casa');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('15', '1', 'nimguno', 'voli');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('16', '1', 'nimguno', 'vilo');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('17', '1', 'nimguno', 'Ggvvv');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('18', '1', 'nimguno', 'o colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('19', '1', 'nimguno', 'Vhhhh');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('20', '7', 'nimguno', 'colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('21', '1', '', 'colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('22', '1', 'ninguno', 'to colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('23', '1', 'ninguno', 'o colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('24', '1', 'ninguno', 'nto colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('25', '1', 'ninguno', 'nto colao 2 calle 27 b');


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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO usuario (id_usuario, cedula, nombres, apellidos, id_rol, usuario, id_correo, contrasena, estado) VALUES ('1', '309309', 'Jose ', 'Alvarez Lopez ', '1', 'Usuario_1', '1', '$2y$10$Iqpu.MxyGyUPnaLSyV7bAup6u//h7N1X8wRi0wneO2KH5yS8AIWpC', 'activo');
INSERT INTO usuario (id_usuario, cedula, nombres, apellidos, id_rol, usuario, id_correo, contrasena, estado) VALUES ('5', '390390', 'Carlosh', 'Marcano', '1', '390390', '5', '$2y$10$Fs0/0/M.4u3L.QZ8FRtXduHd1DgEKI4bBOAmZYhiacwTdGyNoyxlq', 'activo');
