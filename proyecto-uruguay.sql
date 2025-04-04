-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2025 a las 18:55:30
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto-uruguay`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anio_escolar`
--

CREATE TABLE `anio_escolar` (
  `id_anio_escolar` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `id_periodo_escolar` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anio_escolar_estudiante`
--

CREATE TABLE `anio_escolar_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_anio_escolar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id_archivo` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `nombre_archivo` varchar(100) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `tipo_archivo` enum('documento','foto','otro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `id_asistencia` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `asistio` enum('si','no') NOT NULL DEFAULT 'si',
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `id_aula` int(11) NOT NULL,
  `nombre_aula` varchar(20) NOT NULL,
  `id_seccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos_pago`
--

CREATE TABLE `conceptos_pago` (
  `id_concepto_pago` int(11) NOT NULL,
  `nombre_concepto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_medica`
--

CREATE TABLE `condicion_medica` (
  `id_condicion_medica` int(11) NOT NULL,
  `nombre_condicion_medica` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `condicion_medica`
--

INSERT INTO `condicion_medica` (`id_condicion_medica`, `nombre_condicion_medica`) VALUES
(1, 'Ninguna'),
(2, 'Asma'),
(3, 'Alergias (Especificar)'),
(4, 'Diabetes'),
(5, 'Epilepsia'),
(6, 'Enfermedad Cardíaca'),
(7, 'Problemas Renales'),
(8, 'Problemas Digestivos'),
(9, 'Problemas de Salud Mental (Especificar)'),
(10, 'Otra Condición Médica (Especificar)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_medica_estudiante`
--

CREATE TABLE `condicion_medica_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_condicion_medica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id_configuracion` int(11) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `valor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo`
--

CREATE TABLE `correo` (
  `id_correo` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `correo`
--

INSERT INTO `correo` (`id_correo`, `email`) VALUES
(1, 'correoDePrueva_1@gmail.com'),
(2, 'correoDePrueva_2@gmail.com'),
(3, 'phjhv@gmail.com'),
(4, 'vjjvj'),
(5, 'hchjjb'),
(6, 'hchjjb'),
(7, 'jokkl'),
(8, 'jokkl'),
(9, 'jokkl@ff'),
(10, 'ghh@ghh'),
(11, 'djj@hh'),
(12, 'pelo@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `tipo_direccion` enum('habitacion','trabajo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `id_ubicacion`, `tipo_direccion`) VALUES
(1, 10, 'trabajo'),
(2, 9, 'habitacion'),
(3, 12, 'trabajo'),
(4, 11, 'habitacion'),
(5, 14, 'trabajo'),
(6, 13, 'habitacion'),
(7, 16, 'trabajo'),
(8, 15, 'habitacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discapacidad`
--

CREATE TABLE `discapacidad` (
  `id_discapacidad` int(11) NOT NULL,
  `nombre_discapacidad` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `discapacidad`
--

INSERT INTO `discapacidad` (`id_discapacidad`, `nombre_discapacidad`) VALUES
(28, 'Ninguna'),
(29, 'Discapacidad Visual'),
(30, 'Discapacidad Auditiva'),
(31, 'Discapacidad Motora'),
(32, 'Discapacidad Intelectual'),
(33, 'Trastorno del Espectro Autista (TEA)'),
(34, 'Trastorno por Déficit de Atención e Hiperactividad (TDAH)'),
(35, 'Discapacidad del Lenguaje'),
(36, 'Otra Discapacidad (Especificar)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discapacidad_estudiante`
--

CREATE TABLE `discapacidad_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_discapacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `id_docente` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`id_docente`, `cedula`, `nombres`, `apellidos`, `fecha_nacimiento`, `estado`) VALUES
(9, 5968, 'Pedro2', 'Culian', '2006-12-13', 'activo'),
(19, 390390, 'Edgard', 'Marcano', '2002-06-07', 'activo'),
(20, 868, 'Edgard', 'Marcano', '2004-03-18', 'activo'),
(21, 2879208, 'Luis', 'Perez', '2002-06-07', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente_aula`
--

CREATE TABLE `docente_aula` (
  `id_docente` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente_nivel`
--

CREATE TABLE `docente_nivel` (
  `id_docente` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente_seccion`
--

CREATE TABLE `docente_seccion` (
  `id_docente` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_inscripcion`
--

CREATE TABLE `documentos_inscripcion` (
  `id_documento` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `estado` enum('entregado','pendiente') NOT NULL DEFAULT 'pendiente',
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `nombre_estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `id_pais`, `nombre_estado`) VALUES
(1, 1, 'Amazonas'),
(2, 1, 'Anzoátegui'),
(3, 1, 'Aragua'),
(4, 1, 'Barinas'),
(5, 1, 'Bolívar'),
(6, 1, 'Carabobo'),
(7, 1, 'Cojedes'),
(8, 1, 'Delta Amacuro'),
(9, 1, 'Falcón'),
(10, 1, 'Guárico'),
(11, 1, 'Lara'),
(12, 1, 'Mérida'),
(13, 1, 'Miranda'),
(14, 1, 'Monagas'),
(15, 1, 'Nueva Esparta'),
(16, 1, 'Portuguesa'),
(17, 1, 'Sucre'),
(18, 1, 'Táchira'),
(19, 1, 'Trujillo'),
(20, 1, 'Vargas'),
(21, 1, 'Yaracuy'),
(22, 1, 'Zulia'),
(23, 1, 'Dependencias Federales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_nutricional`
--

CREATE TABLE `estado_nutricional` (
  `id_estado_nutricional` int(11) NOT NULL,
  `nombre_estado_nutricional` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `estado_nutricional`
--

INSERT INTO `estado_nutricional` (`id_estado_nutricional`, `nombre_estado_nutricional`) VALUES
(1, 'Normal'),
(2, 'Bajo Peso'),
(3, 'Sobrepeso'),
(4, 'Obesidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_nutricional_estudiante`
--

CREATE TABLE `estado_nutricional_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_estado_nutricional` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

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
  `id_estado_nutricional` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `nombre_evento` varchar(100) NOT NULL,
  `fecha_evento` date NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  `dia_semana` enum('lunes','martes','miércoles','jueves','viernes','sábado','domingo') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `actividad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidentes`
--

CREATE TABLE `incidentes` (
  `id_incidente` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `fecha_incidente` date NOT NULL,
  `descripcion` text NOT NULL,
  `acciones_tomadas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_inscripcion` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones_estudiante`
--

CREATE TABLE `inscripciones_estudiante` (
  `ci_escolar` int(11) NOT NULL,
  `id_inscripcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar_nacimiento`
--

CREATE TABLE `lugar_nacimiento` (
  `id_lugar_nacimiento` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_parroquia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `nombre_municipio` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id_municipio`, `id_estado`, `nombre_municipio`) VALUES
(1, 14, 'Maturín'),
(2, 14, 'Acosta'),
(3, 14, 'Aguasay'),
(4, 14, 'Bolívar'),
(5, 14, 'Caripe'),
(6, 14, 'Cedeño'),
(7, 14, 'Ezequiel Zamora'),
(8, 14, 'Libertador'),
(9, 14, 'Piar'),
(10, 14, 'Punceres'),
(11, 14, 'Santa Bárbara'),
(12, 14, 'Sotillo'),
(13, 14, 'Uracoa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidad`
--

CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL,
  `nombre_nacionalidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `nacionalidad`
--

INSERT INTO `nacionalidad` (`id_nacionalidad`, `nombre_nacionalidad`) VALUES
(1, 'Venezolana'),
(2, 'Extranjera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id_nivel` int(11) NOT NULL,
  `id_tipo_nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_instruccion`
--

CREATE TABLE `nivel_instruccion` (
  `id_nivel_instruccion` int(11) NOT NULL,
  `nombre_nivel_instruccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `nivel_instruccion`
--

INSERT INTO `nivel_instruccion` (`id_nivel_instruccion`, `nombre_nivel_instruccion`) VALUES
(1, 'Ninguno'),
(2, 'Primaria Incompleta'),
(3, 'Primaria Completa'),
(4, 'Secundaria Incompleta'),
(5, 'Secundaria Completa'),
(6, 'Bachillerato/Preparatoria'),
(7, 'Técnico'),
(8, 'Universitario Incompleto'),
(9, 'Universitario Completo'),
(10, 'Postgrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_notificacion` int(11) NOT NULL,
  `id_representante` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `estado` enum('enviada','leida') NOT NULL DEFAULT 'enviada'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupacion`
--

CREATE TABLE `ocupacion` (
  `id_ocupacion` int(11) NOT NULL,
  `nombre_ocupacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ocupacion`
--

INSERT INTO `ocupacion` (`id_ocupacion`, `nombre_ocupacion`) VALUES
(1, 'Ama de Casa'),
(2, 'Obrero/a'),
(3, 'Empleado/a'),
(4, 'Comerciante'),
(5, 'Técnico/a'),
(6, 'Profesional Independiente'),
(7, 'Docente'),
(8, 'Jubilado/a'),
(9, 'Desempleado/a'),
(10, 'Estudiante'),
(11, 'Agricultor/a'),
(12, 'Ganadero/a'),
(13, 'Pescador/a'),
(14, 'Mecánico/a'),
(15, 'Conductor/a'),
(16, 'Enfermero/a'),
(17, 'Médico/a'),
(18, 'Abogado/a'),
(19, 'Ingeniero/a'),
(20, 'Militar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `id_concepto_pago` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `estado` enum('pendiente','pagado') NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL,
  `nombre_pais` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `nombre_pais`) VALUES
(1, 'Venezuela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE `parroquia` (
  `id_parroquia` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `nombre_parroquia` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `parroquia`
--

INSERT INTO `parroquia` (`id_parroquia`, `id_municipio`, `nombre_parroquia`) VALUES
(1, 1, 'El Furrial'),
(2, 1, 'San Simón'),
(3, 1, 'Alto de Los Godos'),
(4, 1, 'Boquerón'),
(5, 1, 'Las Cocuizas'),
(6, 1, 'San Vicente'),
(7, 1, 'El Corozo'),
(8, 1, 'La Cruz'),
(9, 1, 'Maturín'),
(10, 1, 'Jusepín');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_escolar`
--

CREATE TABLE `periodo_escolar` (
  `id_periodo_escolar` int(11) NOT NULL,
  `periodo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peso`
--

CREATE TABLE `peso` (
  `id_peso` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `peso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prendas`
--

CREATE TABLE `prendas` (
  `id_prenda` int(11) NOT NULL,
  `nombre_prenda` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedencia`
--

CREATE TABLE `procedencia` (
  `id_procedencia` int(11) NOT NULL,
  `id_tipo_procedencia` int(11) NOT NULL,
  `nombre_procedencia` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `procedencia`
--

INSERT INTO `procedencia` (`id_procedencia`, `id_tipo_procedencia`, `nombre_procedencia`) VALUES
(1, 1, 'Hogar'),
(2, 1, 'Del Mismo plantel'),
(3, 1, 'De otro plantel'),
(4, 1, 'Multihogar'),
(5, 1, 'Hogar de cuidado'),
(6, 1, 'Guarderia'),
(7, 1, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE `representantes` (
  `id_representante` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `edad` int(11) NOT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  `id_nivel_instruccion` int(11) NOT NULL,
  `id_ocupacion` int(11) NOT NULL,
  `id_direccion_habitacion` int(11) NOT NULL,
  `id_direccion_trabajo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `representantes`
--

INSERT INTO `representantes` (`id_representante`, `cedula`, `nombres`, `apellidos`, `fecha_nacimiento`, `edad`, `id_nacionalidad`, `id_nivel_instruccion`, `id_ocupacion`, `id_direccion_habitacion`, `id_direccion_trabajo`) VALUES
(2, 309309, 'Edgard', 'Marcano', '2024-08-07', 0, 1, 6, 1, 2, 1),
(3, 3063067, 'marco', 'lopez', '2003-09-08', 21, 2, 5, 12, 6, 5),
(4, 4567, 'marco', 'lopez', '2025-04-16', -1, 1, 1, 1, 8, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'SECRETARIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud_estudiante`
--

CREATE TABLE `salud_estudiante` (
  `id_salud` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `alergias` text DEFAULT NULL,
  `medicamentos` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `id_seccion` int(11) NOT NULL,
  `nombre_seccion` varchar(20) NOT NULL,
  `id_nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `id_sector` int(11) NOT NULL,
  `id_parroquia` int(11) NOT NULL,
  `nombre_sector` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sector`
--

INSERT INTO `sector` (`id_sector`, `id_parroquia`, `nombre_sector`) VALUES
(1, 9, 'Zona Centro'),
(2, 9, 'Barrio Obrero'),
(3, 9, 'Las Cocuizas'),
(4, 9, 'Los Guaritos I'),
(5, 9, 'Los Guaritos II'),
(6, 9, 'Los Guaritos III'),
(7, 9, 'Los Guaritos IV'),
(8, 9, 'Los Guaritos V'),
(9, 9, 'El Parquecito'),
(10, 9, 'La Muralla'),
(11, 9, 'La Floresta'),
(12, 9, 'Fundemos'),
(13, 9, 'Simón Bolívar'),
(14, 9, 'Juanico'),
(15, 9, 'Los Cortijos'),
(16, 9, 'Ciudad Universitaria'),
(17, 9, 'Alto Paramaconi'),
(18, 9, 'Paramaconi'),
(19, 9, 'Villas del Paramaconi'),
(20, 9, 'Terrazas del Paramaconi'),
(21, 9, 'Doña Menca I'),
(22, 9, 'Doña Menca II'),
(23, 9, 'Prados del Este'),
(24, 9, 'Avenida Bella Vista'),
(25, 9, 'Las Brisas del Orinoco'),
(26, 9, 'La Concordia'),
(27, 9, 'Complejo Habitacional Paramaconi'),
(28, 9, 'Lomas del Viento'),
(29, 9, 'Valle Verde'),
(30, 9, 'El Guayabal'),
(31, 9, 'La Cruz'),
(32, 9, 'Virgen del Valle'),
(33, 9, '23 de Enero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallas`
--

CREATE TABLE `tallas` (
  `id_talla` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL,
  `id_prenda` int(11) NOT NULL,
  `talla` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id_telefono` int(11) NOT NULL,
  `ci_escolar` int(11) DEFAULT NULL,
  `id_representante` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `tipo_telefono` enum('fijo','celular') NOT NULL,
  `codigo_area` int(11) DEFAULT NULL,
  `operadora` varchar(10) DEFAULT NULL,
  `numero_telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_telefono`, `ci_escolar`, `id_representante`, `id_docente`, `tipo_telefono`, `codigo_area`, `operadora`, `numero_telefono`) VALUES
(2, NULL, NULL, 9, 'fijo', NULL, NULL, '8658'),
(12, NULL, NULL, 19, 'celular', NULL, NULL, '8658'),
(13, NULL, NULL, 20, 'celular', NULL, NULL, '8998'),
(14, NULL, NULL, 21, 'celular', NULL, NULL, '4128719412'),
(15, NULL, 3, NULL, 'fijo', NULL, NULL, '345331'),
(16, NULL, 4, NULL, 'fijo', NULL, NULL, '579753');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `nombre_documento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_nivel`
--

CREATE TABLE `tipo_nivel` (
  `id_tipo_nivel` int(11) NOT NULL,
  `nombre_nivel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_parentesco`
--

CREATE TABLE `tipo_parentesco` (
  `id_tipo_parentesco` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_procedencia`
--

CREATE TABLE `tipo_procedencia` (
  `id_tipo_procedencia` int(11) NOT NULL,
  `nombre_procedencia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_procedencia`
--

INSERT INTO `tipo_procedencia` (`id_tipo_procedencia`, `nombre_procedencia`) VALUES
(1, 'otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `id_tratamiento` int(11) NOT NULL,
  `id_condicion_medica` int(11) NOT NULL,
  `nombre_tratamiento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubicacion` int(11) NOT NULL,
  `id_sector` int(11) NOT NULL,
  `nro_vivienda` varchar(45) NOT NULL,
  `calle_vereda_avenida` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_ubicacion`, `id_sector`, `nro_vivienda`, `calle_vereda_avenida`) VALUES
(1, 7, '', 'Casa2'),
(2, 4, '', 'calle 27 b'),
(3, 1, '', 'o 2 calle 27 b'),
(4, 7, '', 'alle 27 b'),
(5, 1, 'nimguno', 'Hhhhh'),
(6, 1, 'nimguno', 'nto colao 2 calle 27 b'),
(7, 7, 'nimguno', 'Hkok'),
(8, 1, 'nimguno', 'olao 2 calle 27 b'),
(9, 1, 'nimguno', 'Jdjdud'),
(10, 1, 'nimguno', 'to colao 2 calle 27 b'),
(11, 15, 'nimguno', 'cas'),
(12, 6, 'nimguno', 'mi casa'),
(13, 18, 'nimguno', 'cas'),
(14, 14, 'nimguno', 'mi casa'),
(15, 1, 'nimguno', 'voli'),
(16, 1, 'nimguno', 'vilo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `id_correo` int(11) NOT NULL,
  `contrasena` varchar(166) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `cedula`, `nombres`, `apellidos`, `id_rol`, `usuario`, `id_correo`, `contrasena`, `estado`) VALUES
(1, 309309, 'Jose ', 'Alvarez Lopez ', 1, 'Usuario_1', 1, '$2y$10$Iqpu.MxyGyUPnaLSyV7bAup6u//h7N1X8wRi0wneO2KH5yS8AIWpC', 'activo'),
(5, 390390, 'Carlosh', 'Marcano', 1, '390390', 5, '$2y$10$Fs0/0/M.4u3L.QZ8FRtXduHd1DgEKI4bBOAmZYhiacwTdGyNoyxlq', 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anio_escolar`
--
ALTER TABLE `anio_escolar`
  ADD PRIMARY KEY (`id_anio_escolar`),
  ADD KEY `id_periodo_escolar` (`id_periodo_escolar`),
  ADD KEY `id_aula` (`id_aula`),
  ADD KEY `ci_escolar` (`ci_escolar`);

--
-- Indices de la tabla `anio_escolar_estudiante`
--
ALTER TABLE `anio_escolar_estudiante`
  ADD PRIMARY KEY (`ci_escolar`,`id_anio_escolar`),
  ADD KEY `id_anio_escolar` (`id_anio_escolar`);

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id_archivo`),
  ADD KEY `ci_escolar` (`ci_escolar`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD KEY `ci_escolar` (`ci_escolar`);

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id_aula`),
  ADD KEY `id_seccion` (`id_seccion`);

--
-- Indices de la tabla `conceptos_pago`
--
ALTER TABLE `conceptos_pago`
  ADD PRIMARY KEY (`id_concepto_pago`);

--
-- Indices de la tabla `condicion_medica`
--
ALTER TABLE `condicion_medica`
  ADD PRIMARY KEY (`id_condicion_medica`);

--
-- Indices de la tabla `condicion_medica_estudiante`
--
ALTER TABLE `condicion_medica_estudiante`
  ADD PRIMARY KEY (`ci_escolar`,`id_condicion_medica`),
  ADD KEY `id_condicion_medica` (`id_condicion_medica`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id_configuracion`);

--
-- Indices de la tabla `correo`
--
ALTER TABLE `correo`
  ADD PRIMARY KEY (`id_correo`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `id_ubicacion` (`id_ubicacion`);

--
-- Indices de la tabla `discapacidad`
--
ALTER TABLE `discapacidad`
  ADD PRIMARY KEY (`id_discapacidad`);

--
-- Indices de la tabla `discapacidad_estudiante`
--
ALTER TABLE `discapacidad_estudiante`
  ADD PRIMARY KEY (`ci_escolar`,`id_discapacidad`),
  ADD KEY `id_discapacidad` (`id_discapacidad`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id_docente`);

--
-- Indices de la tabla `docente_aula`
--
ALTER TABLE `docente_aula`
  ADD PRIMARY KEY (`id_docente`,`id_aula`),
  ADD KEY `id_aula` (`id_aula`);

--
-- Indices de la tabla `docente_nivel`
--
ALTER TABLE `docente_nivel`
  ADD PRIMARY KEY (`id_docente`,`id_nivel`),
  ADD KEY `id_nivel` (`id_nivel`);

--
-- Indices de la tabla `docente_seccion`
--
ALTER TABLE `docente_seccion`
  ADD PRIMARY KEY (`id_docente`,`id_seccion`),
  ADD KEY `id_seccion` (`id_seccion`);

--
-- Indices de la tabla `documentos_inscripcion`
--
ALTER TABLE `documentos_inscripcion`
  ADD PRIMARY KEY (`id_documento`),
  ADD KEY `ci_escolar` (`ci_escolar`),
  ADD KEY `id_tipo_documento` (`id_tipo_documento`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `estado_nutricional`
--
ALTER TABLE `estado_nutricional`
  ADD PRIMARY KEY (`id_estado_nutricional`);

--
-- Indices de la tabla `estado_nutricional_estudiante`
--
ALTER TABLE `estado_nutricional_estudiante`
  ADD PRIMARY KEY (`ci_escolar`,`id_estado_nutricional`),
  ADD KEY `id_estado_nutricional` (`id_estado_nutricional`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`ci_escolar`),
  ADD KEY `id_lugar_nacimiento` (`id_lugar_nacimiento`),
  ADD KEY `id_nacionalidad` (`id_nacionalidad`),
  ADD KEY `id_ubicacion` (`id_ubicacion`),
  ADD KEY `id_procedencia` (`id_procedencia`),
  ADD KEY `id_condicion_medica` (`id_condicion_medica`),
  ADD KEY `id_discapacidad` (`id_discapacidad`),
  ADD KEY `id_estado_nutricional` (`id_estado_nutricional`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_aula` (`id_aula`);

--
-- Indices de la tabla `incidentes`
--
ALTER TABLE `incidentes`
  ADD PRIMARY KEY (`id_incidente`),
  ADD KEY `ci_escolar` (`ci_escolar`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `ci_escolar` (`ci_escolar`);

--
-- Indices de la tabla `inscripciones_estudiante`
--
ALTER TABLE `inscripciones_estudiante`
  ADD PRIMARY KEY (`ci_escolar`,`id_inscripcion`),
  ADD KEY `id_inscripcion` (`id_inscripcion`);

--
-- Indices de la tabla `lugar_nacimiento`
--
ALTER TABLE `lugar_nacimiento`
  ADD PRIMARY KEY (`id_lugar_nacimiento`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_parroquia` (`id_parroquia`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  ADD PRIMARY KEY (`id_nacionalidad`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id_nivel`),
  ADD KEY `id_tipo_nivel` (`id_tipo_nivel`);

--
-- Indices de la tabla `nivel_instruccion`
--
ALTER TABLE `nivel_instruccion`
  ADD PRIMARY KEY (`id_nivel_instruccion`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `id_representante` (`id_representante`);

--
-- Indices de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  ADD PRIMARY KEY (`id_ocupacion`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `ci_escolar` (`ci_escolar`),
  ADD KEY `id_concepto_pago` (`id_concepto_pago`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD PRIMARY KEY (`id_parroquia`),
  ADD KEY `id_municipio` (`id_municipio`);

--
-- Indices de la tabla `periodo_escolar`
--
ALTER TABLE `periodo_escolar`
  ADD PRIMARY KEY (`id_periodo_escolar`);

--
-- Indices de la tabla `peso`
--
ALTER TABLE `peso`
  ADD PRIMARY KEY (`id_peso`),
  ADD KEY `ci_escolar` (`ci_escolar`);

--
-- Indices de la tabla `prendas`
--
ALTER TABLE `prendas`
  ADD PRIMARY KEY (`id_prenda`);

--
-- Indices de la tabla `procedencia`
--
ALTER TABLE `procedencia`
  ADD PRIMARY KEY (`id_procedencia`),
  ADD KEY `id_tipo_procedencia` (`id_tipo_procedencia`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`id_representante`),
  ADD KEY `id_nacionalidad` (`id_nacionalidad`),
  ADD KEY `id_nivel_instruccion` (`id_nivel_instruccion`),
  ADD KEY `id_ocupacion` (`id_ocupacion`),
  ADD KEY `id_direccion_habitacion` (`id_direccion_habitacion`),
  ADD KEY `id_direccion_trabajo` (`id_direccion_trabajo`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `salud_estudiante`
--
ALTER TABLE `salud_estudiante`
  ADD PRIMARY KEY (`id_salud`),
  ADD KEY `ci_escolar` (`ci_escolar`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`id_seccion`),
  ADD KEY `id_nivel` (`id_nivel`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id_sector`),
  ADD KEY `id_parroquia` (`id_parroquia`);

--
-- Indices de la tabla `tallas`
--
ALTER TABLE `tallas`
  ADD PRIMARY KEY (`id_talla`),
  ADD KEY `ci_escolar` (`ci_escolar`),
  ADD KEY `id_prenda` (`id_prenda`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id_telefono`),
  ADD KEY `ci_escolar` (`ci_escolar`),
  ADD KEY `id_representante` (`id_representante`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id_tipo_documento`);

--
-- Indices de la tabla `tipo_nivel`
--
ALTER TABLE `tipo_nivel`
  ADD PRIMARY KEY (`id_tipo_nivel`);

--
-- Indices de la tabla `tipo_parentesco`
--
ALTER TABLE `tipo_parentesco`
  ADD PRIMARY KEY (`id_tipo_parentesco`);

--
-- Indices de la tabla `tipo_procedencia`
--
ALTER TABLE `tipo_procedencia`
  ADD PRIMARY KEY (`id_tipo_procedencia`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`id_tratamiento`),
  ADD KEY `id_condicion_medica` (`id_condicion_medica`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubicacion`),
  ADD KEY `id_sector` (`id_sector`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_correo` (`id_correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anio_escolar`
--
ALTER TABLE `anio_escolar`
  MODIFY `id_anio_escolar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id_archivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id_asistencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conceptos_pago`
--
ALTER TABLE `conceptos_pago`
  MODIFY `id_concepto_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `condicion_medica`
--
ALTER TABLE `condicion_medica`
  MODIFY `id_condicion_medica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id_configuracion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `correo`
--
ALTER TABLE `correo`
  MODIFY `id_correo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `discapacidad`
--
ALTER TABLE `discapacidad`
  MODIFY `id_discapacidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `documentos_inscripcion`
--
ALTER TABLE `documentos_inscripcion`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `estado_nutricional`
--
ALTER TABLE `estado_nutricional`
  MODIFY `id_estado_nutricional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidentes`
--
ALTER TABLE `incidentes`
  MODIFY `id_incidente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lugar_nacimiento`
--
ALTER TABLE `lugar_nacimiento`
  MODIFY `id_lugar_nacimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  MODIFY `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id_nivel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nivel_instruccion`
--
ALTER TABLE `nivel_instruccion`
  MODIFY `id_nivel_instruccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  MODIFY `id_ocupacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  MODIFY `id_parroquia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `periodo_escolar`
--
ALTER TABLE `periodo_escolar`
  MODIFY `id_periodo_escolar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `peso`
--
ALTER TABLE `peso`
  MODIFY `id_peso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prendas`
--
ALTER TABLE `prendas`
  MODIFY `id_prenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `procedencia`
--
ALTER TABLE `procedencia`
  MODIFY `id_procedencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `representantes`
--
ALTER TABLE `representantes`
  MODIFY `id_representante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salud_estudiante`
--
ALTER TABLE `salud_estudiante`
  MODIFY `id_salud` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id_seccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `id_sector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `tallas`
--
ALTER TABLE `tallas`
  MODIFY `id_talla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id_telefono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_nivel`
--
ALTER TABLE `tipo_nivel`
  MODIFY `id_tipo_nivel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_parentesco`
--
ALTER TABLE `tipo_parentesco`
  MODIFY `id_tipo_parentesco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_procedencia`
--
ALTER TABLE `tipo_procedencia`
  MODIFY `id_tipo_procedencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anio_escolar`
--
ALTER TABLE `anio_escolar`
  ADD CONSTRAINT `anio_escolar_ibfk_1` FOREIGN KEY (`id_periodo_escolar`) REFERENCES `periodo_escolar` (`id_periodo_escolar`),
  ADD CONSTRAINT `anio_escolar_ibfk_2` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`),
  ADD CONSTRAINT `anio_escolar_ibfk_3` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`);

--
-- Filtros para la tabla `anio_escolar_estudiante`
--
ALTER TABLE `anio_escolar_estudiante`
  ADD CONSTRAINT `anio_escolar_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `anio_escolar_estudiante_ibfk_2` FOREIGN KEY (`id_anio_escolar`) REFERENCES `anio_escolar` (`id_anio_escolar`);

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`);

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`);

--
-- Filtros para la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD CONSTRAINT `aulas_ibfk_1` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id_seccion`);

--
-- Filtros para la tabla `condicion_medica_estudiante`
--
ALTER TABLE `condicion_medica_estudiante`
  ADD CONSTRAINT `condicion_medica_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `condicion_medica_estudiante_ibfk_2` FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica` (`id_condicion_medica`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`);

--
-- Filtros para la tabla `discapacidad_estudiante`
--
ALTER TABLE `discapacidad_estudiante`
  ADD CONSTRAINT `discapacidad_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `discapacidad_estudiante_ibfk_2` FOREIGN KEY (`id_discapacidad`) REFERENCES `discapacidad` (`id_discapacidad`);

--
-- Filtros para la tabla `docente_aula`
--
ALTER TABLE `docente_aula`
  ADD CONSTRAINT `docente_aula_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  ADD CONSTRAINT `docente_aula_ibfk_2` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`);

--
-- Filtros para la tabla `docente_nivel`
--
ALTER TABLE `docente_nivel`
  ADD CONSTRAINT `docente_nivel_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  ADD CONSTRAINT `docente_nivel_ibfk_2` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id_nivel`);

--
-- Filtros para la tabla `docente_seccion`
--
ALTER TABLE `docente_seccion`
  ADD CONSTRAINT `docente_seccion_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  ADD CONSTRAINT `docente_seccion_ibfk_2` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id_seccion`);

--
-- Filtros para la tabla `documentos_inscripcion`
--
ALTER TABLE `documentos_inscripcion`
  ADD CONSTRAINT `documentos_inscripcion_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `documentos_inscripcion_ibfk_2` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`);

--
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`);

--
-- Filtros para la tabla `estado_nutricional_estudiante`
--
ALTER TABLE `estado_nutricional_estudiante`
  ADD CONSTRAINT `estado_nutricional_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `estado_nutricional_estudiante_ibfk_2` FOREIGN KEY (`id_estado_nutricional`) REFERENCES `estado_nutricional` (`id_estado_nutricional`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_lugar_nacimiento`) REFERENCES `lugar_nacimiento` (`id_lugar_nacimiento`),
  ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`),
  ADD CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`),
  ADD CONSTRAINT `estudiante_ibfk_4` FOREIGN KEY (`id_procedencia`) REFERENCES `procedencia` (`id_procedencia`),
  ADD CONSTRAINT `estudiante_ibfk_5` FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica` (`id_condicion_medica`),
  ADD CONSTRAINT `estudiante_ibfk_6` FOREIGN KEY (`id_discapacidad`) REFERENCES `discapacidad` (`id_discapacidad`),
  ADD CONSTRAINT `estudiante_ibfk_7` FOREIGN KEY (`id_estado_nutricional`) REFERENCES `estado_nutricional` (`id_estado_nutricional`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`);

--
-- Filtros para la tabla `incidentes`
--
ALTER TABLE `incidentes`
  ADD CONSTRAINT `incidentes_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`);

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`);

--
-- Filtros para la tabla `inscripciones_estudiante`
--
ALTER TABLE `inscripciones_estudiante`
  ADD CONSTRAINT `inscripciones_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `inscripciones_estudiante_ibfk_2` FOREIGN KEY (`id_inscripcion`) REFERENCES `inscripciones` (`id_inscripcion`);

--
-- Filtros para la tabla `lugar_nacimiento`
--
ALTER TABLE `lugar_nacimiento`
  ADD CONSTRAINT `lugar_nacimiento_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `lugar_nacimiento_ibfk_2` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`),
  ADD CONSTRAINT `lugar_nacimiento_ibfk_3` FOREIGN KEY (`id_parroquia`) REFERENCES `parroquia` (`id_parroquia`);

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD CONSTRAINT `niveles_ibfk_1` FOREIGN KEY (`id_tipo_nivel`) REFERENCES `tipo_nivel` (`id_tipo_nivel`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_representante`) REFERENCES `representantes` (`id_representante`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_concepto_pago`) REFERENCES `conceptos_pago` (`id_concepto_pago`);

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `parroquia_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`);

--
-- Filtros para la tabla `peso`
--
ALTER TABLE `peso`
  ADD CONSTRAINT `peso_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`);

--
-- Filtros para la tabla `procedencia`
--
ALTER TABLE `procedencia`
  ADD CONSTRAINT `procedencia_ibfk_1` FOREIGN KEY (`id_tipo_procedencia`) REFERENCES `tipo_procedencia` (`id_tipo_procedencia`);

--
-- Filtros para la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD CONSTRAINT `representantes_ibfk_1` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`),
  ADD CONSTRAINT `representantes_ibfk_2` FOREIGN KEY (`id_nivel_instruccion`) REFERENCES `nivel_instruccion` (`id_nivel_instruccion`),
  ADD CONSTRAINT `representantes_ibfk_3` FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion` (`id_ocupacion`),
  ADD CONSTRAINT `representantes_ibfk_4` FOREIGN KEY (`id_direccion_habitacion`) REFERENCES `direccion` (`id_direccion`),
  ADD CONSTRAINT `representantes_ibfk_5` FOREIGN KEY (`id_direccion_trabajo`) REFERENCES `direccion` (`id_direccion`);

--
-- Filtros para la tabla `salud_estudiante`
--
ALTER TABLE `salud_estudiante`
  ADD CONSTRAINT `salud_estudiante_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`);

--
-- Filtros para la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD CONSTRAINT `secciones_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id_nivel`);

--
-- Filtros para la tabla `sector`
--
ALTER TABLE `sector`
  ADD CONSTRAINT `sector_ibfk_1` FOREIGN KEY (`id_parroquia`) REFERENCES `parroquia` (`id_parroquia`);

--
-- Filtros para la tabla `tallas`
--
ALTER TABLE `tallas`
  ADD CONSTRAINT `tallas_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `tallas_ibfk_2` FOREIGN KEY (`id_prenda`) REFERENCES `prendas` (`id_prenda`);

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `telefonos_ibfk_1` FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante` (`ci_escolar`),
  ADD CONSTRAINT `telefonos_ibfk_2` FOREIGN KEY (`id_representante`) REFERENCES `representantes` (`id_representante`),
  ADD CONSTRAINT `telefonos_ibfk_3` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`);

--
-- Filtros para la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`id_condicion_medica`) REFERENCES `condicion_medica` (`id_condicion_medica`);

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `ubicacion_ibfk_1` FOREIGN KEY (`id_sector`) REFERENCES `sector` (`id_sector`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_correo`) REFERENCES `correo` (`id_correo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
