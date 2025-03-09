-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-11-2024 a las 15:28:04
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Proyecto_v7`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `id_aula` int(11) NOT NULL,
  `nombre_aula` varchar(20) NOT NULL,
  `id_seccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `año_escolar`
--

CREATE TABLE `año_escolar` (
  `id_año` int(11) NOT NULL,
  `año` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `ci` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calle`
--

CREATE TABLE `calle` (
  `id_sector` int(11) NOT NULL,
  `id_calle` int(11) NOT NULL,
  `nombre_calle` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_medica`
--

CREATE TABLE `condicion_medica` (
  `id_condicion` int(11) NOT NULL,
  `nombre_condicion_medica` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discapacidad`
--

CREATE TABLE `discapacidad` (
  `nombre_discapacidad` varchar(50) NOT NULL,
  `id_discapacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `ci` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `id_telefono` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_pais` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `nombre_estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_nutricional`
--

CREATE TABLE `estado_nutricional` (
  `id_Estado_Nutricional` int(11) NOT NULL,
  `nombre_estado_nutricional` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_direccion` int(11) NOT NULL,
  `id_lugar_de_nacimiento` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `id_procedencia` int(11) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `lugar_de_nacimiento` varchar(30) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  `id_sexo` int(11) NOT NULL,
  `id_condicion` int(11) NOT NULL,
  `id_discapacidad` int(11) NOT NULL,
  `id_estado_nutricional` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `ci_escolar` int(11) NOT NULL,
  `fecha_inscipcion` date NOT NULL,
  `id_inscripcion` int(11) NOT NULL,
  `id_año` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id_estado` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `nombre_municipio` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidad`
--

CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL,
  `nombre_nacionalidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id_nivel` int(11) NOT NULL,
  `nombre_nivel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_de_instruccion`
--

CREATE TABLE `nivel_de_instruccion` (
  `id_nivel_instruccion` int(11) NOT NULL,
  `nombre_nivel_instruccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupacion`
--

CREATE TABLE `ocupacion` (
  `id_ocupacion` int(11) NOT NULL,
  `nombre_ocupacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id_paid` int(11) NOT NULL,
  `nombre_pais` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `id_tipo` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `ci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE `parroquia` (
  `id_municipio` int(11) NOT NULL,
  `id_parroquia` int(11) NOT NULL,
  `nombre_parroquia` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_escolar`
--

CREATE TABLE `periodo_escolar` (
  `id_periodo` int(11) NOT NULL,
  `periodo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_administrativo`
--

CREATE TABLE `personal_administrativo` (
  `ci` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `contrasena` varchar(166) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'activo',
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal_administrativo`
--

INSERT INTO `personal_administrativo` (`ci`, `nombre`, `apellido`, `contrasena`, `estado`, `id_rol`) VALUES
(306306, 'DIRECTORA', 'Prueba', '12345678', 'desactivo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prendas`
--

CREATE TABLE `prendas` (
  `nombre_prenda` varchar(35) NOT NULL,
  `id_prendas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedencia`
--

CREATE TABLE `procedencia` (
  `id_procedencia` int(11) NOT NULL,
  `nombre_procedencia` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE `representantes` (
  `id_direccion_trabajo` int(11) NOT NULL,
  `id_direccion_habitacion` int(11) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `ci` int(11) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `id_ocupacion` int(11) NOT NULL,
  `id_NI` int(11) NOT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  `id_telefono` int(11) NOT NULL,
  `id_condicion` int(11) NOT NULL,
  `id_discapacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `nombre_rol` varchar(30) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`nombre_rol`, `id_rol`) VALUES
('DIRECTORA', 1),
('SECRETARIA', 2),
('DOCENTE', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `id_seccion` int(11) NOT NULL,
  `nombre_seccion` varchar(20) NOT NULL,
  `id_nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `id_sector` int(11) NOT NULL,
  `id_parroquia` int(11) NOT NULL,
  `nombre_sector` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `id_sexo` int(11) NOT NULL,
  `nombre_sexo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallas`
--

CREATE TABLE `tallas` (
  `talla` varchar(10) NOT NULL,
  `id_talla` int(11) NOT NULL,
  `id_prenda` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `id_telefono` int(11) NOT NULL,
  `numero_telefono` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_parentesco`
--

CREATE TABLE `tipo_parentesco` (
  `id_tipo_parentesco` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `id_tratamiento` int(11) NOT NULL,
  `nombre_tratamiento` varchar(50) NOT NULL,
  `id_condicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id_aula`),
  ADD KEY `aulas_id_seccio` (`id_seccion`);

--
-- Indices de la tabla `año_escolar`
--
ALTER TABLE `año_escolar`
  ADD PRIMARY KEY (`id_año`),
  ADD KEY `año_escolar_id_periodo_peiodo` (`id_periodo`),
  ADD KEY `año_escolar_ci_docente_ci` (`ci`),
  ADD KEY `añoula_aulas_id_aula` (`id_aula`);

--
-- Indices de la tabla `calle`
--
ALTER TABLE `calle`
  ADD PRIMARY KEY (`id_calle`),
  ADD KEY `calle_id_sid_sector` (`id_sector`);

--
-- Indices de la tabla `condicion_medica`
--
ALTER TABLE `condicion_medica`
  ADD PRIMARY KEY (`id_condicion`);

--
-- Indices de la tabla `discapacidad`
--
ALTER TABLE `discapacidad`
  ADD PRIMARY KEY (`id_discapacidad`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`ci`),
  ADD KEY `docente_lefono_id_telefono` (`id_telefono`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`),
  ADD KEY `estado_id_paid_paid` (`id_pais`);

--
-- Indices de la tabla `estado_nutricional`
--
ALTER TABLE `estado_nutricional`
  ADD PRIMARY KEY (`id_Estado_Nutricional`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`ci_escolar`),
  ADD KEY `estudile` (`id_direccion`),
  ADD KEY `estudiant` (`id_lugar_de_nacimiento`),
  ADD KEY `estudencia` (`id_procedencia`),
  ADD KEY `estudiantelidad` (`id_nacionalidad`),
  ADD KEY `estudiante_id_sexo_sexo_id_sexo` (`id_sexo`),
  ADD KEY `estudiante_id_condicon` (`id_condicion`),
  ADD KEY `estudiante_idad` (`id_discapacidad`),
  ADD KEY `estudiantl_id_Estado_Nutricional` (`id_estado_nutricional`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `inscripscolar` (`ci_escolar`),
  ADD KEY `inscripciones_año` (`id_año`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `municipio_id_estado_estado_id_estado` (`id_estado`);

--
-- Indices de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  ADD PRIMARY KEY (`id_nacionalidad`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id_nivel`);

--
-- Indices de la tabla `nivel_de_instruccion`
--
ALTER TABLE `nivel_de_instruccion`
  ADD PRIMARY KEY (`id_nivel_instruccion`);

--
-- Indices de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  ADD PRIMARY KEY (`id_ocupacion`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_paid`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`ci_escolar`,`ci`),
  ADD KEY `parenterentesco` (`id_tipo`),
  ADD KEY `pareresentantes_ci` (`ci`);

--
-- Indices de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD PRIMARY KEY (`id_parroquia`),
  ADD KEY `parroquia_id_municipio_municipipio` (`id_municipio`);

--
-- Indices de la tabla `periodo_escolar`
--
ALTER TABLE `periodo_escolar`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `personal_administrativo`
--
ALTER TABLE `personal_administrativo`
  ADD PRIMARY KEY (`ci`),
  ADD KEY `personal_adrol` (`id_rol`);

--
-- Indices de la tabla `prendas`
--
ALTER TABLE `prendas`
  ADD PRIMARY KEY (`id_prendas`);

--
-- Indices de la tabla `procedencia`
--
ALTER TABLE `procedencia`
  ADD PRIMARY KEY (`id_procedencia`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`ci`),
  ADD KEY `representantescalle` (`id_direccion_trabajo`),
  ADD KEY `representcalle` (`id_direccion_habitacion`),
  ADD KEY `representantion` (`id_ocupacion`),
  ADD KEY `representantesvel_instruccion` (`id_NI`),
  ADD KEY `representantenacionalidad` (`id_nacionalidad`),
  ADD KEY `representantesfono` (`id_telefono`),
  ADD KEY `representantesndicion` (`id_condicion`),
  ADD KEY `represeid_discapacidad` (`id_discapacidad`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`id_seccion`),
  ADD KEY `secciones_id_nivel_niveles_id_nivel` (`id_nivel`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id_sector`),
  ADD KEY `sector_id_parroqoquia` (`id_parroquia`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`id_sexo`);

--
-- Indices de la tabla `tallas`
--
ALTER TABLE `tallas`
  ADD PRIMARY KEY (`id_talla`),
  ADD KEY `tallas_id_prenda_prendaas` (`id_prenda`),
  ADD KEY `tallas_ci_escolar_estolar` (`ci_escolar`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id_telefono`);

--
-- Indices de la tabla `tipo_parentesco`
--
ALTER TABLE `tipo_parentesco`
  ADD PRIMARY KEY (`id_tipo_parentesco`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`id_tratamiento`),
  ADD KEY `tratamiento_id_condicion_con` (`id_condicion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `año_escolar`
--
ALTER TABLE `año_escolar`
  MODIFY `id_año` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calle`
--
ALTER TABLE `calle`
  MODIFY `id_calle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `condicion_medica`
--
ALTER TABLE `condicion_medica`
  MODIFY `id_condicion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `discapacidad`
--
ALTER TABLE `discapacidad`
  MODIFY `id_discapacidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  MODIFY `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id_nivel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nivel_de_instruccion`
--
ALTER TABLE `nivel_de_instruccion`
  MODIFY `id_nivel_instruccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  MODIFY `id_ocupacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id_paid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  MODIFY `id_parroquia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodo_escolar`
--
ALTER TABLE `periodo_escolar`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prendas`
--
ALTER TABLE `prendas`
  MODIFY `id_prendas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `procedencia`
--
ALTER TABLE `procedencia`
  MODIFY `id_procedencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id_seccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `id_sector` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `id_sexo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tallas`
--
ALTER TABLE `tallas`
  MODIFY `id_talla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `id_telefono` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_parentesco`
--
ALTER TABLE `tipo_parentesco`
  MODIFY `id_tipo_parentesco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD CONSTRAINT `aulas_id_seccio` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id_seccion`);

--
-- Filtros para la tabla `año_escolar`
--
ALTER TABLE `año_escolar`
  ADD CONSTRAINT `año_escolar_ci_docente_ci` FOREIGN KEY (`ci`) REFERENCES `docente` (`ci`),
  ADD CONSTRAINT `año_escolar_id_periodo_peiodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodo_escolar` (`id_periodo`),
  ADD CONSTRAINT `añoula_aulas_id_aula` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`);

--
-- Filtros para la tabla `calle`
--
ALTER TABLE `calle`
  ADD CONSTRAINT `calle_id_sid_sector` FOREIGN KEY (`id_sector`) REFERENCES `sector` (`id_sector`);

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_lefono_id_telefono` FOREIGN KEY (`id_telefono`) REFERENCES `telefono` (`id_telefono`);

--
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `estado_id_paid_paid` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_paid`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudencia` FOREIGN KEY (`id_procedencia`) REFERENCES `procedencia` (`id_procedencia`),
  ADD CONSTRAINT `estudiant` FOREIGN KEY (`id_lugar_de_nacimiento`) REFERENCES `calle` (`id_calle`),
  ADD CONSTRAINT `estudiante_id_condicon` FOREIGN KEY (`id_condicion`) REFERENCES `condicion_medica` (`id_condicion`),
  ADD CONSTRAINT `estudiante_id_sexo_sexo_id_sexo` FOREIGN KEY (`id_sexo`) REFERENCES `sexo` (`id_sexo`),
  ADD CONSTRAINT `estudiante_idad` FOREIGN KEY (`id_discapacidad`) REFERENCES `discapacidad` (`id_discapacidad`),
  ADD CONSTRAINT `estudiantelidad` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`),
  ADD CONSTRAINT `estudiantl_id_Estado_Nutricional` FOREIGN KEY (`id_estado_nutricional`) REFERENCES `estado_nutricional` (`id_Estado_Nutricional`),
  ADD CONSTRAINT `estudile` FOREIGN KEY (`id_direccion`) REFERENCES `calle` (`id_calle`);

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_año` FOREIGN KEY (`id_año`) REFERENCES `año_escolar` (`id_año`),
  ADD CONSTRAINT `inscripscolar` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`);

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_id_estado_estado_id_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD CONSTRAINT `parenterentesco` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_parentesco` (`id_tipo_parentesco`),
  ADD CONSTRAINT `parentesco_ci_es` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `pareresentantes_ci` FOREIGN KEY (`ci`) REFERENCES `representantes` (`ci`);

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `parroquia_id_municipio_municipipio` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`);

--
-- Filtros para la tabla `personal_administrativo`
--
ALTER TABLE `personal_administrativo`
  ADD CONSTRAINT `personal_adrol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD CONSTRAINT `represeid_discapacidad` FOREIGN KEY (`id_discapacidad`) REFERENCES `discapacidad` (`id_discapacidad`),
  ADD CONSTRAINT `representantenacionalidad` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`),
  ADD CONSTRAINT `representantescalle` FOREIGN KEY (`id_direccion_trabajo`) REFERENCES `calle` (`id_calle`),
  ADD CONSTRAINT `representantesfono` FOREIGN KEY (`id_telefono`) REFERENCES `telefono` (`id_telefono`),
  ADD CONSTRAINT `representantesndicion` FOREIGN KEY (`id_condicion`) REFERENCES `condicion_medica` (`id_condicion`),
  ADD CONSTRAINT `representantesvel_instruccion` FOREIGN KEY (`id_NI`) REFERENCES `nivel_de_instruccion` (`id_nivel_instruccion`),
  ADD CONSTRAINT `representantion` FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion` (`id_ocupacion`),
  ADD CONSTRAINT `representcalle` FOREIGN KEY (`id_direccion_habitacion`) REFERENCES `calle` (`id_calle`);

--
-- Filtros para la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD CONSTRAINT `secciones_id_nivel_niveles_id_nivel` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id_nivel`);

--
-- Filtros para la tabla `sector`
--
ALTER TABLE `sector`
  ADD CONSTRAINT `sector_id_parroqoquia` FOREIGN KEY (`id_parroquia`) REFERENCES `parroquia` (`id_parroquia`);

--
-- Filtros para la tabla `tallas`
--
ALTER TABLE `tallas`
  ADD CONSTRAINT `tallas_ci_escolar_estolar` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `tallas_id_prenda_prendaas` FOREIGN KEY (`id_prenda`) REFERENCES `prendas` (`id_prendas`);

--
-- Filtros para la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `tratamiento_id_condicion_con` FOREIGN KEY (`id_condicion`) REFERENCES `condicion_medica` (`id_condicion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
