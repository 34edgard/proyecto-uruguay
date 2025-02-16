-- Tabla `roles`
CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(30) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `correo`
CREATE TABLE `correo` (
  `id_correo` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id_correo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `usuario`
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `id_correo` int(11) NOT NULL,
  `contrasena` varchar(166) NOT NULL,
  `estado` enum('activo', 'inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id_usuario`)
  -- FOREIGN KEY (`id_rol`) REFERENCES `roles`(`id_rol`),
  -- FOREIGN KEY (`id_correo`) REFERENCES `correo`(`id_correo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `pais`
CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(45) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `estado`
CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) NOT NULL,
  `nombre_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado`)
  -- FOREIGN KEY (`id_pais`) REFERENCES `pais`(`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `municipio`
CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `nombre_municipio` varchar(45) NOT NULL,
  PRIMARY KEY (`id_municipio`)
  -- FOREIGN KEY (`id_estado`) REFERENCES `estado`(`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `parroquia`
CREATE TABLE `parroquia` (
  `id_parroquia` int(11) NOT NULL AUTO_INCREMENT,
  `id_municipio` int(11) NOT NULL,
  `nombre_parroquia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_parroquia`)
  -- FOREIGN KEY (`id_municipio`) REFERENCES `municipio`(`id_municipio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `sector`
CREATE TABLE `sector` (
  `id_sector` int(11) NOT NULL AUTO_INCREMENT,
  `id_parroquia` int(11) NOT NULL,
  `nombre_sector` varchar(45) NOT NULL,
  PRIMARY KEY (`id_sector`)
  -- FOREIGN KEY (`id_parroquia`) REFERENCES `parroquia`(`id_parroquia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `ubicacion`
CREATE TABLE `ubicacion` (
  `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_sector` int(11) NOT NULL,
  `nro_vivienda` varchar(45) NOT NULL,
  `calle_vereda_avenida` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ubicacion`)
  -- FOREIGN KEY (`id_sector`) REFERENCES `sector`(`id_sector`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `lugar_nacimiento`
CREATE TABLE `lugar_nacimiento` (
  `id_lugar_nacimiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_parroquia` int(11) NOT NULL,
  PRIMARY KEY (`id_lugar_nacimiento`)
  -- FOREIGN KEY (`id_estado`) REFERENCES `estado`(`id_estado`),
  -- FOREIGN KEY (`id_municipio`) REFERENCES `municipio`(`id_municipio`),
  -- FOREIGN KEY (`id_parroquia`) REFERENCES `parroquia`(`id_parroquia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `nacionalidad`
CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nacionalidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `telefonos`
CREATE TABLE `telefonos` (
  `id_telefono` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) DEFAULT NULL,
  `id_representante` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `tipo_telefono` enum('fijo', 'celular') NOT NULL,
  `codigo_area` int(11) DEFAULT NULL,
  `operadora` varchar(10) DEFAULT NULL,
  `numero_telefono` varchar(15) NOT NULL, 
  PRIMARY KEY (`id_telefono`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`),
  -- FOREIGN KEY (`id_representante`) REFERENCES `representantes`(`id_representante`),
  -- FOREIGN KEY (`id_docente`) REFERENCES `docente`(`id_docente`),
  CONSTRAINT `chk_tipo_persona` CHECK (
    (ci_escolar IS NOT NULL AND id_representante IS NULL AND id_docente IS NULL) OR
    (id_representante IS NOT NULL AND ci_escolar IS NULL AND id_docente IS NULL) OR
    (id_docente IS NOT NULL AND ci_escolar IS NULL AND id_representante IS NULL)
  )
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `tipo_procedencia`
CREATE TABLE `tipo_procedencia` (
  `id_tipo_procedencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_procedencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_procedencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `procedencia`
CREATE TABLE `procedencia` (
  `id_procedencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_procedencia` int(11) NOT NULL,
  `nombre_procedencia` varchar(40) NOT NULL,
  PRIMARY KEY (`id_procedencia`)
  -- FOREIGN KEY (`id_tipo_procedencia`) REFERENCES `tipo_procedencia`(`id_tipo_procedencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `prendas`
CREATE TABLE `prendas` (
  `id_prenda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_prenda` varchar(35) NOT NULL,
  PRIMARY KEY (`id_prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `tallas`
CREATE TABLE `tallas` (
  `id_talla` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `id_prenda` int(11) NOT NULL,
  `talla` varchar(10) NOT NULL,
  PRIMARY KEY (`id_talla`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`),
  -- FOREIGN KEY (`id_prenda`) REFERENCES `prendas`(`id_prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `peso`
CREATE TABLE `peso` (
  `id_peso` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  PRIMARY KEY (`id_peso`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `estudiante`
CREATE TABLE `estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_lugar_nacimiento` int(11) NOT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  `edad_ano` int(11) NOT NULL,
  `edad_meses` int(11) NOT NULL,
  `sexo` enum('masculino', 'femenino') NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `id_procedencia` int(11) NOT NULL,
  `id_condicion_medica` int(11) NOT NULL,
  `id_discapacidad` int(11) NOT NULL,
  `id_estado_nutricional` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`)
  -- FOREIGN KEY (`id_lugar_nacimiento`) REFERENCES `lugar_nacimiento`(`id_lugar_nacimiento`),
  -- FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad`(`id_nacionalidad`),
  -- FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion`(`id_ubicacion`),
  -- FOREIGN KEY (`id_procedencia`) REFERENCES `procedencia`(`id_procedencia`),
  -- FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica`(`id_condicion_medica`),
  -- FOREIGN KEY (`id_discapacidad`) REFERENCES `discapacidad`(`id_discapacidad`),
  -- FOREIGN KEY (`id_estado_nutricional`) REFERENCES `estado_nutricional`(`id_estado_nutricional`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `tipo_parentesco`
CREATE TABLE `tipo_parentesco` (
  `id_tipo_parentesco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_parentesco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `parentesco`
CREATE TABLE `parentesco` (
  `id_tipo_parentesco` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  PRIMARY KEY (`id_tipo_parentesco`, `cedula`, `ci_escolar`)
  -- FOREIGN KEY (`id_tipo_parentesco`) REFERENCES `tipo_parentesco`(`id_tipo_parentesco`),
  -- FOREIGN KEY (`cedula`) REFERENCES `representantes`(`cedula`),
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `nivel_instruccion`
CREATE TABLE `nivel_instruccion` (
  `id_nivel_instruccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nivel_instruccion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_nivel_instruccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `ocupacion`
CREATE TABLE `ocupacion` (
  `id_ocupacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ocupacion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_ocupacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `direccion`
CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_ubicacion` int(11) NOT NULL,
  `tipo_direccion` enum('habitacion', 'trabajo') NOT NULL,
  PRIMARY KEY (`id_direccion`)
  -- FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion`(`id_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `representantes`
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
  PRIMARY KEY (`id_representante`)
  -- FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad`(`id_nacionalidad`),
  -- FOREIGN KEY (`id_nivel_instruccion`) REFERENCES `nivel_instruccion`(`id_nivel_instruccion`),
  -- FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion`(`id_ocupacion`),
  -- FOREIGN KEY (`id_direccion_habitacion`) REFERENCES `direccion`(`id_direccion`),
  -- FOREIGN KEY (`id_direccion_trabajo`) REFERENCES `direccion`(`id_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `docente`
CREATE TABLE `docente` (
  `id_docente` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` enum('activo', 'inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `tipo_nivel`
CREATE TABLE `tipo_nivel` (
  `id_tipo_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_nivel` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `niveles`
CREATE TABLE `niveles` (
  `id_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id_nivel`)
  -- FOREIGN KEY (`id_tipo_nivel`) REFERENCES `tipo_nivel`(`id_tipo_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `secciones`
CREATE TABLE `secciones` (
  `id_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_seccion` varchar(20) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id_seccion`)
  -- FOREIGN KEY (`id_nivel`) REFERENCES `niveles`(`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `aulas`
CREATE TABLE `aulas` (
  `id_aula` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_aula` varchar(20) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  PRIMARY KEY (`id_aula`)
  -- FOREIGN KEY (`id_seccion`) REFERENCES `secciones`(`id_seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `periodo_escolar`
CREATE TABLE `periodo_escolar` (
  `id_periodo_escolar` int(11) NOT NULL AUTO_INCREMENT,
  `periodo` varchar(10) NOT NULL,
  PRIMARY KEY (`id_periodo_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `anio_escolar`
CREATE TABLE `anio_escolar` (
  `id_anio_escolar` int(11) NOT NULL AUTO_INCREMENT,
  `anio` int(11) NOT NULL,
  `id_periodo_escolar` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  PRIMARY KEY (`id_anio_escolar`)
  -- FOREIGN KEY (`id_periodo_escolar`) REFERENCES `periodo_escolar`(`id_periodo_escolar`),
  -- FOREIGN KEY (`id_aula`) REFERENCES `aulas`(`id_aula`),
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `inscripciones`
CREATE TABLE `inscripciones` (
  `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  PRIMARY KEY (`id_inscripcion`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `condicion_medica`
CREATE TABLE `condicion_medica` (
  `id_condicion_medica` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_condicion_medica` varchar(50) NOT NULL,
  PRIMARY KEY (`id_condicion_medica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `discapacidad`
CREATE TABLE `discapacidad` (
  `id_discapacidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_discapacidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id_discapacidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `tratamiento`
CREATE TABLE `tratamiento` (
  `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_condicion_medica` int(11) NOT NULL,
  `nombre_tratamiento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tratamiento`)
  -- FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica`(`id_condicion_medica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `estado_nutricional`
CREATE TABLE `estado_nutricional` (
  `id_estado_nutricional` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_nutricional` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado_nutricional`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `tipo_documento`
CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_documento` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `documentos_inscripcion`
CREATE TABLE `documentos_inscripcion` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `estado` enum('entregado', 'pendiente') NOT NULL DEFAULT 'pendiente',
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_documento`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`),
  -- FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento`(`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `notificaciones`
CREATE TABLE `notificaciones` (
  `id_notificacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_representante` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `estado` enum('enviada', 'leida') NOT NULL DEFAULT 'enviada',
  PRIMARY KEY (`id_notificacion`)
  -- FOREIGN KEY (`id_representante`) REFERENCES `representantes`(`id_representante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `eventos`
CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(100) NOT NULL,
  `fecha_evento` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `asistencia`
CREATE TABLE `asistencia` (
  `id_asistencia` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `asistio` enum('si', 'no') NOT NULL DEFAULT 'si',
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_asistencia`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `conceptos_pago`
CREATE TABLE `conceptos_pago` (
  `id_concepto_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_concepto` varchar(50) NOT NULL,
  PRIMARY KEY (`id_concepto_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `pagos`
CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `id_concepto_pago` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `estado` enum('pendiente', 'pagado') NOT NULL DEFAULT 'pendiente',
  PRIMARY KEY (`id_pago`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`),
  -- FOREIGN KEY (`id_concepto_pago`) REFERENCES `conceptos_pago`(`id_concepto_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `incidentes`
CREATE TABLE `incidentes` (
  `id_incidente` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `fecha_incidente` date NOT NULL,
  `descripcion` text NOT NULL,
  `acciones_tomadas` text DEFAULT NULL,
  PRIMARY KEY (`id_incidente`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `salud_estudiante`
CREATE TABLE `salud_estudiante` (
  `id_salud` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `alergias` text DEFAULT NULL,
  `medicamentos` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_salud`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `horarios`
CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `id_aula` int(11) NOT NULL,
  `dia_semana` enum('lunes', 'martes', 'miércoles', 'jueves', 'viernes', 'sábado', 'domingo') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `actividad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_horario`)
  -- FOREIGN KEY (`id_aula`) REFERENCES `aulas`(`id_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `archivos`
CREATE TABLE `archivos` (
  `id_archivo` int(11) NOT NULL AUTO_INCREMENT,
  `ci_escolar` int(11) NOT NULL,
  `nombre_archivo` varchar(100) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `tipo_archivo` enum('documento', 'foto', 'otro') NOT NULL,
  PRIMARY KEY (`id_archivo`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `configuracion`
CREATE TABLE `configuracion` (
  `id_configuracion` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) NOT NULL,
  `valor` varchar(255) NOT NULL,
  PRIMARY KEY (`id_configuracion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `condicion_medica_estudiante`
CREATE TABLE `condicion_medica_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_condicion_medica` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`, `id_condicion_medica`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`),
  -- FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica`(`id_condicion_medica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `discapacidad_estudiante`
CREATE TABLE `discapacidad_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_discapacidad` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`, `id_discapacidad`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`),
  -- FOREIGN KEY (`id_discapacidad`) REFERENCES `discapacidad`(`id_discapacidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `estado_nutricional_estudiante`
CREATE TABLE `estado_nutricional_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_estado_nutricional` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`, `id_estado_nutricional`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`),
  -- FOREIGN KEY (`id_estado_nutricional`) REFERENCES `estado_nutricional`(`id_estado_nutricional`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `anio_escolar_estudiante`
CREATE TABLE `anio_escolar_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_anio_escolar` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`, `id_anio_escolar`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`),
  -- FOREIGN KEY (`id_anio_escolar`) REFERENCES `anio_escolar`(`id_anio_escolar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `inscripciones_estudiante`
CREATE TABLE `inscripciones_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_inscripcion` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`, `id_inscripcion`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`),
  -- FOREIGN KEY (`id_inscripcion`) REFERENCES `inscripciones`(`id_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `docente_aula`
CREATE TABLE `docente_aula` (
  `id_docente` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`, `id_aula`)
  -- FOREIGN KEY (`id_docente`) REFERENCES `docente`(`id_docente`),
  -- FOREIGN KEY (`id_aula`) REFERENCES `aulas`(`id_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `docente_seccion`
CREATE TABLE `docente_seccion` (
  `id_docente` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`, `id_seccion`)
  -- FOREIGN KEY (`id_docente`) REFERENCES `docente`(`id_docente`),
  -- FOREIGN KEY (`id_seccion`) REFERENCES `secciones`(`id_seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabla `docente_nivel`
CREATE TABLE `docente_nivel` (
  `id_docente` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id_docente`, `id_nivel`)
  -- FOREIGN KEY (`id_docente`) REFERENCES `docente`(`id_docente`),
  -- FOREIGN KEY (`id_nivel`) REFERENCES `niveles`(`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
