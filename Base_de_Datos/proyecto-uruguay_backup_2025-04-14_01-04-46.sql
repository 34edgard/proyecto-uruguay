

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO anio_escolar (id_anio_escolar, anio, id_periodo_escolar, id_aula, ci_escolar) VALUES ('1', '2025', '1', '1', '525309309');
INSERT INTO anio_escolar (id_anio_escolar, anio, id_periodo_escolar, id_aula, ci_escolar) VALUES ('2', '2025', '1', '1', '625309309');


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO aulas (id_aula, nombre_aula, id_seccion) VALUES ('1', 'Aula 1', '2');


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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('2', '22509309', '1', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('3', '22509309', '2', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('4', '22509309', '3', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('5', '22509309', '4', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('6', '22509309', '5', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('7', '32509309', '1', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('8', '32509309', '2', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('9', '32509309', '3', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('10', '32509309', '4', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('11', '32509309', '5', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('12', '425309309', '1', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('13', '425309309', '2', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('14', '425309309', '3', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('15', '425309309', '4', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('16', '425309309', '5', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('17', '42509309', '1', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('18', '42509309', '2', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('19', '42509309', '3', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('20', '42509309', '4', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('21', '42509309', '5', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('22', '525309309', '1', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('23', '525309309', '2', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('24', '525309309', '3', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('25', '525309309', '4', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('26', '525309309', '5', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('27', '625309309', '1', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('28', '625309309', '2', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('29', '625309309', '3', 'entregado', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('30', '625309309', '4', 'pendiente', 'ninguna');
INSERT INTO documentos_inscripcion (id_documento, ci_escolar, id_tipo_documento, estado, observaciones) VALUES ('31', '625309309', '5', 'entregado', 'ninguna');


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

INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('2', 'Edgard', 'Marcano', '2025-04-13', '14', '1', '0', '0', 'masculino', '34', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('309', 'Edgard', 'Marcano', '2025-04-12', '4', '1', '0', '0', 'masculino', '24', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('309309', 'Edgard', 'Marcano', '2024-04-09', '3', '1', '1', '1', 'masculino', '23', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('12509309', 'Edgard', 'Marcano', '2025-04-13', '10', '1', '0', '0', 'masculino', '30', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('22509309', 'Edgard', 'Marcano', '2025-04-13', '18', '1', '0', '0', 'masculino', '38', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('32509309', 'Edgard', 'Marcano', '2025-04-13', '19', '1', '0', '0', 'masculino', '39', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('42509309', 'Edgard', 'Marcano', '2025-04-13', '21', '1', '0', '0', 'masculino', '41', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('125309309', 'Edgard', 'Marcano', '2025-04-13', '12', '1', '0', '0', 'masculino', '32', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('225309309', 'Edgard', 'Marcano', '2025-04-13', '16', '1', '0', '0', 'masculino', '36', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('325309309', 'Edgard', 'Marcano', '2025-04-13', '17', '1', '0', '0', 'masculino', '37', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('425309309', 'Edgard', 'Marcano', '2025-04-13', '20', '1', '0', '0', 'masculino', '40', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('525309309', 'Edgard', 'Marcano', '2025-04-13', '22', '1', '0', '0', 'masculino', '42', '1', '1', '28', '1');
INSERT INTO estudiante (ci_escolar, nombres, apellidos, fecha_nacimiento, id_lugar_nacimiento, id_nacionalidad, edad_ano, edad_meses, sexo, id_ubicacion, id_procedencia, id_condicion_medica, id_discapacidad, id_estado_nutricional) VALUES ('625309309', 'Luis', 'Lara', '2025-04-13', '23', '1', '0', '0', 'masculino', '43', '1', '1', '28', '1');


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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inscripciones (id_inscripcion, ci_escolar, fecha_inscripcion) VALUES ('1', '425309309', '2025-04-13');
INSERT INTO inscripciones (id_inscripcion, ci_escolar, fecha_inscripcion) VALUES ('2', '42509309', '2025-04-13');
INSERT INTO inscripciones (id_inscripcion, ci_escolar, fecha_inscripcion) VALUES ('3', '525309309', '2025-04-13');
INSERT INTO inscripciones (id_inscripcion, ci_escolar, fecha_inscripcion) VALUES ('4', '625309309', '2025-04-14');


CREATE TABLE `inscripciones_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_inscripcion` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`,`id_inscripcion`),
  KEY `id_inscripcion` (`id_inscripcion`),
  CONSTRAINT `inscripciones_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  CONSTRAINT `inscripciones_estudiante_ibfk_2` FOREIGN KEY (`id_inscripcion`) REFERENCES `inscripciones` (`id_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inscripciones_estudiante (ci_escolar, id_inscripcion) VALUES ('425309309', '1');
INSERT INTO inscripciones_estudiante (ci_escolar, id_inscripcion) VALUES ('42509309', '2');
INSERT INTO inscripciones_estudiante (ci_escolar, id_inscripcion) VALUES ('525309309', '2');
INSERT INTO inscripciones_estudiante (ci_escolar, id_inscripcion) VALUES ('625309309', '2');


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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('1', '14', '5', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('2', '14', '7', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('3', '14', '7', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('4', '18', '7', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('5', '14', '1', '8');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('6', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('7', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('8', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('9', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('10', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('11', '14', '1', '9');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('12', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('13', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('14', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('15', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('16', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('17', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('18', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('19', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('20', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('21', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('22', '14', '1', '1');
INSERT INTO lugar_nacimiento (id_lugar_nacimiento, id_estado, id_municipio, id_parroquia) VALUES ('23', '14', '1', '1');


CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `nombre_municipio` varchar(45) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('14', '1', 'Alto Orinoco');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('15', '1', 'Atabapo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('16', '1', 'Atures');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('17', '1', 'Autana');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('18', '1', 'Manapiare');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('19', '1', 'Maroa');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('20', '1', 'Río Negro');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('21', '2', 'Anaco');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('22', '2', 'Aragua');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('23', '2', 'Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('24', '2', 'Bruzual');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('25', '2', 'Cajigal');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('26', '2', 'Carvajal');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('27', '2', 'Diego Bautista Urbaneja');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('28', '2', 'Freites');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('29', '2', 'Guanipa');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('30', '2', 'Guanta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('31', '2', 'Independencia');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('32', '2', 'Libertad');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('33', '2', 'McGregor');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('34', '2', 'Miranda');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('35', '2', 'Monagas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('36', '2', 'Peñalver');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('37', '2', 'Píritu');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('38', '2', 'San José de Guanipa');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('39', '2', 'San Juan de Capistrano');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('40', '2', 'Santa Ana');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('41', '2', 'Simón Rodríguez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('42', '2', 'Sotillo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('43', '3', 'Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('44', '3', 'Camatagua');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('45', '3', 'Francisco Linares Alcántara');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('46', '3', 'Girardot');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('47', '3', 'José Ángel Lamas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('48', '3', 'José Félix Ribas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('49', '3', 'José Rafael Revenga');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('50', '3', 'Libertador');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('51', '3', 'Mario Briceño Iragorry');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('52', '3', 'Ocumare de la Costa de Oro');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('53', '3', 'San Casimiro');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('54', '3', 'San Sebastián');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('55', '3', 'Santiago Mariño');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('56', '3', 'Santos Michelena');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('57', '3', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('58', '3', 'Tovar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('59', '3', 'Urdaneta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('60', '3', 'Zamora');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('61', '4', 'Alberto Arvelo Torrealba');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('62', '4', 'Andrés Eloy Blanco');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('63', '4', 'Antonio José de Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('64', '4', 'Arismendi');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('65', '4', 'Barinas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('66', '4', 'Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('67', '4', 'Cruz Paredes');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('68', '4', 'Ezequiel Zamora');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('69', '4', 'Obispos');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('70', '4', 'Pedraza');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('71', '4', 'Rojas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('72', '4', 'Sosa');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('73', '5', 'Caroní');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('74', '5', 'Cedeño');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('75', '5', 'El Callao');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('76', '5', 'Gran Sabana');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('77', '5', 'Heres');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('78', '5', 'Piar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('79', '5', 'Roscio');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('80', '5', 'Sifontes');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('81', '5', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('82', '5', 'Padre Pedro Chien');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('83', '6', 'Bejuma');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('84', '6', 'Carlos Arvelo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('85', '6', 'Diego Ibarra');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('86', '6', 'Guacara');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('87', '6', 'Juan José Mora');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('88', '6', 'Libertador');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('89', '6', 'Los Guayos');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('90', '6', 'Miranda');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('91', '6', 'Montalbán');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('92', '6', 'Naguanagua');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('93', '6', 'Puerto Cabello');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('94', '6', 'San Diego');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('95', '6', 'San Joaquín');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('96', '6', 'Valencia');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('97', '7', 'Anzoátegui');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('98', '7', 'Tinaquillo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('99', '7', 'Girardot');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('100', '7', 'Lima Blanco');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('101', '7', 'Pao de San Juan Bautista');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('102', '7', 'Ricaurte');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('103', '7', 'Rómulo Gallegos');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('104', '7', 'San Carlos');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('105', '8', 'Antonio Díaz');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('106', '8', 'Casacoima');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('107', '8', 'Pedernales');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('108', '8', 'Tucupita');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('109', '9', 'Acosta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('110', '9', 'Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('111', '9', 'Buchivacoa');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('112', '9', 'Cacique Manaure');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('113', '9', 'Carirubana');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('114', '9', 'Colina');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('115', '9', 'Dabajuro');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('116', '9', 'Democracia');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('117', '9', 'Falcón');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('118', '9', 'Federación');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('119', '9', 'Jacura');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('120', '9', 'Los Taques');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('121', '9', 'Mauroa');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('122', '9', 'Miranda');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('123', '9', 'Monseñor Iturriza');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('124', '9', 'Palmasola');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('125', '9', 'Petit');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('126', '9', 'Píritu');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('127', '9', 'San Francisco');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('128', '9', 'Silva');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('129', '9', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('130', '9', 'Tocópero');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('131', '9', 'Unión');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('132', '9', 'Urumaco');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('133', '9', 'Zamora');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('134', '10', 'Camaguán');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('135', '10', 'Chaguaramas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('136', '10', 'El Socorro');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('137', '10', 'José Félix Ribas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('138', '10', 'José Tadeo Monagas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('139', '10', 'Juan Germán Roscio');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('140', '10', 'Julián Mellado');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('141', '10', 'Las Mercedes');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('142', '10', 'Pedro Zaraza');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('143', '10', 'San Gerónimo de Guayabal');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('144', '10', 'San José de Guaribe');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('145', '10', 'Santa María de Ipire');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('146', '10', 'Sebastián Francisco de Miranda');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('147', '10', 'Ortiz');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('148', '11', 'Andrés Eloy Blanco');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('149', '11', 'Crespo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('150', '11', 'Iribarren');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('151', '11', 'Jiménez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('152', '11', 'Morán');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('153', '11', 'Palavecino');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('154', '11', 'Simón Planas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('155', '11', 'Torres');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('156', '11', 'Urdaneta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('157', '12', 'Alberto Adriani');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('158', '12', 'Andrés Bello');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('159', '12', 'Antonio Pinto Salinas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('160', '12', 'Aricagua');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('161', '12', 'Arzobispo Chacón');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('162', '12', 'Campo Elías');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('163', '12', 'Caracciolo Parra Olmedo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('164', '12', 'Cardenal Quintero');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('165', '12', 'Guaraque');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('166', '12', 'Julio César Salas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('167', '12', 'Justo Briceño');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('168', '12', 'Libertador');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('169', '12', 'Miranda');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('170', '12', 'Obispo Ramos de Lora');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('171', '12', 'Padre Noguera');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('172', '12', 'Pueblo Llano');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('173', '12', 'Rangel');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('174', '12', 'Rivas Dávila');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('175', '12', 'Santos Marquina');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('176', '12', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('177', '12', 'Tovar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('178', '12', 'Tulio Febres Cordero');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('179', '12', 'Zea');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('180', '13', 'Acevedo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('181', '13', 'Andrés Bello');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('182', '13', 'Baruta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('183', '13', 'Brión');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('184', '13', 'Buroz');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('185', '13', 'Carrizal');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('186', '13', 'Chacao');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('187', '13', 'Cristóbal Rojas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('188', '13', 'El Hatillo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('189', '13', 'Guaicaipuro');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('190', '13', 'Independencia');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('191', '13', 'Lander');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('192', '13', 'Los Salias');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('193', '13', 'Páez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('194', '13', 'Paz Castillo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('195', '13', 'Plaza');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('196', '13', 'Simón Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('197', '13', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('198', '13', 'Urdaneta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('199', '13', 'Zamora');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('200', '15', 'Antolín del Campo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('201', '15', 'Arismendi');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('202', '15', 'Díaz');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('203', '15', 'García');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('204', '15', 'Gómez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('205', '15', 'Maneiro');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('206', '15', 'Marcano');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('207', '15', 'Mariño');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('208', '15', 'Península de Macanao');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('209', '15', 'Tubores');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('210', '15', 'Villalba');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('211', '16', 'Agua Blanca');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('212', '16', 'Araure');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('213', '16', 'Esteller');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('214', '16', 'Guanare');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('215', '16', 'Guanarito');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('216', '16', 'José Antonio Páez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('217', '16', 'Ospino');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('218', '16', 'Páez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('219', '16', 'Papelón');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('220', '16', 'San Genaro de Boconoíto');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('221', '16', 'San Rafael de Onoto');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('222', '16', 'Santa Rosalía');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('223', '16', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('224', '16', 'Turén');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('225', '17', 'Andrés Eloy Blanco');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('226', '17', 'Andrés Mata');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('227', '17', 'Arismendi');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('228', '17', 'Benítez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('229', '17', 'Bermúdez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('230', '17', 'Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('231', '17', 'Cajigal');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('232', '17', 'Cruz Salmerón Acosta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('233', '17', 'Libertador');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('234', '17', 'Mariño');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('235', '17', 'Mejía');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('236', '17', 'Montes');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('237', '17', 'Ribero');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('238', '17', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('239', '17', 'Valdez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('240', '18', 'Andrés Bello');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('241', '18', 'Antonio Rómulo Costa');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('242', '18', 'Ayacucho');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('243', '18', 'Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('244', '18', 'Cárdenas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('245', '18', 'Córdoba');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('246', '18', 'Fernández Feo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('247', '18', 'Francisco de Miranda');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('248', '18', 'García de Hevia');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('249', '18', 'Guásimos');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('250', '18', 'Independencia');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('251', '18', 'Jáuregui');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('252', '18', 'José María Vargas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('253', '18', 'Junín');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('254', '18', 'Libertad');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('255', '18', 'Libertador');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('256', '18', 'Lobatera');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('257', '18', 'Michelena');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('258', '18', 'Panamericano');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('259', '18', 'Pedro María Ureña');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('260', '18', 'Rafael Urdaneta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('261', '18', 'Samuel Darío Maldonado');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('262', '18', 'San Cristóbal');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('263', '18', 'Seboruco');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('264', '18', 'Simón Rodríguez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('265', '18', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('266', '18', 'Torbes');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('267', '18', 'Uribante');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('268', '18', 'San Judas Tadeo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('269', '19', 'Andrés Bello');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('270', '19', 'Bocono');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('271', '19', 'Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('272', '19', 'Candelaria');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('273', '19', 'Carache');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('274', '19', 'Escuque');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('275', '19', 'José Felipe Márquez Cañizales');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('276', '19', 'Juan Vicente Campos Elías');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('277', '19', 'La Ceiba');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('278', '19', 'Miranda');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('279', '19', 'Monte Carmelo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('280', '19', 'Motatán');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('281', '19', 'Pampán');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('282', '19', 'Pampanito');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('283', '19', 'Rafael Rangel');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('284', '19', 'San Rafael de Carvajal');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('285', '19', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('286', '19', 'Trujillo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('287', '19', 'Urdaneta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('288', '19', 'Valera');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('289', '20', 'Vargas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('290', '21', 'Arístides Bastidas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('291', '21', 'Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('292', '21', 'Bruzual');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('293', '21', 'Cocorote');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('294', '21', 'Independencia');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('295', '21', 'José Antonio Páez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('296', '21', 'La Trinidad');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('297', '21', 'Manuel Monge');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('298', '21', 'Nirgua');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('299', '21', 'Peña');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('300', '21', 'San Felipe');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('301', '21', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('302', '21', 'Urachiche');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('303', '21', 'Veroes');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('304', '22', 'Almirante Padilla');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('305', '22', 'Baralt');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('306', '22', 'Cabimas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('307', '22', 'Catatumbo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('308', '22', 'Colón');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('309', '22', 'Francisco Javier Pulgar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('310', '22', 'Guajira');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('311', '22', 'Jesús Enrique Lossada');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('312', '22', 'Jesús María Semprún');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('313', '22', 'La Cañada de Urdaneta');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('314', '22', 'Lagunillas');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('315', '22', 'Machiques de Perijá');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('316', '22', 'Mara');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('317', '22', 'Maracaibo');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('318', '22', 'Miranda');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('319', '22', 'Páez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('320', '22', 'Rosario de Perijá');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('321', '22', 'San Francisco');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('322', '22', 'Santa Rita');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('323', '22', 'Simón Bolívar');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('324', '22', 'Sucre');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('325', '22', 'Valmore Rodríguez');
INSERT INTO municipio (id_municipio, id_estado, nombre_municipio) VALUES ('326', '23', 'Dependencias Federales');


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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO niveles (id_nivel, id_tipo_nivel) VALUES ('1', '1');
INSERT INTO niveles (id_nivel, id_tipo_nivel) VALUES ('2', '1');
INSERT INTO niveles (id_nivel, id_tipo_nivel) VALUES ('3', '1');
INSERT INTO niveles (id_nivel, id_tipo_nivel) VALUES ('4', '1');


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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO peso (id_peso, ci_escolar, peso) VALUES ('1', '32509309', '40');
INSERT INTO peso (id_peso, ci_escolar, peso) VALUES ('2', '425309309', '40');
INSERT INTO peso (id_peso, ci_escolar, peso) VALUES ('3', '42509309', '40');
INSERT INTO peso (id_peso, ci_escolar, peso) VALUES ('4', '525309309', '40');
INSERT INTO peso (id_peso, ci_escolar, peso) VALUES ('5', '625309309', '40');


CREATE TABLE `prendas` (
  `id_prenda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_prenda` varchar(35) NOT NULL,
  PRIMARY KEY (`id_prenda`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO prendas (id_prenda, nombre_prenda) VALUES ('1', 'Camisa');
INSERT INTO prendas (id_prenda, nombre_prenda) VALUES ('2', 'Pantalon');
INSERT INTO prendas (id_prenda, nombre_prenda) VALUES ('3', 'Zapato');
INSERT INTO prendas (id_prenda, nombre_prenda) VALUES ('4', 'Circunferencia Baquial');


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO secciones (id_seccion, nombre_seccion, id_nivel) VALUES ('1', '', '1');
INSERT INTO secciones (id_seccion, nombre_seccion, id_nivel) VALUES ('2', 'Sección A', '1');
INSERT INTO secciones (id_seccion, nombre_seccion, id_nivel) VALUES ('3', 'Sección B', '1');


CREATE TABLE `sector` (
  `id_sector` int(11) NOT NULL AUTO_INCREMENT,
  `id_parroquia` int(11) NOT NULL,
  `nombre_sector` varchar(45) NOT NULL,
  PRIMARY KEY (`id_sector`),
  KEY `id_parroquia` (`id_parroquia`),
  CONSTRAINT `sector_ibfk_1` FOREIGN KEY (`id_parroquia`) REFERENCES `parroquia` (`id_parroquia`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('34', '1', 'Sector El Furrial Centro');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('35', '1', 'Sector La Manga');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('36', '1', 'Sector Las Parcelas');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('37', '1', 'Sector Sabana Grande');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('38', '2', 'Sector Centro San Simón');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('39', '2', 'Sector La Floresta');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('40', '2', 'Sector Fundemos');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('41', '2', 'Sector Villas del Sur');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('42', '3', 'Sector Alto de Los Godos Centro');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('43', '3', 'Sector Juana La Avanzadora');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('44', '3', 'Sector La Constitucion');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('45', '3', 'Sector Terrazas del Oeste');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('46', '4', 'Sector Boquerón Centro');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('47', '4', 'Sector El Caruto');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('48', '4', 'Sector La Candelaria');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('49', '4', 'Sector Valle Verde');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('50', '5', 'Sector Las Cocuizas Centro');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('51', '5', 'Sector La Gran Victoria');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('52', '5', 'Sector Los Cortijos');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('53', '5', 'Sector Doña Menca');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('54', '6', 'Sector San Vicente Centro');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('55', '6', 'Sector Las Carolinas');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('56', '6', 'Sector Brisas del Orinoco');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('57', '6', 'Sector La Puente');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('58', '7', 'Sector El Corozo Centro');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('59', '7', 'Sector El Zamuro');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('60', '7', 'Sector La Laguna');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('61', '7', 'Sector Palital');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('62', '8', 'Sector La Cruz Centro');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('63', '8', 'Sector Nuevo Horizonte');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('64', '8', 'Sector Simón Bolívar');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('65', '8', 'Sector 19 de Abril');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('66', '9', 'Sector Centro Maturín');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('67', '9', 'Sector Los Guaritos');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('68', '9', 'Sector Las Avenidas');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('69', '9', 'Sector Zona Industrial');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('70', '10', 'Sector Jusepín Centro');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('71', '10', 'Sector El Paraíso');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('72', '10', 'Sector La Toscana');
INSERT INTO sector (id_sector, id_parroquia, nombre_sector) VALUES ('73', '10', 'Sector La Ceiba');


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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('2', '32509309', '1', '4');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('3', '32509309', '2', '10');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('4', '32509309', '3', '18');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('5', '32509309', '4', '36');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('6', '425309309', '1', '4');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('7', '425309309', '2', '10');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('8', '425309309', '3', '18');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('9', '425309309', '4', '36');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('10', '42509309', '1', '4');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('11', '42509309', '2', '10');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('12', '42509309', '3', '18');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('13', '42509309', '4', '36');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('14', '525309309', '1', '4');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('15', '525309309', '2', '10');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('16', '525309309', '3', '18');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('17', '525309309', '4', '36');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('18', '625309309', '1', '4');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('19', '625309309', '2', '10');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('20', '625309309', '3', '18');
INSERT INTO tallas (id_talla, ci_escolar, id_prenda, talla) VALUES ('21', '625309309', '4', '36');


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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tipo_documento (id_tipo_documento, nombre_documento) VALUES ('1', 'Partida de Nacimiento');
INSERT INTO tipo_documento (id_tipo_documento, nombre_documento) VALUES ('2', 'Copia de cedula de la Madre');
INSERT INTO tipo_documento (id_tipo_documento, nombre_documento) VALUES ('3', 'Copia de cedula del Padre');
INSERT INTO tipo_documento (id_tipo_documento, nombre_documento) VALUES ('4', '4 Fotos tipo Carnet');
INSERT INTO tipo_documento (id_tipo_documento, nombre_documento) VALUES ('5', 'Copia del Certificado de Vacuas');


CREATE TABLE `tipo_nivel` (
  `id_tipo_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nivel` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tipo_nivel (id_tipo_nivel, nombre_nivel) VALUES ('1', 'NIVEL I');
INSERT INTO tipo_nivel (id_tipo_nivel, nombre_nivel) VALUES ('2', 'NIVEL II');
INSERT INTO tipo_nivel (id_tipo_nivel, nombre_nivel) VALUES ('3', 'NIVEL III');
INSERT INTO tipo_nivel (id_tipo_nivel, nombre_nivel) VALUES ('4', 'Nivel 1');


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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('26', '1', 'ninguno', 'to colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('27', '1', 'ninguno', 'viento colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('28', '1', 'ninguno', 'nto colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('29', '1', 'ninguno', 'to colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('30', '1', 'ninguno', 'nto colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('31', '1', 'ninguno', 'iento colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('32', '1', 'ninguno', 'to colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('33', '1', 'ninguno', 'iento colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('34', '1', 'ninguno', 'nto colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('35', '1', 'ninguno', 'nto colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('36', '1', 'ninguno', 'ento colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('37', '1', 'ninguno', 'to colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('38', '1', 'ninguno', 'o 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('39', '1', 'ninguno', 'ento colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('40', '1', 'ninguno', 'nto colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('41', '1', 'ninguno', 'calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('42', '1', 'ninguno', 'nto colao 2 calle 27 b');
INSERT INTO ubicacion (id_ubicacion, id_sector, nro_vivienda, calle_vereda_avenida) VALUES ('43', '1', 'ninguno', 'Barrio adentro ');


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
