-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql210.infinityfree.com
-- Tiempo de generación: 17-03-2026 a las 13:24:48
-- Versión del servidor: 11.4.10-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `if0_37533972_Proyecto_v6`
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

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`id_aula`, `nombre_aula`, `id_seccion`) VALUES
(1, 'Aula 1', 2),
(2, 'Aula 2', 2);

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
(2, 'correoDePrueva_2@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `tipo_direccion` enum('habitacion','trabajo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(1, 1, '...'),
(2, 1, 'Amazonas'),
(3, 1, 'Anzoátegui'),
(4, 1, 'Apure'),
(5, 1, 'Aragua'),
(6, 1, 'Barinas'),
(7, 1, 'Bolívar'),
(8, 1, 'Carabobo'),
(9, 1, 'Cojedes'),
(10, 1, 'Delta Amacuro'),
(11, 1, 'Falcón'),
(12, 1, 'Guárico'),
(13, 1, 'Lara'),
(14, 1, 'Mérida'),
(15, 1, 'Miranda'),
(16, 1, 'Monagas'),
(17, 1, 'Nueva Esparta'),
(18, 1, 'Portuguesa'),
(19, 1, 'Sucre'),
(20, 1, 'Táchira'),
(21, 1, 'Trujillo'),
(22, 1, 'La Guaira'),
(23, 1, 'Yaracuy'),
(24, 1, 'Zulia'),
(25, 1, 'Distrito Capital'),
(26, 1, '...'),
(27, 1, 'Amazonas'),
(28, 1, 'Anzoátegui'),
(29, 1, 'Apure'),
(30, 1, 'Aragua'),
(31, 1, 'Barinas'),
(32, 1, 'Bolívar'),
(33, 1, 'Carabobo'),
(34, 1, 'Cojedes'),
(35, 1, 'Delta Amacuro'),
(36, 1, 'Falcón'),
(37, 1, 'Guárico'),
(38, 1, 'Lara'),
(39, 1, 'Mérida'),
(40, 1, 'Miranda'),
(41, 1, 'Monagas'),
(42, 1, 'Nueva Esparta'),
(43, 1, 'Portuguesa'),
(44, 1, 'Sucre'),
(45, 1, 'Táchira'),
(46, 1, 'Trujillo'),
(47, 1, 'La Guaira'),
(48, 1, 'Yaracuy'),
(49, 1, 'Zulia'),
(50, 1, 'Distrito Capital'),
(51, 1, '...'),
(52, 1, 'Amazonas'),
(53, 1, 'Anzoátegui'),
(54, 1, 'Apure'),
(55, 1, 'Aragua'),
(56, 1, 'Barinas'),
(57, 1, 'Bolívar'),
(58, 1, 'Carabobo'),
(59, 1, 'Cojedes'),
(60, 1, 'Delta Amacuro'),
(61, 1, 'Falcón'),
(62, 1, 'Guárico'),
(63, 1, 'Lara'),
(64, 1, 'Mérida'),
(65, 1, 'Miranda'),
(66, 1, 'Monagas'),
(67, 1, 'Nueva Esparta'),
(68, 1, 'Portuguesa'),
(69, 1, 'Sucre'),
(70, 1, 'Táchira'),
(71, 1, 'Trujillo'),
(72, 1, 'La Guaira'),
(73, 1, 'Yaracuy'),
(74, 1, 'Zulia'),
(75, 1, 'Distrito Capital');

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
(1, 1, '....'),
(2, 2, 'Alto Orinoco'),
(3, 2, 'Atabapo'),
(4, 2, 'Atures'),
(5, 2, 'Autana'),
(6, 2, 'Manapiare'),
(7, 2, 'Maroa'),
(8, 2, 'Río Negro'),
(9, 3, 'Anaco'),
(10, 3, 'Aragua'),
(11, 3, 'Diego Bautista Urbaneja'),
(12, 3, 'Fernando de Peñalver'),
(13, 3, 'Francisco del Carmen Carvajal'),
(14, 3, 'Francisco de Miranda'),
(15, 3, 'Guanta'),
(16, 3, 'Independencia'),
(17, 3, 'José Gregorio Monagas'),
(18, 3, 'Juan Antonio Sotillo'),
(19, 3, 'Juan Manuel Cajigal'),
(20, 3, 'Libertad'),
(21, 3, 'Manuel Ezequiel Bruzual'),
(22, 3, 'Pedro María Freites'),
(23, 3, 'Píritu'),
(24, 3, 'San José de Guanipa'),
(25, 3, 'San Juan de Capistrano'),
(26, 3, 'Santa Ana'),
(27, 3, 'Simón Bolívar'),
(28, 3, 'Simón Rodríguez'),
(29, 4, 'Achaguas'),
(30, 4, 'Biruaca'),
(31, 4, 'Muñóz'),
(32, 4, 'Páez'),
(33, 4, 'Pedro Camejo'),
(34, 4, 'Rómulo Gallegos'),
(35, 4, 'San Fernando'),
(36, 5, 'Bolívar'),
(37, 5, 'Camatagua'),
(38, 5, 'Francisco Linares Alcántara'),
(39, 5, 'Girardot'),
(40, 5, 'José Ángel Lamas'),
(41, 5, 'José Félix Ribas'),
(42, 5, 'José Rafael Revenga'),
(43, 5, 'Libertador'),
(44, 5, 'Mario Briceño Iragorry'),
(45, 5, 'Ocumare de la Costa de Oro'),
(46, 5, 'San Casimiro'),
(47, 5, 'San Sebastián'),
(48, 5, 'Santiago Mariño'),
(49, 5, 'Santos Michelena'),
(50, 5, 'Sucre'),
(51, 5, 'Tovar'),
(52, 5, 'Urdaneta'),
(53, 5, 'Zamora'),
(54, 6, 'Alberto Arvelo Torrealba'),
(55, 6, 'Andrés Eloy Blanco'),
(56, 6, 'Antonio José de Sucre'),
(57, 6, 'Arismendi'),
(58, 6, 'Barinas'),
(59, 6, 'Bolívar'),
(60, 6, 'Cruz Paredes'),
(61, 6, 'Ezequiel Zamora'),
(62, 6, 'Obispos'),
(63, 6, 'Pedraza'),
(64, 6, 'Rojas'),
(65, 6, 'Sosa'),
(66, 7, 'Caroní'),
(67, 7, 'Cedeño'),
(68, 7, 'El Callao'),
(69, 7, 'Gran Sabana'),
(70, 7, 'Heres'),
(71, 7, 'Piar'),
(72, 7, 'Angostura (Raúl Leoni)'),
(73, 7, 'Roscio'),
(74, 7, 'Sifontes'),
(75, 7, 'Sucre'),
(76, 7, 'Padre Pedro Chien'),
(77, 8, 'Bejuma'),
(78, 8, 'Carlos Arvelo'),
(79, 8, 'Diego Ibarra'),
(80, 8, 'Guacara'),
(81, 8, 'Juan José Mora'),
(82, 8, 'Libertador'),
(83, 8, 'Los Guayos'),
(84, 8, 'Miranda'),
(85, 8, 'Montalbán'),
(86, 8, 'Naguanagua'),
(87, 8, 'Puerto Cabello'),
(88, 8, 'San Diego'),
(89, 8, 'San Joaquín'),
(90, 8, 'Valencia'),
(91, 9, 'Anzoátegui'),
(92, 9, 'Pao de San Juan Bautista'),
(93, 9, 'Tinaquillo'),
(94, 9, 'Girardot'),
(95, 9, 'Lima Blanco'),
(96, 9, 'Ricaurte'),
(97, 9, 'Rómulo Gallegos'),
(98, 9, 'Ezequiel Zamora'),
(99, 9, 'Tinaco'),
(100, 10, 'Antonio Díaz'),
(101, 10, 'Casacoima'),
(102, 10, 'Pedernales'),
(103, 10, 'Tucupita'),
(104, 11, 'Acosta'),
(105, 11, 'Bolívar'),
(106, 11, 'Buchivacoa'),
(107, 11, 'Cacique Manaure'),
(108, 11, 'Carirubana'),
(109, 11, 'Colina'),
(110, 11, 'Dabajuro'),
(111, 11, 'Democracia'),
(112, 11, 'Falcón'),
(113, 11, 'Federación'),
(114, 11, 'Jacura'),
(115, 11, 'Los Taques'),
(116, 11, 'Mauroa'),
(117, 11, 'Miranda'),
(118, 11, 'Monseñor Iturriza'),
(119, 11, 'Palmasola'),
(120, 11, 'Petit'),
(121, 11, 'Píritu'),
(122, 11, 'San Francisco'),
(123, 11, 'Silva'),
(124, 11, 'Sucre'),
(125, 11, 'Tocópero'),
(126, 11, 'Unión'),
(127, 11, 'Urumaco'),
(128, 11, 'Zamora'),
(129, 12, 'Camaguán'),
(130, 12, 'Chaguaramas'),
(131, 12, 'El Socorro'),
(132, 12, 'Francisco de Miranda'),
(133, 12, 'José Félix Ribas'),
(134, 12, 'José Tadeo Monagas'),
(135, 12, 'Juan Germán Roscio'),
(136, 12, 'Julián Mellado'),
(137, 12, 'Las Mercedes'),
(138, 12, 'Leonardo Infante'),
(139, 12, 'Pedro Zaraza'),
(140, 12, 'Ortíz'),
(141, 12, 'San Gerónimo de Guayabal'),
(142, 12, 'San José de Guaribe'),
(143, 12, 'Santa María de Ipire'),
(144, 13, 'Andrés Eloy Blanco'),
(145, 13, 'Crespo'),
(146, 13, 'Iribarren'),
(147, 13, 'Jiménez'),
(148, 13, 'Morán'),
(149, 13, 'Palavecino'),
(150, 13, 'Simón Planas'),
(151, 13, 'Torres'),
(152, 13, 'Urdaneta'),
(153, 14, 'Alberto Adriani'),
(154, 14, 'Andrés Bello'),
(155, 14, 'Antonio Pinto Salinas'),
(156, 14, 'Aricagua'),
(157, 14, 'Arzobispo Chacón'),
(158, 14, 'Campo Elías'),
(159, 14, 'Caracciolo Parra Olmedo'),
(160, 14, 'Cardenal Quintero'),
(161, 14, 'Guaraque'),
(162, 14, 'Julio César Salas'),
(163, 14, 'Justo Briceño'),
(164, 14, 'Libertador'),
(165, 14, 'Miranda'),
(166, 14, 'Obispo Ramos de Lora'),
(167, 14, 'Padre Noguera'),
(168, 14, 'Pueblo Llano'),
(169, 14, 'Rangel'),
(170, 14, 'Rivas Dávila'),
(171, 14, 'Santos Marquina'),
(172, 14, 'Sucre'),
(173, 14, 'Tovar'),
(174, 14, 'Tulio Febres Cordero'),
(175, 14, 'Zea'),
(176, 15, 'Acevedo'),
(177, 15, 'Andrés Bello'),
(178, 15, 'Baruta'),
(179, 15, 'Brión'),
(180, 15, 'Buroz'),
(181, 15, 'Carrizal'),
(182, 15, 'Chacao'),
(183, 15, 'Cristóbal Rojas'),
(184, 15, 'El Hatillo'),
(185, 15, 'Guaicaipuro'),
(186, 15, 'Independencia'),
(187, 15, 'Lander'),
(188, 15, 'Los Salias'),
(189, 15, 'Páez'),
(190, 15, 'Paz Castillo'),
(191, 15, 'Pedro Gual'),
(192, 15, 'Plaza'),
(193, 15, 'Simón Bolívar'),
(194, 15, 'Sucre'),
(195, 15, 'Urdaneta'),
(196, 15, 'Zamora'),
(197, 16, 'Acosta'),
(198, 16, 'Aguasay'),
(199, 16, 'Bolívar'),
(200, 16, 'Caripe'),
(201, 16, 'Cedeño'),
(202, 16, 'Ezequiel Zamora'),
(203, 16, 'Libertador'),
(204, 16, 'Maturín'),
(205, 16, 'Piar'),
(206, 16, 'Punceres'),
(207, 16, 'Santa Bárbara'),
(208, 16, 'Sotillo'),
(209, 16, 'Uracoa'),
(210, 17, 'Antolín del Campo'),
(211, 17, 'Arismendi'),
(212, 17, 'Díaz'),
(213, 17, 'García'),
(214, 17, 'Gómez'),
(215, 17, 'Maneiro'),
(216, 17, 'Marcano'),
(217, 17, 'Mariño'),
(218, 17, 'Península de Macanao'),
(219, 17, 'Tubores'),
(220, 17, 'Villalba'),
(221, 18, 'Agua Blanca'),
(222, 18, 'Araure'),
(223, 18, 'Esteller'),
(224, 18, 'Guanare'),
(225, 18, 'Guanarito'),
(226, 18, 'Monseñor José Vicente de Unda'),
(227, 18, 'Ospino'),
(228, 18, 'Páez'),
(229, 18, 'Papelón'),
(230, 18, 'San Genaro de Boconoíto'),
(231, 18, 'San Rafael de Onoto'),
(232, 18, 'Santa Rosalía'),
(233, 18, 'Sucre'),
(234, 18, 'Turén'),
(235, 19, 'Andrés Eloy Blanco'),
(236, 19, 'Andrés Mata'),
(237, 19, 'Arismendi'),
(238, 19, 'Benítez'),
(239, 19, 'Bermúdez'),
(240, 19, 'Bolívar'),
(241, 19, 'Cajigal'),
(242, 19, 'Cruz Salmerón Acosta'),
(243, 19, 'Libertador'),
(244, 19, 'Mariño'),
(245, 19, 'Mejía'),
(246, 19, 'Montes'),
(247, 19, 'Ribero'),
(248, 19, 'Sucre'),
(249, 19, 'Valdéz'),
(250, 20, 'Andrés Bello'),
(251, 20, 'Antonio Rómulo Costa'),
(252, 20, 'Ayacucho'),
(253, 20, 'Bolívar'),
(254, 20, 'Cárdenas'),
(255, 20, 'Córdoba'),
(256, 20, 'Fernández Feo'),
(257, 20, 'Francisco de Miranda'),
(258, 20, 'García de Hevia'),
(259, 20, 'Guásimos'),
(260, 20, 'Independencia'),
(261, 20, 'Jáuregui'),
(262, 20, 'José María Vargas'),
(263, 20, 'Junín'),
(264, 20, 'Libertad'),
(265, 20, 'Libertador'),
(266, 20, 'Lobatera'),
(267, 20, 'Michelena'),
(268, 20, 'Panamericano'),
(269, 20, 'Pedro María Ureña'),
(270, 20, 'Rafael Urdaneta'),
(271, 20, 'Samuel Darío Maldonado'),
(272, 20, 'San Cristóbal'),
(273, 20, 'San Judas Tadeo'),
(274, 20, 'Seboruco'),
(275, 20, 'Simón Rodríguez'),
(276, 20, 'Sucre'),
(277, 20, 'Torbes'),
(278, 20, 'Uribante'),
(279, 21, 'Andrés Bello'),
(280, 21, 'Boconó'),
(281, 21, 'Bolívar'),
(282, 21, 'Candelaria'),
(283, 21, 'Carache'),
(284, 21, 'Escuque'),
(285, 21, 'José Felipe Márquez Cañizales'),
(286, 21, 'Juan Vicente Campos Elías'),
(287, 21, 'La Ceiba'),
(288, 21, 'Miranda'),
(289, 21, 'Monte Carmelo'),
(290, 21, 'Motatán'),
(291, 21, 'Pampán'),
(292, 21, 'Pampanito'),
(293, 21, 'Rafael Rangel'),
(294, 21, 'San Rafael de Carvajal'),
(295, 21, 'Sucre'),
(296, 21, 'Trujillo'),
(297, 21, 'Urdaneta'),
(298, 21, 'Valera'),
(299, 22, 'Vargas'),
(300, 23, 'Arístides Bastidas'),
(301, 23, 'Bolívar'),
(302, 23, 'Bruzual'),
(303, 23, 'Cocorote'),
(304, 23, 'Independencia'),
(305, 23, 'José Antonio Páez'),
(306, 23, 'La Trinidad'),
(307, 23, 'Manuel Monge'),
(308, 23, 'Nirgua'),
(309, 23, 'Peña'),
(310, 23, 'San Felipe'),
(311, 23, 'Sucre'),
(312, 23, 'Urachiche'),
(313, 23, 'Veroes'),
(314, 24, 'Almirante Padilla'),
(315, 24, 'Baralt'),
(316, 24, 'Cabimas'),
(317, 24, 'Catatumbo'),
(318, 24, 'Colón'),
(319, 24, 'Francisco Javier Pulgar'),
(320, 24, 'Jesús Enrique Lossada'),
(321, 24, 'Jesús María Semprún'),
(322, 24, 'La Cañada de Urdaneta'),
(323, 24, 'Lagunillas'),
(324, 24, 'Machiques de Perijá'),
(325, 24, 'Mara'),
(326, 24, 'Maracaibo'),
(327, 24, 'Miranda'),
(328, 24, 'Páez'),
(329, 24, 'Rosario de Perijá'),
(330, 24, 'San Francisco'),
(331, 24, 'Santa Rita'),
(332, 24, 'Simón Bolívar'),
(333, 24, 'Sucre'),
(334, 24, 'Valmore Rodríguez'),
(335, 25, 'Libertador'),
(336, 1, '....'),
(337, 2, 'Alto Orinoco'),
(338, 2, 'Atabapo'),
(339, 2, 'Atures'),
(340, 2, 'Autana'),
(341, 2, 'Manapiare'),
(342, 2, 'Maroa'),
(343, 2, 'Río Negro'),
(344, 3, 'Anaco'),
(345, 3, 'Aragua'),
(346, 3, 'Diego Bautista Urbaneja'),
(347, 3, 'Fernando de Peñalver'),
(348, 3, 'Francisco del Carmen Carvajal'),
(349, 3, 'Francisco de Miranda'),
(350, 3, 'Guanta'),
(351, 3, 'Independencia'),
(352, 3, 'José Gregorio Monagas'),
(353, 3, 'Juan Antonio Sotillo'),
(354, 3, 'Juan Manuel Cajigal'),
(355, 3, 'Libertad'),
(356, 3, 'Manuel Ezequiel Bruzual'),
(357, 3, 'Pedro María Freites'),
(358, 3, 'Píritu'),
(359, 3, 'San José de Guanipa'),
(360, 3, 'San Juan de Capistrano'),
(361, 3, 'Santa Ana'),
(362, 3, 'Simón Bolívar'),
(363, 3, 'Simón Rodríguez'),
(364, 4, 'Achaguas'),
(365, 4, 'Biruaca'),
(366, 4, 'Muñóz'),
(367, 4, 'Páez'),
(368, 4, 'Pedro Camejo'),
(369, 4, 'Rómulo Gallegos'),
(370, 4, 'San Fernando'),
(371, 5, 'Bolívar'),
(372, 5, 'Camatagua'),
(373, 5, 'Francisco Linares Alcántara'),
(374, 5, 'Girardot'),
(375, 5, 'José Ángel Lamas'),
(376, 5, 'José Félix Ribas'),
(377, 5, 'José Rafael Revenga'),
(378, 5, 'Libertador'),
(379, 5, 'Mario Briceño Iragorry'),
(380, 5, 'Ocumare de la Costa de Oro'),
(381, 5, 'San Casimiro'),
(382, 5, 'San Sebastián'),
(383, 5, 'Santiago Mariño'),
(384, 5, 'Santos Michelena'),
(385, 5, 'Sucre'),
(386, 5, 'Tovar'),
(387, 5, 'Urdaneta'),
(388, 5, 'Zamora'),
(389, 6, 'Alberto Arvelo Torrealba'),
(390, 6, 'Andrés Eloy Blanco'),
(391, 6, 'Antonio José de Sucre'),
(392, 6, 'Arismendi'),
(393, 6, 'Barinas'),
(394, 6, 'Bolívar'),
(395, 6, 'Cruz Paredes'),
(396, 6, 'Ezequiel Zamora'),
(397, 6, 'Obispos'),
(398, 6, 'Pedraza'),
(399, 6, 'Rojas'),
(400, 6, 'Sosa'),
(401, 7, 'Caroní'),
(402, 7, 'Cedeño'),
(403, 7, 'El Callao'),
(404, 7, 'Gran Sabana'),
(405, 7, 'Heres'),
(406, 7, 'Piar'),
(407, 7, 'Angostura (Raúl Leoni)'),
(408, 7, 'Roscio'),
(409, 7, 'Sifontes'),
(410, 7, 'Sucre'),
(411, 7, 'Padre Pedro Chien'),
(412, 8, 'Bejuma'),
(413, 8, 'Carlos Arvelo'),
(414, 8, 'Diego Ibarra'),
(415, 8, 'Guacara'),
(416, 8, 'Juan José Mora'),
(417, 8, 'Libertador'),
(418, 8, 'Los Guayos'),
(419, 8, 'Miranda'),
(420, 8, 'Montalbán'),
(421, 8, 'Naguanagua'),
(422, 8, 'Puerto Cabello'),
(423, 8, 'San Diego'),
(424, 8, 'San Joaquín'),
(425, 8, 'Valencia'),
(426, 9, 'Anzoátegui'),
(427, 9, 'Pao de San Juan Bautista'),
(428, 9, 'Tinaquillo'),
(429, 9, 'Girardot'),
(430, 9, 'Lima Blanco'),
(431, 9, 'Ricaurte'),
(432, 9, 'Rómulo Gallegos'),
(433, 9, 'Ezequiel Zamora'),
(434, 9, 'Tinaco'),
(435, 10, 'Antonio Díaz'),
(436, 10, 'Casacoima'),
(437, 10, 'Pedernales'),
(438, 10, 'Tucupita'),
(439, 11, 'Acosta'),
(440, 11, 'Bolívar'),
(441, 11, 'Buchivacoa'),
(442, 11, 'Cacique Manaure'),
(443, 11, 'Carirubana'),
(444, 11, 'Colina'),
(445, 11, 'Dabajuro'),
(446, 11, 'Democracia'),
(447, 11, 'Falcón'),
(448, 11, 'Federación'),
(449, 11, 'Jacura'),
(450, 11, 'Los Taques'),
(451, 11, 'Mauroa'),
(452, 11, 'Miranda'),
(453, 11, 'Monseñor Iturriza'),
(454, 11, 'Palmasola'),
(455, 11, 'Petit'),
(456, 11, 'Píritu'),
(457, 11, 'San Francisco'),
(458, 11, 'Silva'),
(459, 11, 'Sucre'),
(460, 11, 'Tocópero'),
(461, 11, 'Unión'),
(462, 11, 'Urumaco'),
(463, 11, 'Zamora'),
(464, 12, 'Camaguán'),
(465, 12, 'Chaguaramas'),
(466, 12, 'El Socorro'),
(467, 12, 'Francisco de Miranda'),
(468, 12, 'José Félix Ribas'),
(469, 12, 'José Tadeo Monagas'),
(470, 12, 'Juan Germán Roscio'),
(471, 12, 'Julián Mellado'),
(472, 12, 'Las Mercedes'),
(473, 12, 'Leonardo Infante'),
(474, 12, 'Pedro Zaraza'),
(475, 12, 'Ortíz'),
(476, 12, 'San Gerónimo de Guayabal'),
(477, 12, 'San José de Guaribe'),
(478, 12, 'Santa María de Ipire'),
(479, 13, 'Andrés Eloy Blanco'),
(480, 13, 'Crespo'),
(481, 13, 'Iribarren'),
(482, 13, 'Jiménez'),
(483, 13, 'Morán'),
(484, 13, 'Palavecino'),
(485, 13, 'Simón Planas'),
(486, 13, 'Torres'),
(487, 13, 'Urdaneta'),
(488, 14, 'Alberto Adriani'),
(489, 14, 'Andrés Bello'),
(490, 14, 'Antonio Pinto Salinas'),
(491, 14, 'Aricagua'),
(492, 14, 'Arzobispo Chacón'),
(493, 14, 'Campo Elías'),
(494, 14, 'Caracciolo Parra Olmedo'),
(495, 14, 'Cardenal Quintero'),
(496, 14, 'Guaraque'),
(497, 14, 'Julio César Salas'),
(498, 14, 'Justo Briceño'),
(499, 14, 'Libertador'),
(500, 14, 'Miranda'),
(501, 14, 'Obispo Ramos de Lora'),
(502, 14, 'Padre Noguera'),
(503, 14, 'Pueblo Llano'),
(504, 14, 'Rangel'),
(505, 14, 'Rivas Dávila'),
(506, 14, 'Santos Marquina'),
(507, 14, 'Sucre'),
(508, 14, 'Tovar'),
(509, 14, 'Tulio Febres Cordero'),
(510, 14, 'Zea'),
(511, 15, 'Acevedo'),
(512, 15, 'Andrés Bello'),
(513, 15, 'Baruta'),
(514, 15, 'Brión'),
(515, 15, 'Buroz'),
(516, 15, 'Carrizal'),
(517, 15, 'Chacao'),
(518, 15, 'Cristóbal Rojas'),
(519, 15, 'El Hatillo'),
(520, 15, 'Guaicaipuro'),
(521, 15, 'Independencia'),
(522, 15, 'Lander'),
(523, 15, 'Los Salias'),
(524, 15, 'Páez'),
(525, 15, 'Paz Castillo'),
(526, 15, 'Pedro Gual'),
(527, 15, 'Plaza'),
(528, 15, 'Simón Bolívar'),
(529, 15, 'Sucre'),
(530, 15, 'Urdaneta'),
(531, 15, 'Zamora'),
(532, 16, 'Acosta'),
(533, 16, 'Aguasay'),
(534, 16, 'Bolívar'),
(535, 16, 'Caripe'),
(536, 16, 'Cedeño'),
(537, 16, 'Ezequiel Zamora'),
(538, 16, 'Libertador'),
(539, 16, 'Maturín'),
(540, 16, 'Piar'),
(541, 16, 'Punceres'),
(542, 16, 'Santa Bárbara'),
(543, 16, 'Sotillo'),
(544, 16, 'Uracoa'),
(545, 17, 'Antolín del Campo'),
(546, 17, 'Arismendi'),
(547, 17, 'Díaz'),
(548, 17, 'García'),
(549, 17, 'Gómez'),
(550, 17, 'Maneiro'),
(551, 17, 'Marcano'),
(552, 17, 'Mariño'),
(553, 17, 'Península de Macanao'),
(554, 17, 'Tubores'),
(555, 17, 'Villalba'),
(556, 18, 'Agua Blanca'),
(557, 18, 'Araure'),
(558, 18, 'Esteller'),
(559, 18, 'Guanare'),
(560, 18, 'Guanarito'),
(561, 18, 'Monseñor José Vicente de Unda'),
(562, 18, 'Ospino'),
(563, 18, 'Páez'),
(564, 18, 'Papelón'),
(565, 18, 'San Genaro de Boconoíto'),
(566, 18, 'San Rafael de Onoto'),
(567, 18, 'Santa Rosalía'),
(568, 18, 'Sucre'),
(569, 18, 'Turén'),
(570, 19, 'Andrés Eloy Blanco'),
(571, 19, 'Andrés Mata'),
(572, 19, 'Arismendi'),
(573, 19, 'Benítez'),
(574, 19, 'Bermúdez'),
(575, 19, 'Bolívar'),
(576, 19, 'Cajigal'),
(577, 19, 'Cruz Salmerón Acosta'),
(578, 19, 'Libertador'),
(579, 19, 'Mariño'),
(580, 19, 'Mejía'),
(581, 19, 'Montes'),
(582, 19, 'Ribero'),
(583, 19, 'Sucre'),
(584, 19, 'Valdéz'),
(585, 20, 'Andrés Bello'),
(586, 20, 'Antonio Rómulo Costa'),
(587, 20, 'Ayacucho'),
(588, 20, 'Bolívar'),
(589, 20, 'Cárdenas'),
(590, 20, 'Córdoba'),
(591, 20, 'Fernández Feo'),
(592, 20, 'Francisco de Miranda'),
(593, 20, 'García de Hevia'),
(594, 20, 'Guásimos'),
(595, 20, 'Independencia'),
(596, 20, 'Jáuregui'),
(597, 20, 'José María Vargas'),
(598, 20, 'Junín'),
(599, 20, 'Libertad'),
(600, 20, 'Libertador'),
(601, 20, 'Lobatera'),
(602, 20, 'Michelena'),
(603, 20, 'Panamericano'),
(604, 20, 'Pedro María Ureña'),
(605, 20, 'Rafael Urdaneta'),
(606, 20, 'Samuel Darío Maldonado'),
(607, 20, 'San Cristóbal'),
(608, 20, 'San Judas Tadeo'),
(609, 20, 'Seboruco'),
(610, 20, 'Simón Rodríguez'),
(611, 20, 'Sucre'),
(612, 20, 'Torbes'),
(613, 20, 'Uribante'),
(614, 21, 'Andrés Bello'),
(615, 21, 'Boconó'),
(616, 21, 'Bolívar'),
(617, 21, 'Candelaria'),
(618, 21, 'Carache'),
(619, 21, 'Escuque'),
(620, 21, 'José Felipe Márquez Cañizales'),
(621, 21, 'Juan Vicente Campos Elías'),
(622, 21, 'La Ceiba'),
(623, 21, 'Miranda'),
(624, 21, 'Monte Carmelo'),
(625, 21, 'Motatán'),
(626, 21, 'Pampán'),
(627, 21, 'Pampanito'),
(628, 21, 'Rafael Rangel'),
(629, 21, 'San Rafael de Carvajal'),
(630, 21, 'Sucre'),
(631, 21, 'Trujillo'),
(632, 21, 'Urdaneta'),
(633, 21, 'Valera'),
(634, 22, 'Vargas'),
(635, 23, 'Arístides Bastidas'),
(636, 23, 'Bolívar'),
(637, 23, 'Bruzual'),
(638, 23, 'Cocorote'),
(639, 23, 'Independencia'),
(640, 23, 'José Antonio Páez'),
(641, 23, 'La Trinidad'),
(642, 23, 'Manuel Monge'),
(643, 23, 'Nirgua'),
(644, 23, 'Peña'),
(645, 23, 'San Felipe'),
(646, 23, 'Sucre'),
(647, 23, 'Urachiche'),
(648, 23, 'Veroes'),
(649, 24, 'Almirante Padilla'),
(650, 24, 'Baralt'),
(651, 24, 'Cabimas'),
(652, 24, 'Catatumbo'),
(653, 24, 'Colón'),
(654, 24, 'Francisco Javier Pulgar'),
(655, 24, 'Jesús Enrique Lossada'),
(656, 24, 'Jesús María Semprún'),
(657, 24, 'La Cañada de Urdaneta'),
(658, 24, 'Lagunillas'),
(659, 24, 'Machiques de Perijá'),
(660, 24, 'Mara'),
(661, 24, 'Maracaibo'),
(662, 24, 'Miranda'),
(663, 24, 'Páez'),
(664, 24, 'Rosario de Perijá'),
(665, 24, 'San Francisco'),
(666, 24, 'Santa Rita'),
(667, 24, 'Simón Bolívar'),
(668, 24, 'Sucre'),
(669, 24, 'Valmore Rodríguez'),
(670, 25, 'Libertador'),
(671, 1, '....'),
(672, 2, 'Alto Orinoco'),
(673, 2, 'Atabapo'),
(674, 2, 'Atures'),
(675, 2, 'Autana'),
(676, 2, 'Manapiare'),
(677, 2, 'Maroa'),
(678, 2, 'Río Negro'),
(679, 3, 'Anaco'),
(680, 3, 'Aragua'),
(681, 3, 'Diego Bautista Urbaneja'),
(682, 3, 'Fernando de Peñalver'),
(683, 3, 'Francisco del Carmen Carvajal'),
(684, 3, 'Francisco de Miranda'),
(685, 3, 'Guanta'),
(686, 3, 'Independencia'),
(687, 3, 'José Gregorio Monagas'),
(688, 3, 'Juan Antonio Sotillo'),
(689, 3, 'Juan Manuel Cajigal'),
(690, 3, 'Libertad'),
(691, 3, 'Manuel Ezequiel Bruzual'),
(692, 3, 'Pedro María Freites'),
(693, 3, 'Píritu'),
(694, 3, 'San José de Guanipa'),
(695, 3, 'San Juan de Capistrano'),
(696, 3, 'Santa Ana'),
(697, 3, 'Simón Bolívar'),
(698, 3, 'Simón Rodríguez'),
(699, 4, 'Achaguas'),
(700, 4, 'Biruaca'),
(701, 4, 'Muñóz'),
(702, 4, 'Páez'),
(703, 4, 'Pedro Camejo'),
(704, 4, 'Rómulo Gallegos'),
(705, 4, 'San Fernando'),
(706, 5, 'Bolívar'),
(707, 5, 'Camatagua'),
(708, 5, 'Francisco Linares Alcántara'),
(709, 5, 'Girardot'),
(710, 5, 'José Ángel Lamas'),
(711, 5, 'José Félix Ribas'),
(712, 5, 'José Rafael Revenga'),
(713, 5, 'Libertador'),
(714, 5, 'Mario Briceño Iragorry'),
(715, 5, 'Ocumare de la Costa de Oro'),
(716, 5, 'San Casimiro'),
(717, 5, 'San Sebastián'),
(718, 5, 'Santiago Mariño'),
(719, 5, 'Santos Michelena'),
(720, 5, 'Sucre'),
(721, 5, 'Tovar'),
(722, 5, 'Urdaneta'),
(723, 5, 'Zamora'),
(724, 6, 'Alberto Arvelo Torrealba'),
(725, 6, 'Andrés Eloy Blanco'),
(726, 6, 'Antonio José de Sucre'),
(727, 6, 'Arismendi'),
(728, 6, 'Barinas'),
(729, 6, 'Bolívar'),
(730, 6, 'Cruz Paredes'),
(731, 6, 'Ezequiel Zamora'),
(732, 6, 'Obispos'),
(733, 6, 'Pedraza'),
(734, 6, 'Rojas'),
(735, 6, 'Sosa'),
(736, 7, 'Caroní'),
(737, 7, 'Cedeño'),
(738, 7, 'El Callao'),
(739, 7, 'Gran Sabana'),
(740, 7, 'Heres'),
(741, 7, 'Piar'),
(742, 7, 'Angostura (Raúl Leoni)'),
(743, 7, 'Roscio'),
(744, 7, 'Sifontes'),
(745, 7, 'Sucre'),
(746, 7, 'Padre Pedro Chien'),
(747, 8, 'Bejuma'),
(748, 8, 'Carlos Arvelo'),
(749, 8, 'Diego Ibarra'),
(750, 8, 'Guacara'),
(751, 8, 'Juan José Mora'),
(752, 8, 'Libertador'),
(753, 8, 'Los Guayos'),
(754, 8, 'Miranda'),
(755, 8, 'Montalbán'),
(756, 8, 'Naguanagua'),
(757, 8, 'Puerto Cabello'),
(758, 8, 'San Diego'),
(759, 8, 'San Joaquín'),
(760, 8, 'Valencia'),
(761, 9, 'Anzoátegui'),
(762, 9, 'Pao de San Juan Bautista'),
(763, 9, 'Tinaquillo'),
(764, 9, 'Girardot'),
(765, 9, 'Lima Blanco'),
(766, 9, 'Ricaurte'),
(767, 9, 'Rómulo Gallegos'),
(768, 9, 'Ezequiel Zamora'),
(769, 9, 'Tinaco'),
(770, 10, 'Antonio Díaz'),
(771, 10, 'Casacoima'),
(772, 10, 'Pedernales'),
(773, 10, 'Tucupita'),
(774, 11, 'Acosta'),
(775, 11, 'Bolívar'),
(776, 11, 'Buchivacoa'),
(777, 11, 'Cacique Manaure'),
(778, 11, 'Carirubana'),
(779, 11, 'Colina'),
(780, 11, 'Dabajuro'),
(781, 11, 'Democracia'),
(782, 11, 'Falcón'),
(783, 11, 'Federación'),
(784, 11, 'Jacura'),
(785, 11, 'Los Taques'),
(786, 11, 'Mauroa'),
(787, 11, 'Miranda'),
(788, 11, 'Monseñor Iturriza'),
(789, 11, 'Palmasola'),
(790, 11, 'Petit'),
(791, 11, 'Píritu'),
(792, 11, 'San Francisco'),
(793, 11, 'Silva'),
(794, 11, 'Sucre'),
(795, 11, 'Tocópero'),
(796, 11, 'Unión'),
(797, 11, 'Urumaco'),
(798, 11, 'Zamora'),
(799, 12, 'Camaguán'),
(800, 12, 'Chaguaramas'),
(801, 12, 'El Socorro'),
(802, 12, 'Francisco de Miranda'),
(803, 12, 'José Félix Ribas'),
(804, 12, 'José Tadeo Monagas'),
(805, 12, 'Juan Germán Roscio'),
(806, 12, 'Julián Mellado'),
(807, 12, 'Las Mercedes'),
(808, 12, 'Leonardo Infante'),
(809, 12, 'Pedro Zaraza'),
(810, 12, 'Ortíz'),
(811, 12, 'San Gerónimo de Guayabal'),
(812, 12, 'San José de Guaribe'),
(813, 12, 'Santa María de Ipire'),
(814, 13, 'Andrés Eloy Blanco'),
(815, 13, 'Crespo'),
(816, 13, 'Iribarren'),
(817, 13, 'Jiménez'),
(818, 13, 'Morán'),
(819, 13, 'Palavecino'),
(820, 13, 'Simón Planas'),
(821, 13, 'Torres'),
(822, 13, 'Urdaneta'),
(823, 14, 'Alberto Adriani'),
(824, 14, 'Andrés Bello'),
(825, 14, 'Antonio Pinto Salinas'),
(826, 14, 'Aricagua'),
(827, 14, 'Arzobispo Chacón'),
(828, 14, 'Campo Elías'),
(829, 14, 'Caracciolo Parra Olmedo'),
(830, 14, 'Cardenal Quintero'),
(831, 14, 'Guaraque'),
(832, 14, 'Julio César Salas'),
(833, 14, 'Justo Briceño'),
(834, 14, 'Libertador'),
(835, 14, 'Miranda'),
(836, 14, 'Obispo Ramos de Lora'),
(837, 14, 'Padre Noguera'),
(838, 14, 'Pueblo Llano'),
(839, 14, 'Rangel'),
(840, 14, 'Rivas Dávila'),
(841, 14, 'Santos Marquina'),
(842, 14, 'Sucre'),
(843, 14, 'Tovar'),
(844, 14, 'Tulio Febres Cordero'),
(845, 14, 'Zea'),
(846, 15, 'Acevedo'),
(847, 15, 'Andrés Bello'),
(848, 15, 'Baruta'),
(849, 15, 'Brión'),
(850, 15, 'Buroz'),
(851, 15, 'Carrizal'),
(852, 15, 'Chacao'),
(853, 15, 'Cristóbal Rojas'),
(854, 15, 'El Hatillo'),
(855, 15, 'Guaicaipuro'),
(856, 15, 'Independencia'),
(857, 15, 'Lander'),
(858, 15, 'Los Salias'),
(859, 15, 'Páez'),
(860, 15, 'Paz Castillo'),
(861, 15, 'Pedro Gual'),
(862, 15, 'Plaza'),
(863, 15, 'Simón Bolívar'),
(864, 15, 'Sucre'),
(865, 15, 'Urdaneta'),
(866, 15, 'Zamora'),
(867, 16, 'Acosta'),
(868, 16, 'Aguasay'),
(869, 16, 'Bolívar'),
(870, 16, 'Caripe'),
(871, 16, 'Cedeño'),
(872, 16, 'Ezequiel Zamora'),
(873, 16, 'Libertador'),
(874, 16, 'Maturín'),
(875, 16, 'Piar'),
(876, 16, 'Punceres'),
(877, 16, 'Santa Bárbara'),
(878, 16, 'Sotillo'),
(879, 16, 'Uracoa'),
(880, 17, 'Antolín del Campo'),
(881, 17, 'Arismendi'),
(882, 17, 'Díaz'),
(883, 17, 'García'),
(884, 17, 'Gómez'),
(885, 17, 'Maneiro'),
(886, 17, 'Marcano'),
(887, 17, 'Mariño'),
(888, 17, 'Península de Macanao'),
(889, 17, 'Tubores'),
(890, 17, 'Villalba'),
(891, 18, 'Agua Blanca'),
(892, 18, 'Araure'),
(893, 18, 'Esteller'),
(894, 18, 'Guanare'),
(895, 18, 'Guanarito'),
(896, 18, 'Monseñor José Vicente de Unda'),
(897, 18, 'Ospino'),
(898, 18, 'Páez'),
(899, 18, 'Papelón'),
(900, 18, 'San Genaro de Boconoíto'),
(901, 18, 'San Rafael de Onoto'),
(902, 18, 'Santa Rosalía'),
(903, 18, 'Sucre'),
(904, 18, 'Turén'),
(905, 19, 'Andrés Eloy Blanco'),
(906, 19, 'Andrés Mata'),
(907, 19, 'Arismendi'),
(908, 19, 'Benítez'),
(909, 19, 'Bermúdez'),
(910, 19, 'Bolívar'),
(911, 19, 'Cajigal'),
(912, 19, 'Cruz Salmerón Acosta'),
(913, 19, 'Libertador'),
(914, 19, 'Mariño'),
(915, 19, 'Mejía'),
(916, 19, 'Montes'),
(917, 19, 'Ribero'),
(918, 19, 'Sucre'),
(919, 19, 'Valdéz'),
(920, 20, 'Andrés Bello'),
(921, 20, 'Antonio Rómulo Costa'),
(922, 20, 'Ayacucho'),
(923, 20, 'Bolívar'),
(924, 20, 'Cárdenas'),
(925, 20, 'Córdoba'),
(926, 20, 'Fernández Feo'),
(927, 20, 'Francisco de Miranda'),
(928, 20, 'García de Hevia'),
(929, 20, 'Guásimos'),
(930, 20, 'Independencia'),
(931, 20, 'Jáuregui'),
(932, 20, 'José María Vargas'),
(933, 20, 'Junín'),
(934, 20, 'Libertad'),
(935, 20, 'Libertador'),
(936, 20, 'Lobatera'),
(937, 20, 'Michelena'),
(938, 20, 'Panamericano'),
(939, 20, 'Pedro María Ureña'),
(940, 20, 'Rafael Urdaneta'),
(941, 20, 'Samuel Darío Maldonado'),
(942, 20, 'San Cristóbal'),
(943, 20, 'San Judas Tadeo'),
(944, 20, 'Seboruco'),
(945, 20, 'Simón Rodríguez'),
(946, 20, 'Sucre'),
(947, 20, 'Torbes'),
(948, 20, 'Uribante'),
(949, 21, 'Andrés Bello'),
(950, 21, 'Boconó'),
(951, 21, 'Bolívar'),
(952, 21, 'Candelaria'),
(953, 21, 'Carache'),
(954, 21, 'Escuque'),
(955, 21, 'José Felipe Márquez Cañizales'),
(956, 21, 'Juan Vicente Campos Elías'),
(957, 21, 'La Ceiba'),
(958, 21, 'Miranda'),
(959, 21, 'Monte Carmelo'),
(960, 21, 'Motatán'),
(961, 21, 'Pampán'),
(962, 21, 'Pampanito'),
(963, 21, 'Rafael Rangel'),
(964, 21, 'San Rafael de Carvajal'),
(965, 21, 'Sucre'),
(966, 21, 'Trujillo'),
(967, 21, 'Urdaneta'),
(968, 21, 'Valera'),
(969, 22, 'Vargas'),
(970, 23, 'Arístides Bastidas'),
(971, 23, 'Bolívar'),
(972, 23, 'Bruzual'),
(973, 23, 'Cocorote'),
(974, 23, 'Independencia'),
(975, 23, 'José Antonio Páez'),
(976, 23, 'La Trinidad'),
(977, 23, 'Manuel Monge'),
(978, 23, 'Nirgua'),
(979, 23, 'Peña'),
(980, 23, 'San Felipe'),
(981, 23, 'Sucre'),
(982, 23, 'Urachiche'),
(983, 23, 'Veroes'),
(984, 24, 'Almirante Padilla'),
(985, 24, 'Baralt'),
(986, 24, 'Cabimas'),
(987, 24, 'Catatumbo'),
(988, 24, 'Colón'),
(989, 24, 'Francisco Javier Pulgar'),
(990, 24, 'Jesús Enrique Lossada'),
(991, 24, 'Jesús María Semprún'),
(992, 24, 'La Cañada de Urdaneta'),
(993, 24, 'Lagunillas'),
(994, 24, 'Machiques de Perijá'),
(995, 24, 'Mara'),
(996, 24, 'Maracaibo'),
(997, 24, 'Miranda'),
(998, 24, 'Páez'),
(999, 24, 'Rosario de Perijá'),
(1000, 24, 'San Francisco'),
(1001, 24, 'Santa Rita'),
(1002, 24, 'Simón Bolívar'),
(1003, 24, 'Sucre'),
(1004, 24, 'Valmore Rodríguez'),
(1005, 25, 'Libertador');

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

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id_nivel`, `id_tipo_nivel`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 5);

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
(1, 'Venezuela'),
(2, 'Venezuela'),
(3, 'Venezuela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `id_tipo_parentesco` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `ci_escolar` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(1, 1, '...'),
(2, 2, 'Alto Orinoco'),
(3, 2, 'Mavaca'),
(4, 2, 'Sierra Parima'),
(5, 3, 'Atabapo'),
(6, 3, 'Ucata'),
(7, 3, 'Yapacana'),
(8, 4, 'Fernando Girón Tovar'),
(9, 4, 'Patanemo'),
(10, 4, 'San Juan de Manapiare'),
(11, 5, 'Autana'),
(12, 5, 'Munduapo'),
(13, 5, 'Samariapo'),
(14, 6, 'Alto Ventuari'),
(15, 6, 'Manapiare'),
(16, 6, 'San Juan de Manapiare'),
(17, 7, 'Maroa'),
(18, 7, 'Comunidad de Maroa'),
(19, 7, 'San Carlos de Río Negro'),
(20, 8, 'Río Negro'),
(21, 8, 'Solano'),
(22, 8, 'San Carlos de Río Negro'),
(23, 9, 'Anaco'),
(24, 9, 'Buena Vista'),
(25, 9, 'San Joaquín'),
(26, 10, 'Aragua de Barcelona'),
(27, 10, 'Cachipo'),
(28, 10, 'Santa Rosa'),
(29, 11, 'Lechería'),
(30, 11, 'El Morro'),
(31, 11, 'Santa Rosa'),
(32, 12, 'Puerto Píritu'),
(33, 12, 'San Miguel'),
(34, 12, 'Sucre'),
(35, 13, 'Valle de Guanape'),
(36, 13, 'Santa Bárbara'),
(37, 13, 'San Luis de Guanape'),
(38, 14, 'Pariaguán'),
(39, 14, 'Atapirire'),
(40, 14, 'El Pao de Barcelona'),
(41, 15, 'Guanta'),
(42, 15, 'Chorrerón'),
(43, 15, 'Cumanacoa'),
(44, 16, 'Soledad'),
(45, 16, 'Mamo'),
(46, 16, 'Aguasay'),
(47, 17, 'Mapire'),
(48, 17, 'Piar'),
(49, 17, 'San Diego de Cabrutica'),
(50, 18, 'Puerto La Cruz'),
(51, 18, 'Pozuelos'),
(52, 18, 'Guaraguao'),
(53, 19, 'Onoto'),
(54, 19, 'San Pablo'),
(55, 19, 'La Trinchera'),
(56, 20, 'San Mateo'),
(57, 20, 'Lechería'),
(58, 20, 'El Carito'),
(59, 21, 'Clarines'),
(60, 21, 'Guanape'),
(61, 21, 'Sabana de Uchire'),
(62, 23, 'Píritu'),
(63, 23, 'San Francisco de Píritu'),
(64, 23, 'El Tigrito'),
(65, 24, 'San José de Guanipa'),
(66, 24, 'El Tigre'),
(67, 24, 'Cantaura'),
(68, 25, 'Boca de Uchire'),
(69, 25, 'Chacual'),
(70, 25, 'La Montaña'),
(71, 26, 'Santa Ana'),
(72, 26, 'La Encrucijada'),
(73, 26, 'San Juan'),
(74, 1, '...'),
(75, 2, 'Alto Orinoco'),
(76, 2, 'Mavaca'),
(77, 2, 'Sierra Parima'),
(78, 3, 'Atabapo'),
(79, 3, 'Ucata'),
(80, 3, 'Yapacana'),
(81, 4, 'Fernando Girón Tovar'),
(82, 4, 'Patanemo'),
(83, 4, 'San Juan de Manapiare'),
(84, 5, 'Autana'),
(85, 5, 'Munduapo'),
(86, 5, 'Samariapo'),
(87, 6, 'Alto Ventuari'),
(88, 6, 'Manapiare'),
(89, 6, 'San Juan de Manapiare'),
(90, 7, 'Maroa'),
(91, 7, 'Comunidad de Maroa'),
(92, 7, 'San Carlos de Río Negro'),
(93, 8, 'Río Negro'),
(94, 8, 'Solano'),
(95, 8, 'San Carlos de Río Negro'),
(96, 9, 'Anaco'),
(97, 9, 'Buena Vista'),
(98, 9, 'San Joaquín'),
(99, 10, 'Aragua de Barcelona'),
(100, 10, 'Cachipo'),
(101, 10, 'Santa Rosa'),
(102, 11, 'Lechería'),
(103, 11, 'El Morro'),
(104, 11, 'Santa Rosa'),
(105, 12, 'Puerto Píritu'),
(106, 12, 'San Miguel'),
(107, 12, 'Sucre'),
(108, 13, 'Valle de Guanape'),
(109, 13, 'Santa Bárbara'),
(110, 13, 'San Luis de Guanape'),
(111, 14, 'Pariaguán'),
(112, 14, 'Atapirire'),
(113, 14, 'El Pao de Barcelona'),
(114, 15, 'Guanta'),
(115, 15, 'Chorrerón'),
(116, 15, 'Cumanacoa'),
(117, 16, 'Soledad'),
(118, 16, 'Mamo'),
(119, 16, 'Aguasay'),
(120, 17, 'Mapire'),
(121, 17, 'Piar'),
(122, 17, 'San Diego de Cabrutica'),
(123, 18, 'Puerto La Cruz'),
(124, 18, 'Pozuelos'),
(125, 18, 'Guaraguao'),
(126, 19, 'Onoto'),
(127, 19, 'San Pablo'),
(128, 19, 'La Trinchera'),
(129, 20, 'San Mateo'),
(130, 20, 'Lechería'),
(131, 20, 'El Carito'),
(132, 21, 'Clarines'),
(133, 21, 'Guanape'),
(134, 21, 'Sabana de Uchire'),
(135, 22, 'Cantaura'),
(136, 22, 'Libertador'),
(137, 22, 'Santa Rosa'),
(138, 23, 'Píritu'),
(139, 23, 'San Francisco de Píritu'),
(140, 23, 'El Tigrito'),
(141, 24, 'San José de Guanipa'),
(142, 24, 'El Tigre'),
(143, 24, 'Cantaura'),
(144, 25, 'Boca de Uchire'),
(145, 25, 'Chacual'),
(146, 25, 'La Montaña'),
(147, 26, 'Santa Ana'),
(148, 26, 'La Encrucijada'),
(149, 26, 'San Juan'),
(150, 27, 'El Carmen'),
(151, 27, 'San Cristóbal'),
(152, 27, 'Bergantín'),
(153, 28, 'Edmundo Barrios'),
(154, 28, 'El Tigre'),
(155, 28, 'Puerto Ordaz'),
(156, 29, 'Achaguas'),
(157, 29, 'Guarico'),
(158, 29, 'Mantecal'),
(159, 30, 'Biruaca'),
(160, 30, 'San Juan de Payara'),
(161, 30, 'El Yagual'),
(162, 31, 'Muñoz'),
(163, 31, 'Bruzual'),
(164, 31, 'Elorza'),
(165, 32, 'Guasdualito'),
(166, 32, 'Aramendi'),
(167, 32, 'El Amparo'),
(168, 33, 'San Juan de Payara'),
(169, 33, 'La Trinidad de Orichuna'),
(170, 33, 'Mata de Caña'),
(171, 34, 'Elorza'),
(172, 34, 'El Viento'),
(173, 34, 'Guachara'),
(174, 35, 'San Fernando'),
(175, 35, 'El Recreo'),
(176, 35, 'San Rafael de Atamaica'),
(177, 36, 'San Mateo'),
(178, 36, 'El Consejo'),
(179, 36, 'Augusto Mijares'),
(180, 37, 'Camatagua'),
(181, 37, 'Carmen de Cura'),
(182, 37, 'Urdaneta'),
(183, 38, 'Santa Rita'),
(184, 38, 'Francisco de Miranda'),
(185, 38, 'Monseñor Feliciano González'),
(186, 39, 'Choroní'),
(187, 39, 'El Limón'),
(188, 39, 'Las Delicias'),
(189, 40, 'Santa Cruz'),
(190, 40, 'La Pica'),
(191, 40, 'Chuao'),
(192, 41, 'La Victoria'),
(193, 41, 'Castor Nieves Ríos'),
(194, 41, 'Las Mercedes'),
(195, 42, 'El Consejo'),
(196, 42, 'San Pablo'),
(197, 42, 'Punta Brava'),
(198, 43, 'Palo Negro'),
(199, 43, 'San Martín de Porres'),
(200, 43, 'Santa Inés'),
(201, 44, 'El Limón'),
(202, 44, 'Caña de Azúcar'),
(203, 44, 'La Victoria'),
(204, 45, 'Ocumare de la Costa'),
(205, 45, 'El Limón'),
(206, 45, 'Cata'),
(207, 46, 'San Casimiro'),
(208, 46, 'Guiripa'),
(209, 46, 'Valle Morín'),
(210, 47, 'San Sebastián'),
(211, 47, 'Guayabal'),
(212, 47, 'Quiroz'),
(213, 48, 'Turmero'),
(214, 48, 'Arevalo Aponte'),
(215, 48, 'Chuao'),
(216, 49, 'Las Tejerías'),
(217, 49, 'Tiara'),
(218, 49, 'La Victoria'),
(219, 50, 'Cagua'),
(220, 50, 'Bella Vista'),
(221, 50, 'Chuao'),
(222, 51, 'Colonia Tovar'),
(223, 51, 'El Cedral'),
(224, 51, 'La Montaña'),
(225, 52, 'Barbacoas'),
(226, 52, 'Las Peñitas'),
(227, 52, 'San Casimiro'),
(228, 53, 'Villa de Cura'),
(229, 53, 'Magdaleno'),
(230, 53, 'San Francisco de Asís'),
(231, 54, 'Sabaneta'),
(232, 54, 'Rodríguez Domínguez'),
(233, 54, 'Barinas'),
(234, 55, 'El Cantón'),
(235, 55, 'Santa Cruz de Guacas'),
(236, 55, 'Puerto Vivas'),
(237, 56, 'Socopó'),
(238, 56, 'Ticoporo'),
(239, 56, 'Nicolás Pulido'),
(240, 57, 'Arismendi'),
(241, 57, 'Arismendi de Caicara'),
(242, 57, 'Chaguaramo'),
(243, 58, 'Alto Barinas'),
(244, 58, 'Barinas'),
(245, 58, 'Corazón de Jesús'),
(246, 59, 'Barinitas'),
(247, 59, 'Altamira de Cáceres'),
(248, 59, 'Calderas'),
(249, 60, 'Barrancas'),
(250, 60, 'El Socorro'),
(251, 60, 'Santa Bárbara'),
(252, 61, 'Santa Bárbara'),
(253, 61, 'Pedraza La Vieja'),
(254, 61, 'Ciudad Bolivia'),
(255, 62, 'Obispos'),
(256, 62, 'El Real'),
(257, 62, 'Los Guasimitos'),
(258, 63, 'Ciudad Bolivia'),
(259, 63, 'Iglesia'),
(260, 63, 'José Ignacio del Pumar'),
(261, 64, 'Libertad'),
(262, 64, 'Dolores'),
(263, 64, 'Palacio Fajardo'),
(264, 65, 'Ciudad de Nutrias'),
(265, 65, 'El Regalo'),
(266, 65, 'Puerto de Nutrias'),
(267, 66, 'Cachamay'),
(268, 66, 'Chirica'),
(269, 66, 'Dalla Costa'),
(270, 67, 'Caicara del Orinoco'),
(271, 67, 'Altagracia'),
(272, 67, 'Ascensión Farreras'),
(273, 68, 'El Callao'),
(274, 68, 'El Dorado'),
(275, 68, 'Tumeremo'),
(276, 69, 'Santa Elena de Uairén'),
(277, 69, 'Ikabarú'),
(278, 69, 'Urimán'),
(279, 70, 'Catedral'),
(280, 70, 'Zea'),
(281, 70, 'Panapana'),
(282, 71, 'Upata'),
(283, 71, 'El Pao'),
(284, 71, 'Andrés Eloy Blanco'),
(285, 72, 'Ciudad Piar'),
(286, 72, 'Raúl Leoni'),
(287, 72, 'La Paragua'),
(288, 73, 'Guasipati'),
(289, 73, 'Salto La Llovizna'),
(290, 73, 'San Isidro'),
(291, 74, 'Tumeremo'),
(292, 74, 'Dalla Costa'),
(293, 74, 'El Dorado'),
(294, 75, 'Maripa'),
(295, 75, 'Las Majadas'),
(296, 75, 'Santa Rosa'),
(297, 76, 'El Palmar'),
(298, 76, 'Padre Pedro Chien'),
(299, 76, 'Santa Cruz'),
(300, 77, 'Bejuma'),
(301, 77, 'Canoabo'),
(302, 77, 'Simón Bolívar'),
(303, 78, 'Güigüe'),
(304, 78, 'Belén'),
(305, 78, 'Tacarigua'),
(306, 79, 'Mariara'),
(307, 79, 'Aguas Calientes'),
(308, 79, 'San Joaquín'),
(309, 80, 'Guacara'),
(310, 80, 'Yagua'),
(311, 80, 'Ciudad Alianza'),
(312, 81, 'Morón'),
(313, 81, 'Urama'),
(314, 81, 'Yaracuy'),
(315, 82, 'Tocuyito'),
(316, 82, 'Independencia'),
(317, 82, 'Los Naranjos'),
(318, 83, 'Los Guayos'),
(319, 83, 'Las Vegas'),
(320, 83, 'Parque Industrial'),
(321, 84, 'Miranda'),
(322, 84, 'El Toco'),
(323, 84, 'La Aguada'),
(324, 85, 'Montalbán'),
(325, 85, 'La Yaguara'),
(326, 85, 'Monseñor Castro'),
(327, 86, 'Naguanagua'),
(328, 86, 'La Campiña'),
(329, 86, 'Mañongo'),
(330, 87, 'Bartolomé Salom'),
(331, 87, 'Borburata'),
(332, 87, 'Fraternidad'),
(333, 88, 'San Diego'),
(334, 88, 'Yaracuy'),
(335, 88, 'La Cumaca'),
(336, 89, 'San Joaquín'),
(337, 89, 'Los Palos Grandes'),
(338, 89, 'La Pradera'),
(339, 90, 'Candelaria'),
(340, 90, 'Catedral'),
(341, 90, 'El Socorro'),
(342, 91, 'Cojedes'),
(343, 91, 'El Baúl'),
(344, 91, 'La Aguadita'),
(345, 92, 'El Pao'),
(346, 92, 'Manrique'),
(347, 92, 'Las Vegas'),
(348, 93, 'Tinaquillo'),
(349, 93, 'Macapo'),
(350, 93, 'La Candelaria'),
(351, 94, 'El Baúl'),
(352, 94, 'Sucre'),
(353, 94, 'El Baúl Abajo'),
(354, 95, 'Macapo'),
(355, 95, 'La Aguadita'),
(356, 95, 'El Limón'),
(357, 96, 'Libertad'),
(358, 96, 'Ricaurte'),
(359, 96, 'Las Vegas'),
(360, 97, 'Las Vegas'),
(361, 97, 'El Pao'),
(362, 97, 'Manrique'),
(363, 98, 'San Carlos'),
(364, 98, 'Juan Ángel Bravo'),
(365, 98, 'Manuel Manrique'),
(366, 99, 'Tinaco'),
(367, 99, 'Macapo'),
(368, 99, 'La Aguadita'),
(369, 100, 'Curiapo'),
(370, 100, 'Almirante Luis Brión'),
(371, 100, 'Manuel Renaud'),
(372, 101, 'Irapa'),
(373, 101, 'Manuel Piar'),
(374, 101, 'Vicente Días'),
(375, 102, 'Pedernales'),
(376, 102, 'Guasina'),
(377, 102, 'Punta Pescador'),
(378, 103, 'San José'),
(379, 103, 'San Rafael'),
(380, 103, 'Tucupita'),
(381, 104, 'San Juan de los Cayos'),
(382, 104, 'Capadare'),
(383, 104, 'La Vela de Coro'),
(384, 105, 'San Luis'),
(385, 105, 'La Vela'),
(386, 105, 'Bolívar'),
(387, 106, 'Capatárida'),
(388, 106, 'San José de Seque'),
(389, 106, 'Zazárida'),
(390, 107, 'La Vela de Coro'),
(391, 107, 'Punta Cardón'),
(392, 107, 'San Luis'),
(393, 108, 'Carirubana'),
(394, 108, 'Norte'),
(395, 108, 'Punta Cardón'),
(396, 109, 'La Vela de Coro'),
(397, 109, 'Acurigua'),
(398, 109, 'Guaibacoa'),
(399, 110, 'Dabajuro'),
(400, 110, 'Hato Viejo'),
(401, 110, 'Urumaco'),
(402, 111, 'Pedregal'),
(403, 111, 'Agua Larga'),
(404, 111, 'Avaria'),
(405, 112, 'Pueblo Nuevo'),
(406, 112, 'Adícora'),
(407, 112, 'Jadacaquiva'),
(408, 113, 'Churuguara'),
(409, 113, 'Agua Larga'),
(410, 113, 'El Paují'),
(411, 114, 'Jacura'),
(412, 114, 'Agua Larga'),
(413, 114, 'Araurima'),
(414, 115, 'Judibana'),
(415, 115, 'Los Taques'),
(416, 115, 'Villa Marina'),
(417, 116, 'Mene de Mauroa'),
(418, 116, 'Casigua'),
(419, 116, 'San Félix'),
(420, 117, 'Coro'),
(421, 117, 'Mitare'),
(422, 117, 'Sabana Larga'),
(423, 118, 'Chichiriviche'),
(424, 118, 'Boca de Aroa'),
(425, 118, 'Tucacas'),
(426, 119, 'Palmasola'),
(427, 119, 'El Silencio'),
(428, 119, 'El Tocuyo'),
(429, 120, 'Cabure'),
(430, 120, 'Colina'),
(431, 120, 'Sabaneta'),
(432, 121, 'Píritu'),
(433, 121, 'San José'),
(434, 121, 'Puerta de Píritu'),
(435, 122, 'Mirimire'),
(436, 122, 'El Charal'),
(437, 122, 'San Francisco'),
(438, 123, 'Tucacas'),
(439, 123, 'Boca de Aroa'),
(440, 123, 'Chichiriviche'),
(441, 124, 'La Cruz de Taratara'),
(442, 124, 'Sucre'),
(443, 124, 'Píritu'),
(444, 125, 'Tocópero'),
(445, 125, 'Aragüita'),
(446, 125, 'Tocuyito'),
(447, 126, 'Santa Cruz de Bucaral'),
(448, 126, 'Purureche'),
(449, 126, 'El Charal'),
(450, 127, 'Urumaco'),
(451, 127, 'El Yabal'),
(452, 127, 'Casigua'),
(453, 128, 'Puerto Cumarebo'),
(454, 128, 'La Ciénaga'),
(455, 128, 'Pueblo Cumarebo'),
(456, 129, 'Camaguán'),
(457, 129, 'Puerto de Nutrias'),
(458, 129, 'El Rosario'),
(459, 130, 'Chaguaramas'),
(460, 130, 'Camatagua'),
(461, 130, 'La Candelaria'),
(462, 131, 'El Socorro'),
(463, 131, 'Tucupido'),
(464, 131, 'Santa María de Ipire'),
(465, 132, 'Calabozo'),
(466, 132, 'El Rastro'),
(467, 132, 'Tucupido'),
(468, 133, 'Tucupido'),
(469, 133, 'San Rafael de Laya'),
(470, 133, 'Valle de la Pascua'),
(471, 134, 'Altagracia de Orituco'),
(472, 134, 'Lezama'),
(473, 134, 'Paso Real de Macaira'),
(474, 135, 'San Juan de los Morros'),
(475, 135, 'Parapara'),
(476, 135, 'Cantagallo'),
(477, 136, 'El Sombrero'),
(478, 136, 'Barbacoas'),
(479, 136, 'San Francisco de Tiznados'),
(480, 137, 'Las Mercedes'),
(481, 137, 'Cazorla'),
(482, 137, 'Tucupido'),
(483, 138, 'Valle de la Pascua'),
(484, 138, 'Espino'),
(485, 138, 'Santa María de Ipire'),
(486, 139, 'Zaraza'),
(487, 139, 'San José de Unare'),
(488, 139, 'San Juan de los Morros'),
(489, 140, 'Ortíz'),
(490, 140, 'San Francisco de Tiznados'),
(491, 140, 'Guayabal'),
(492, 141, 'San Gerónimo de Guayabal'),
(493, 141, 'Camaguán'),
(494, 141, 'Puerto de Nutrias'),
(495, 142, 'San José de Guaribe'),
(496, 142, 'San José'),
(497, 142, 'Altagracia de Orituco'),
(498, 143, 'Santa María de Ipire'),
(499, 143, 'Zaraza'),
(500, 143, 'Pariaguán'),
(501, 144, 'Sanare'),
(502, 144, 'Pío Tamayo'),
(503, 144, 'Yacambú'),
(504, 145, 'Duaca'),
(505, 145, 'Crespo'),
(506, 145, 'Agua Salada'),
(507, 146, 'Concepción'),
(508, 146, 'Aguedo Felipe Alvarado'),
(509, 146, 'Buena Vista'),
(510, 147, 'Quíbor'),
(511, 147, 'Cubiro'),
(512, 147, 'José Bernardo Dorante'),
(513, 148, 'El Tocuyo'),
(514, 148, 'Anzoátegui'),
(515, 148, 'Guarico'),
(516, 149, 'Cabudare'),
(517, 149, 'José Gregorio Bastidas'),
(518, 149, 'La Piedad'),
(519, 150, 'Sarare'),
(520, 150, 'Buría'),
(521, 150, 'Gustavo Vegas León'),
(522, 151, 'Carora'),
(523, 151, 'Camacaro'),
(524, 151, 'Espinoza de los Monteros'),
(525, 152, 'Siquisique'),
(526, 152, 'Moroturo'),
(527, 152, 'San Miguel'),
(528, 153, 'El Vigía'),
(529, 153, 'Presidente Betancourt'),
(530, 153, 'Presidente Páez'),
(531, 154, 'La Azulita'),
(532, 154, 'Santiago de la Punta'),
(533, 154, 'San Rafael de Tabay'),
(534, 155, 'Santa Cruz de Mora'),
(535, 155, 'Mesa de Las Palmas'),
(536, 155, 'San Pedro del Lagunillas'),
(537, 156, 'Aricagua'),
(538, 156, 'San Pablo'),
(539, 156, 'Guaraque'),
(540, 157, 'Canaguá'),
(541, 157, 'Mucutuy'),
(542, 157, 'Quino'),
(543, 158, 'Ejido'),
(544, 158, 'Fernández Peña'),
(545, 158, 'Matriz'),
(546, 159, 'Tucaní'),
(547, 159, 'Florencio Ramírez'),
(548, 159, 'Tovar'),
(549, 160, 'Santo Domingo'),
(550, 160, 'Las Piedras'),
(551, 160, 'Mesa de Quintero'),
(552, 161, 'Guaraque'),
(553, 161, 'Mesa de Quintero'),
(554, 161, 'Río Negro'),
(555, 162, 'Arapuey'),
(556, 162, 'San Rafael de Onoto'),
(557, 162, 'Palmarito'),
(558, 163, 'Torondoy'),
(559, 163, 'Santa Elena de Arenales'),
(560, 163, 'Río Chiquito'),
(561, 164, 'El Llano'),
(562, 164, 'Gonzalo Picón Febres'),
(563, 164, 'Caracciolo Parra Pérez'),
(564, 165, 'Timotes'),
(565, 165, 'La Mesa de Esnujaque'),
(566, 165, 'Mocotíes'),
(567, 166, 'Santa Elena de Arenales'),
(568, 166, 'Eloy Paredes'),
(569, 166, 'San Rafael de Alcántara'),
(570, 167, 'Santa María de Caparo'),
(571, 167, 'Mesa de Las Palmas'),
(572, 167, 'Pueblo Llano'),
(573, 168, 'Pueblo Llano'),
(574, 168, 'Mesa de Quintero'),
(575, 168, 'Chiguará'),
(576, 169, 'Mucuchíes'),
(577, 169, 'San Rafael'),
(578, 169, 'Gavidia'),
(579, 170, 'Bailadores'),
(580, 170, 'Mariño'),
(581, 170, 'La Playa'),
(582, 171, 'Tabay'),
(583, 171, 'La Venta'),
(584, 171, 'El Molino'),
(585, 172, 'Lagunillas'),
(586, 172, 'Chiguará'),
(587, 172, 'San Juan'),
(588, 173, 'Tovar'),
(589, 173, 'El Amparo'),
(590, 173, 'San Francisco'),
(591, 174, 'Nueva Bolivia'),
(592, 174, 'Independencia'),
(593, 174, 'Santa Apolonia'),
(594, 175, 'Zea'),
(595, 175, 'Caño Tigre'),
(596, 175, 'El Amparo'),
(597, 176, 'Caucagua'),
(598, 176, 'Aragüita'),
(599, 176, 'Arévalo González'),
(600, 177, 'San José de Barlovento'),
(601, 177, 'Cumbo'),
(602, 177, 'Panaquire'),
(603, 178, 'Baruta'),
(604, 178, 'El Cafetal'),
(605, 178, 'Las Minas de Baruta'),
(606, 179, 'Higuerote'),
(607, 179, 'Curiepe'),
(608, 179, 'Tacarigua de Mamporal'),
(609, 180, 'Mamporal'),
(610, 180, 'El Pao'),
(611, 180, 'San Juan de Guatire'),
(612, 181, 'Carrizal'),
(613, 181, 'Los Teques'),
(614, 181, 'El Volcancito'),
(615, 182, 'Chacao'),
(616, 182, 'Altamira'),
(617, 182, 'El Rosal'),
(618, 183, 'Charallave'),
(619, 183, 'Las Brisas'),
(620, 183, 'La Democracia'),
(621, 184, 'El Hatillo'),
(622, 184, 'La Lagunita'),
(623, 184, 'La Unión'),
(624, 185, 'Los Teques'),
(625, 185, 'Altagracia de la Montaña'),
(626, 185, 'San Pedro'),
(627, 186, 'Santa Teresa del Tuy'),
(628, 186, 'El Cartanal'),
(629, 186, 'Las Rosas'),
(630, 187, 'Ocumare del Tuy'),
(631, 187, 'La Democracia'),
(632, 187, 'Santa Bárbara'),
(633, 188, 'San Antonio de los Altos'),
(634, 188, 'La Rosaleda'),
(635, 188, 'Los Salías'),
(636, 189, 'Río Chico'),
(637, 189, 'El Guapo'),
(638, 189, 'Tacarigua de la Laguna'),
(639, 190, 'Santa Lucía'),
(640, 190, 'Santa Teresa'),
(641, 190, 'La Democracia'),
(642, 191, 'Cúpira'),
(643, 191, 'Machurucuto'),
(644, 191, 'El Guapo'),
(645, 192, 'Guarenas'),
(646, 192, 'Ojo de Agua'),
(647, 192, 'Guairita'),
(648, 193, 'San Francisco de Yare'),
(649, 193, 'El Tigre'),
(650, 193, 'San Antonio'),
(651, 194, 'Petare'),
(652, 194, 'Leoncio Martínez'),
(653, 194, 'Caucagüita'),
(654, 195, 'Cúa'),
(655, 195, 'Nueva Cúa'),
(656, 195, 'San Casimiro'),
(657, 196, 'Guatire'),
(658, 196, 'Bolívar'),
(659, 196, 'Araira'),
(660, 197, 'San Antonio de Capayacuar'),
(661, 197, 'Taguaya'),
(662, 197, 'Areo'),
(663, 198, 'Aguasay'),
(664, 198, 'El Tejero'),
(665, 198, 'Las Piedras de Punceres'),
(666, 199, 'Caripito'),
(667, 199, 'San Antonio'),
(668, 199, 'El Furrial'),
(669, 200, 'Caripe'),
(670, 200, 'Teresén'),
(671, 200, 'La Guanota'),
(672, 201, 'Caicara'),
(673, 201, 'Areo'),
(674, 201, 'El Tigre'),
(675, 202, 'Punta de Mata'),
(676, 202, 'El Tejero'),
(677, 202, 'San Isidro'),
(678, 203, 'Temblador'),
(679, 203, 'Chaguaramal'),
(680, 203, 'Tabasca'),
(681, 204, 'Alto de Los Godos'),
(682, 204, 'Boquerón'),
(683, 204, 'Cachipo'),
(684, 205, 'Aragua de Maturín'),
(685, 205, 'Aparicio'),
(686, 205, 'Chaguaramal'),
(687, 206, 'Quiriquire'),
(688, 206, 'Punceres'),
(689, 206, 'San Félix'),
(690, 207, 'Santa Bárbara'),
(691, 207, 'La Mata'),
(692, 207, 'Punta de Mata'),
(693, 208, 'Barrancas del Orinoco'),
(694, 208, 'Los Barrancos de Fajardo'),
(695, 208, 'San Rafael de Barrancas'),
(696, 209, 'Uracoa'),
(697, 209, 'San Vicente'),
(698, 209, 'Temblador'),
(699, 210, 'La Plaza de Paraguachí'),
(700, 210, 'El Salado'),
(701, 210, 'La Ponderosa'),
(702, 211, 'La Asunción'),
(703, 211, 'El Coquito'),
(704, 211, 'Guacuco'),
(705, 212, 'San Juan Bautista'),
(706, 212, 'Fuentidueño'),
(707, 212, 'Vicente Fuentes'),
(708, 213, 'El Valle del Espíritu Santo'),
(709, 213, 'Francisco Fajardo'),
(710, 213, 'San Antonio'),
(711, 214, 'Santa Ana'),
(712, 214, 'Vicente Fuentes'),
(713, 214, 'Altagracia'),
(714, 215, 'Pampatar'),
(715, 215, 'Aguirre'),
(716, 215, 'Juangriego'),
(717, 216, 'Juan Griego'),
(718, 216, 'Las Piedras de Punceres'),
(719, 216, 'San Juan Bautista'),
(720, 217, 'Porlamar'),
(721, 217, 'Boquerón'),
(722, 217, 'Los Robles'),
(723, 218, 'Boca del Río'),
(724, 218, 'San Francisco de Macanao'),
(725, 218, 'El Mangle'),
(726, 219, 'Punta de Piedras'),
(727, 219, 'Los Robles'),
(728, 219, 'San Pedro de Coche'),
(729, 220, 'San Pedro de Coche'),
(730, 220, 'El Poblado'),
(731, 220, 'Sabaneta'),
(732, 221, 'Agua Blanca'),
(733, 221, 'La Encrucijada'),
(734, 221, 'El Regalo'),
(735, 222, 'Araure'),
(736, 222, 'Río Acarigua'),
(737, 222, 'Mesa de Cavaca'),
(738, 223, 'Píritu'),
(739, 223, 'Uveral'),
(740, 223, 'La Aparición'),
(741, 224, 'Guanare'),
(742, 224, 'Córdoba'),
(743, 224, 'San José de la Montaña'),
(744, 225, 'Guanarito'),
(745, 225, 'Divina Pastora'),
(746, 225, 'San Juan'),
(747, 226, 'Peña Blanca'),
(748, 226, 'Paraíso de Chabasquén'),
(749, 226, 'Chabasquén'),
(750, 227, 'Ospino'),
(751, 227, 'La Aparición'),
(752, 227, 'Santa Lucía'),
(753, 228, 'Acarigua'),
(754, 228, 'Payara'),
(755, 228, 'La Encrucijada'),
(756, 229, 'Papelón'),
(757, 229, 'Caño Delgadito'),
(758, 229, 'Píritu'),
(759, 230, 'Boconoíto'),
(760, 230, 'San Genaro'),
(761, 230, 'Antolín del Campo'),
(762, 231, 'San Rafael de Onoto'),
(763, 231, 'Santa Cruz'),
(764, 231, 'La Montaña'),
(765, 232, 'El Playón'),
(766, 232, 'Santa Rosalía'),
(767, 232, 'La Montaña'),
(768, 233, 'Biscucuy'),
(769, 233, 'San Rafael de Palo Santo'),
(770, 233, 'Guanarito'),
(771, 234, 'Villa Bruzual'),
(772, 234, 'Canaguá'),
(773, 234, 'Santa Cruz de Guacas'),
(774, 235, 'Casanay'),
(775, 235, 'El Paují'),
(776, 235, 'Santa Rosa'),
(777, 236, 'San José de Aerocuar'),
(778, 236, 'San Agustín'),
(779, 236, 'El Rincón'),
(780, 237, 'Río Caribe'),
(781, 237, 'San Juan'),
(782, 237, 'Andrés Eloy Blanco'),
(783, 238, 'El Pilar'),
(784, 238, 'Benítez'),
(785, 238, 'Tunapuy'),
(786, 239, 'Carúpano'),
(787, 239, 'Santa Catalina'),
(788, 239, 'Santa Inés'),
(789, 240, 'Marigüitar'),
(790, 240, 'San Antonio del Golfo'),
(791, 240, 'Andrés Eloy Blanco'),
(792, 241, 'Yaguaraparo'),
(793, 241, 'Libertad'),
(794, 241, 'El Paují'),
(795, 242, 'Araya'),
(796, 242, 'Manicuare'),
(797, 242, 'San Pedro del Río'),
(798, 243, 'Tunapuy'),
(799, 243, 'San Rafael de Tunapuy'),
(800, 243, 'Santa Inés'),
(801, 244, 'Irapa'),
(802, 244, 'San Antonio de Irapa'),
(803, 244, 'Los Pozos'),
(804, 245, 'San Antonio del Golfo'),
(805, 245, 'El Rincón'),
(806, 245, 'Santa Fe'),
(807, 246, 'Cumanacoa'),
(808, 246, 'San Lorenzo'),
(809, 246, 'Cocollar'),
(810, 247, 'Cariaco'),
(811, 247, 'Catuaro'),
(812, 247, 'Santa Inés'),
(813, 248, 'Ayacucho'),
(814, 248, 'Marigüitar'),
(815, 248, 'San Juan'),
(816, 249, 'Güiria'),
(817, 249, 'Cristóbal Colón'),
(818, 249, 'Bideau'),
(819, 250, 'Cordero'),
(820, 250, 'José María Vargas'),
(821, 250, 'Palo Grande'),
(822, 251, 'Las Mesas'),
(823, 251, 'El Cobre'),
(824, 251, 'Umuquena'),
(825, 252, 'Colón'),
(826, 252, 'Rivas Dávila'),
(827, 252, 'San Pedro del Río'),
(828, 253, 'San Antonio del Táchira'),
(829, 253, 'Ureña'),
(830, 253, 'Pata de Gallo'),
(831, 254, 'Táriba'),
(832, 254, 'Cutufí'),
(833, 254, 'San Rafael de El Piñal'),
(834, 255, 'San Rafael del Piñal'),
(835, 255, 'La Ceiba'),
(836, 255, 'Torbes'),
(837, 256, 'San Rafael del Piñal'),
(838, 256, 'Santo Domingo'),
(839, 256, 'Chorro de Indio'),
(840, 257, 'San José de Bolívar'),
(841, 257, 'Chorro de Indio'),
(842, 257, 'Señor de la Misericordia'),
(843, 258, 'La Fría'),
(844, 258, 'Panamericano'),
(845, 258, 'Boca de Grita'),
(846, 259, 'Palmira'),
(847, 259, 'Palmira Arriba'),
(848, 259, 'Palmira Abajo'),
(849, 260, 'Capacho Nuevo'),
(850, 260, 'Capacho Viejo'),
(851, 260, 'San Cristóbal'),
(852, 261, 'La Grita'),
(853, 261, 'El Cobre'),
(854, 261, 'Señor de la Misericordia'),
(855, 262, 'El Cobre'),
(856, 262, 'La Tendida'),
(857, 262, 'Rivas Dávila'),
(858, 263, 'Rubio'),
(859, 263, 'Bramón'),
(860, 263, 'Rivas Dávila'),
(861, 264, 'Capacho Viejo'),
(862, 264, 'Independencia'),
(863, 264, 'San Antonio del Táchira'),
(864, 265, 'Abejales'),
(865, 265, 'La Laguna'),
(866, 265, 'Capacho Viejo'),
(867, 266, 'Lobatera'),
(868, 266, 'Borotá'),
(869, 266, 'San Juan de Lobatera'),
(870, 267, 'Michelena'),
(871, 267, 'Señor de la Misericordia'),
(872, 267, 'El Cobre'),
(873, 268, 'Colón'),
(874, 268, 'La Tendida'),
(875, 268, 'El Cobre'),
(876, 269, 'Ureña'),
(877, 269, 'San Pedro del Río'),
(878, 269, 'Las Delicias'),
(879, 270, 'Delicias'),
(880, 270, 'San Antonio del Táchira'),
(881, 270, 'Ureña'),
(882, 271, 'La Tendida'),
(883, 271, 'Boca de Grita'),
(884, 271, 'El Pinal'),
(885, 272, 'San Cristóbal'),
(886, 272, 'La Concordia'),
(887, 272, 'Pedro María Morantes'),
(888, 273, 'Umuquena'),
(889, 273, 'Las Mesas'),
(890, 273, 'El Cobre'),
(891, 274, 'Seboruco'),
(892, 274, 'La Tendida'),
(893, 274, 'La Grita'),
(894, 275, 'San Simón'),
(895, 275, 'Ureña'),
(896, 275, 'Seboruco'),
(897, 276, 'Queniquea'),
(898, 276, 'San Pablo'),
(899, 276, 'Bramón'),
(900, 277, 'San Josecito'),
(901, 277, 'El Corozo'),
(902, 277, 'San Cristóbal'),
(903, 278, 'Pregonero'),
(904, 278, 'Cárdenas'),
(905, 278, 'San Josecito'),
(906, 279, 'Santa Isabel'),
(907, 279, 'Aragua'),
(908, 279, 'San Rafael de Onoto'),
(909, 280, 'Boconó'),
(910, 280, 'Boconó Arriba'),
(911, 280, 'San Miguel'),
(912, 281, 'Sabana Grande'),
(913, 281, 'Sabana de Mendoza'),
(914, 281, 'Valera'),
(915, 282, 'Chejendé'),
(916, 282, 'Candelaria'),
(917, 282, 'Arnoldo Gabaldón'),
(918, 283, 'Carache'),
(919, 283, 'Cuicas'),
(920, 283, 'La Concepción'),
(921, 284, 'Escuque'),
(922, 284, 'La Unión'),
(923, 284, 'Santa Rita'),
(924, 285, 'El Paradero'),
(925, 285, 'Las Mesitas'),
(926, 285, 'Carrillo'),
(927, 286, 'Campo Elías'),
(928, 286, 'Campo Elías Arriba'),
(929, 286, 'La Ceiba'),
(930, 287, 'Santa Apolonia'),
(931, 287, 'El Amparo'),
(932, 287, 'Pampanito'),
(933, 288, 'El Silencio'),
(934, 288, 'Aguas Calientes'),
(935, 288, 'El Corozo'),
(936, 289, 'Monte Carmelo'),
(937, 289, 'San Rafael de Carvajal'),
(938, 289, 'Pampán'),
(939, 290, 'Motatán'),
(940, 290, 'El Baño'),
(941, 290, 'Jajo'),
(942, 291, 'Pampán'),
(943, 291, 'Santa Ana'),
(944, 291, 'La Paz'),
(945, 292, 'Pampanito'),
(946, 292, 'Flor de Patria'),
(947, 292, 'La Concepción'),
(948, 293, 'Betijoque'),
(949, 293, 'José Gregorio Hernández'),
(950, 293, 'La Puebla'),
(951, 294, 'San Rafael de Carvajal'),
(952, 294, 'Campo Alegre'),
(953, 294, 'La Ceiba'),
(954, 295, 'Sabana de Mendoza'),
(955, 295, 'Jajó'),
(956, 295, 'Montecarmelo'),
(957, 296, 'Trujillo'),
(958, 296, 'Cristóbal Mendoza'),
(959, 296, 'Matriz'),
(960, 297, 'La Quebrada'),
(961, 297, 'Jajó'),
(962, 297, 'Santiago'),
(963, 298, 'Valera'),
(964, 298, 'San Luis'),
(965, 298, 'La Beatriz'),
(966, 299, 'Caraballeda'),
(967, 299, 'Carayaca'),
(968, 299, 'Naiguatá'),
(969, 300, 'San Pablo'),
(970, 300, 'Las Minas'),
(971, 300, 'La Montaña'),
(972, 301, 'Aroa'),
(973, 301, 'Farriar'),
(974, 301, 'Albarico'),
(975, 302, 'Chivacoa'),
(976, 302, 'Camburito'),
(977, 302, 'Urachiche'),
(978, 303, 'Cocorote'),
(979, 303, 'Albarico'),
(980, 303, 'La Trinchera'),
(981, 304, 'Independencia'),
(982, 304, 'San Pablo'),
(983, 304, 'Salom'),
(984, 305, 'Sabana de Parra'),
(985, 305, 'Yumare'),
(986, 305, 'San Pablo'),
(987, 306, 'Boraure'),
(988, 306, 'San Felipe'),
(989, 306, 'La Trinidad'),
(990, 307, 'Yumare'),
(991, 307, 'Guama'),
(992, 307, 'Urachiche'),
(993, 308, 'Nirgua'),
(994, 308, 'Salom'),
(995, 308, 'Temerla'),
(996, 309, 'Yaritagua'),
(997, 309, 'San Andrés'),
(998, 309, 'El Peñón'),
(999, 310, 'San Felipe'),
(1000, 310, 'Cocorote'),
(1001, 310, 'Albarico'),
(1002, 311, 'Guama'),
(1003, 311, 'Sabana de Parra'),
(1004, 311, 'San Felipe'),
(1005, 312, 'Urachiche'),
(1006, 312, 'Sucre'),
(1007, 312, 'José Antonio Páez'),
(1008, 313, 'San Pablo'),
(1009, 313, 'El Chino'),
(1010, 313, 'El Guayabo'),
(1011, 314, 'Isla de Toas'),
(1012, 314, 'Isla de Zapara'),
(1013, 314, 'Monagas'),
(1014, 315, 'San Timoteo'),
(1015, 315, 'Libertad'),
(1016, 315, 'Mene Grande'),
(1017, 316, 'Cabimas'),
(1018, 316, 'Ambrosio'),
(1019, 316, 'Carmen Herrera'),
(1020, 317, 'Encontrados'),
(1021, 317, 'Udón Pérez'),
(1022, 317, 'Chiquinquirá'),
(1023, 318, 'San Carlos del Zulia'),
(1024, 318, 'Santa Cruz del Zulia'),
(1025, 318, 'San Rafael'),
(1026, 319, 'Pueblo Nuevo'),
(1027, 319, 'El Chivo'),
(1028, 319, 'El Guayabo'),
(1029, 320, 'La Concepción'),
(1030, 320, 'San Isidro'),
(1031, 320, 'José Ramón Yépez'),
(1032, 321, 'Casigua-El Cubo'),
(1033, 321, 'Maracaibo'),
(1034, 321, 'Jesús María Semprún'),
(1035, 322, 'Concepción'),
(1036, 322, 'San José'),
(1037, 322, 'El Carmelo'),
(1038, 323, 'Ciudad Ojeda'),
(1039, 323, 'Alonso de Ojeda'),
(1040, 323, 'Eleazar López Contreras'),
(1041, 324, 'Libertad'),
(1042, 324, 'San José'),
(1043, 324, 'Rio Negro'),
(1044, 325, 'San Rafael'),
(1045, 325, 'La Sierrita'),
(1046, 325, 'Luis de Vicente'),
(1047, 326, 'Cacique Mara'),
(1048, 326, 'Chiquinquirá'),
(1049, 326, 'Coquivacoa'),
(1050, 327, 'Altagracia'),
(1051, 327, 'Ana María Campos'),
(1052, 327, 'San Antonio'),
(1053, 328, 'Sinamaica'),
(1054, 328, 'Alta Guajira'),
(1055, 328, 'Guajira'),
(1056, 329, 'Rosario'),
(1057, 329, 'Sixto Zambrano'),
(1058, 329, 'Maracaibo'),
(1059, 330, 'San Francisco'),
(1060, 330, 'Francisco Ochoa'),
(1061, 330, 'Maracaibo'),
(1062, 331, 'Santa Rita'),
(1063, 331, 'José Cenobio Urribarrí'),
(1064, 331, 'El Mene'),
(1065, 332, 'Tía Juana'),
(1066, 332, 'Manuel Manrique'),
(1067, 332, 'Maracaibo'),
(1068, 333, 'Bobures'),
(1069, 333, 'Gibraltar'),
(1070, 333, 'Maracaibo'),
(1071, 334, 'Bachaquero'),
(1072, 334, 'La Pica'),
(1073, 334, 'El Toco'),
(1074, 335, 'Altagracia'),
(1075, 335, 'Antímano'),
(1076, 335, 'El Recreo'),
(1077, 1, '...'),
(1078, 2, 'Alto Orinoco'),
(1079, 2, 'Mavaca'),
(1080, 2, 'Sierra Parima'),
(1081, 3, 'Atabapo'),
(1082, 3, 'Ucata'),
(1083, 3, 'Yapacana'),
(1084, 4, 'Fernando Girón Tovar'),
(1085, 4, 'Patanemo'),
(1086, 4, 'San Juan de Manapiare'),
(1087, 5, 'Autana'),
(1088, 5, 'Munduapo'),
(1089, 5, 'Samariapo'),
(1090, 6, 'Alto Ventuari'),
(1091, 6, 'Manapiare'),
(1092, 6, 'San Juan de Manapiare'),
(1093, 7, 'Maroa'),
(1094, 7, 'Comunidad de Maroa'),
(1095, 7, 'San Carlos de Río Negro'),
(1096, 8, 'Río Negro'),
(1097, 8, 'Solano'),
(1098, 8, 'San Carlos de Río Negro'),
(1099, 9, 'Anaco'),
(1100, 9, 'Buena Vista'),
(1101, 9, 'San Joaquín'),
(1102, 10, 'Aragua de Barcelona'),
(1103, 10, 'Cachipo'),
(1104, 10, 'Santa Rosa'),
(1105, 11, 'Lechería'),
(1106, 11, 'El Morro'),
(1107, 11, 'Santa Rosa'),
(1108, 12, 'Puerto Píritu'),
(1109, 12, 'San Miguel'),
(1110, 12, 'Sucre'),
(1111, 13, 'Valle de Guanape'),
(1112, 13, 'Santa Bárbara'),
(1113, 13, 'San Luis de Guanape'),
(1114, 14, 'Pariaguán'),
(1115, 14, 'Atapirire'),
(1116, 14, 'El Pao de Barcelona'),
(1117, 15, 'Guanta'),
(1118, 15, 'Chorrerón'),
(1119, 15, 'Cumanacoa'),
(1120, 16, 'Soledad'),
(1121, 16, 'Mamo'),
(1122, 16, 'Aguasay'),
(1123, 17, 'Mapire'),
(1124, 17, 'Piar'),
(1125, 17, 'San Diego de Cabrutica'),
(1126, 18, 'Puerto La Cruz'),
(1127, 18, 'Pozuelos'),
(1128, 18, 'Guaraguao'),
(1129, 19, 'Onoto'),
(1130, 19, 'San Pablo'),
(1131, 19, 'La Trinchera'),
(1132, 20, 'San Mateo'),
(1133, 20, 'Lechería'),
(1134, 20, 'El Carito'),
(1135, 21, 'Clarines'),
(1136, 21, 'Guanape'),
(1137, 21, 'Sabana de Uchire'),
(1138, 22, 'Cantaura'),
(1139, 22, 'Libertador'),
(1140, 22, 'Santa Rosa'),
(1141, 23, 'Píritu'),
(1142, 23, 'San Francisco de Píritu'),
(1143, 23, 'El Tigrito'),
(1144, 24, 'San José de Guanipa'),
(1145, 24, 'El Tigre'),
(1146, 24, 'Cantaura'),
(1147, 25, 'Boca de Uchire'),
(1148, 25, 'Chacual'),
(1149, 25, 'La Montaña'),
(1150, 26, 'Santa Ana'),
(1151, 26, 'La Encrucijada'),
(1152, 26, 'San Juan'),
(1153, 27, 'El Carmen'),
(1154, 27, 'San Cristóbal'),
(1155, 27, 'Bergantín'),
(1156, 28, 'Edmundo Barrios'),
(1157, 28, 'El Tigre'),
(1158, 28, 'Puerto Ordaz'),
(1159, 29, 'Achaguas'),
(1160, 29, 'Guarico'),
(1161, 29, 'Mantecal'),
(1162, 30, 'Biruaca'),
(1163, 30, 'San Juan de Payara'),
(1164, 30, 'El Yagual'),
(1165, 31, 'Muñoz'),
(1166, 31, 'Bruzual'),
(1167, 31, 'Elorza'),
(1168, 32, 'Guasdualito'),
(1169, 32, 'Aramendi'),
(1170, 32, 'El Amparo'),
(1171, 33, 'San Juan de Payara'),
(1172, 33, 'La Trinidad de Orichuna'),
(1173, 33, 'Mata de Caña'),
(1174, 34, 'Elorza'),
(1175, 34, 'El Viento'),
(1176, 34, 'Guachara'),
(1177, 35, 'San Fernando'),
(1178, 35, 'El Recreo'),
(1179, 35, 'San Rafael de Atamaica'),
(1180, 36, 'San Mateo'),
(1181, 36, 'El Consejo'),
(1182, 36, 'Augusto Mijares'),
(1183, 37, 'Camatagua'),
(1184, 37, 'Carmen de Cura'),
(1185, 37, 'Urdaneta'),
(1186, 38, 'Santa Rita'),
(1187, 38, 'Francisco de Miranda'),
(1188, 38, 'Monseñor Feliciano González'),
(1189, 39, 'Choroní'),
(1190, 39, 'El Limón'),
(1191, 39, 'Las Delicias'),
(1192, 40, 'Santa Cruz'),
(1193, 40, 'La Pica'),
(1194, 40, 'Chuao'),
(1195, 41, 'La Victoria'),
(1196, 41, 'Castor Nieves Ríos'),
(1197, 41, 'Las Mercedes'),
(1198, 42, 'El Consejo'),
(1199, 42, 'San Pablo'),
(1200, 42, 'Punta Brava'),
(1201, 43, 'Palo Negro'),
(1202, 43, 'San Martín de Porres'),
(1203, 43, 'Santa Inés'),
(1204, 44, 'El Limón'),
(1205, 44, 'Caña de Azúcar'),
(1206, 44, 'La Victoria'),
(1207, 45, 'Ocumare de la Costa'),
(1208, 45, 'El Limón'),
(1209, 45, 'Cata'),
(1210, 46, 'San Casimiro'),
(1211, 46, 'Guiripa'),
(1212, 46, 'Valle Morín'),
(1213, 47, 'San Sebastián'),
(1214, 47, 'Guayabal'),
(1215, 47, 'Quiroz'),
(1216, 48, 'Turmero'),
(1217, 48, 'Arevalo Aponte'),
(1218, 48, 'Chuao'),
(1219, 49, 'Las Tejerías'),
(1220, 49, 'Tiara'),
(1221, 49, 'La Victoria'),
(1222, 50, 'Cagua'),
(1223, 50, 'Bella Vista'),
(1224, 50, 'Chuao'),
(1225, 51, 'Colonia Tovar'),
(1226, 51, 'El Cedral'),
(1227, 51, 'La Montaña'),
(1228, 52, 'Barbacoas'),
(1229, 52, 'Las Peñitas'),
(1230, 52, 'San Casimiro'),
(1231, 53, 'Villa de Cura'),
(1232, 53, 'Magdaleno'),
(1233, 53, 'San Francisco de Asís'),
(1234, 54, 'Sabaneta'),
(1235, 54, 'Rodríguez Domínguez'),
(1236, 54, 'Barinas'),
(1237, 55, 'El Cantón'),
(1238, 55, 'Santa Cruz de Guacas'),
(1239, 55, 'Puerto Vivas'),
(1240, 56, 'Socopó'),
(1241, 56, 'Ticoporo'),
(1242, 56, 'Nicolás Pulido'),
(1243, 57, 'Arismendi'),
(1244, 57, 'Arismendi de Caicara'),
(1245, 57, 'Chaguaramo'),
(1246, 58, 'Alto Barinas'),
(1247, 58, 'Barinas'),
(1248, 58, 'Corazón de Jesús'),
(1249, 59, 'Barinitas'),
(1250, 59, 'Altamira de Cáceres'),
(1251, 59, 'Calderas'),
(1252, 60, 'Barrancas'),
(1253, 60, 'El Socorro'),
(1254, 60, 'Santa Bárbara'),
(1255, 61, 'Santa Bárbara'),
(1256, 61, 'Pedraza La Vieja'),
(1257, 61, 'Ciudad Bolivia'),
(1258, 62, 'Obispos'),
(1259, 62, 'El Real'),
(1260, 62, 'Los Guasimitos'),
(1261, 63, 'Ciudad Bolivia'),
(1262, 63, 'Iglesia'),
(1263, 63, 'José Ignacio del Pumar'),
(1264, 64, 'Libertad'),
(1265, 64, 'Dolores'),
(1266, 64, 'Palacio Fajardo'),
(1267, 65, 'Ciudad de Nutrias'),
(1268, 65, 'El Regalo'),
(1269, 65, 'Puerto de Nutrias'),
(1270, 66, 'Cachamay'),
(1271, 66, 'Chirica'),
(1272, 66, 'Dalla Costa'),
(1273, 67, 'Caicara del Orinoco'),
(1274, 67, 'Altagracia'),
(1275, 67, 'Ascensión Farreras'),
(1276, 68, 'El Callao'),
(1277, 68, 'El Dorado'),
(1278, 68, 'Tumeremo'),
(1279, 69, 'Santa Elena de Uairén'),
(1280, 69, 'Ikabarú'),
(1281, 69, 'Urimán'),
(1282, 70, 'Catedral'),
(1283, 70, 'Zea'),
(1284, 70, 'Panapana'),
(1285, 71, 'Upata'),
(1286, 71, 'El Pao'),
(1287, 71, 'Andrés Eloy Blanco'),
(1288, 72, 'Ciudad Piar'),
(1289, 72, 'Raúl Leoni'),
(1290, 72, 'La Paragua'),
(1291, 73, 'Guasipati'),
(1292, 73, 'Salto La Llovizna'),
(1293, 73, 'San Isidro'),
(1294, 74, 'Tumeremo'),
(1295, 74, 'Dalla Costa'),
(1296, 74, 'El Dorado'),
(1297, 75, 'Maripa'),
(1298, 75, 'Las Majadas'),
(1299, 75, 'Santa Rosa'),
(1300, 76, 'El Palmar'),
(1301, 76, 'Padre Pedro Chien'),
(1302, 76, 'Santa Cruz'),
(1303, 77, 'Bejuma'),
(1304, 77, 'Canoabo'),
(1305, 77, 'Simón Bolívar'),
(1306, 78, 'Güigüe'),
(1307, 78, 'Belén'),
(1308, 78, 'Tacarigua'),
(1309, 79, 'Mariara'),
(1310, 79, 'Aguas Calientes'),
(1311, 79, 'San Joaquín'),
(1312, 80, 'Guacara'),
(1313, 80, 'Yagua'),
(1314, 80, 'Ciudad Alianza'),
(1315, 81, 'Morón'),
(1316, 81, 'Urama'),
(1317, 81, 'Yaracuy'),
(1318, 82, 'Tocuyito'),
(1319, 82, 'Independencia'),
(1320, 82, 'Los Naranjos'),
(1321, 83, 'Los Guayos'),
(1322, 83, 'Las Vegas'),
(1323, 83, 'Parque Industrial'),
(1324, 84, 'Miranda'),
(1325, 84, 'El Toco'),
(1326, 84, 'La Aguada'),
(1327, 85, 'Montalbán'),
(1328, 85, 'La Yaguara'),
(1329, 85, 'Monseñor Castro'),
(1330, 86, 'Naguanagua'),
(1331, 86, 'La Campiña'),
(1332, 86, 'Mañongo'),
(1333, 87, 'Bartolomé Salom'),
(1334, 87, 'Borburata'),
(1335, 87, 'Fraternidad'),
(1336, 88, 'San Diego'),
(1337, 88, 'Yaracuy'),
(1338, 88, 'La Cumaca'),
(1339, 89, 'San Joaquín'),
(1340, 89, 'Los Palos Grandes'),
(1341, 89, 'La Pradera'),
(1342, 90, 'Candelaria'),
(1343, 90, 'Catedral'),
(1344, 90, 'El Socorro'),
(1345, 91, 'Cojedes'),
(1346, 91, 'El Baúl'),
(1347, 91, 'La Aguadita'),
(1348, 92, 'El Pao'),
(1349, 92, 'Manrique'),
(1350, 92, 'Las Vegas'),
(1351, 93, 'Tinaquillo'),
(1352, 93, 'Macapo'),
(1353, 93, 'La Candelaria'),
(1354, 94, 'El Baúl'),
(1355, 94, 'Sucre'),
(1356, 94, 'El Baúl Abajo'),
(1357, 95, 'Macapo'),
(1358, 95, 'La Aguadita'),
(1359, 95, 'El Limón'),
(1360, 96, 'Libertad'),
(1361, 96, 'Ricaurte'),
(1362, 96, 'Las Vegas'),
(1363, 97, 'Las Vegas'),
(1364, 97, 'El Pao'),
(1365, 97, 'Manrique'),
(1366, 98, 'San Carlos'),
(1367, 98, 'Juan Ángel Bravo'),
(1368, 98, 'Manuel Manrique'),
(1369, 99, 'Tinaco'),
(1370, 99, 'Macapo'),
(1371, 99, 'La Aguadita'),
(1372, 100, 'Curiapo'),
(1373, 100, 'Almirante Luis Brión'),
(1374, 100, 'Manuel Renaud'),
(1375, 101, 'Irapa'),
(1376, 101, 'Manuel Piar'),
(1377, 101, 'Vicente Días'),
(1378, 102, 'Pedernales'),
(1379, 102, 'Guasina'),
(1380, 102, 'Punta Pescador'),
(1381, 103, 'San José'),
(1382, 103, 'San Rafael'),
(1383, 103, 'Tucupita'),
(1384, 104, 'San Juan de los Cayos'),
(1385, 104, 'Capadare'),
(1386, 104, 'La Vela de Coro'),
(1387, 105, 'San Luis'),
(1388, 105, 'La Vela'),
(1389, 105, 'Bolívar'),
(1390, 106, 'Capatárida'),
(1391, 106, 'San José de Seque'),
(1392, 106, 'Zazárida'),
(1393, 107, 'La Vela de Coro'),
(1394, 107, 'Punta Cardón'),
(1395, 107, 'San Luis'),
(1396, 108, 'Carirubana'),
(1397, 108, 'Norte'),
(1398, 108, 'Punta Cardón'),
(1399, 109, 'La Vela de Coro'),
(1400, 109, 'Acurigua'),
(1401, 109, 'Guaibacoa'),
(1402, 110, 'Dabajuro'),
(1403, 110, 'Hato Viejo'),
(1404, 110, 'Urumaco'),
(1405, 111, 'Pedregal'),
(1406, 111, 'Agua Larga'),
(1407, 111, 'Avaria'),
(1408, 112, 'Pueblo Nuevo'),
(1409, 112, 'Adícora'),
(1410, 112, 'Jadacaquiva'),
(1411, 113, 'Churuguara'),
(1412, 113, 'Agua Larga'),
(1413, 113, 'El Paují'),
(1414, 114, 'Jacura'),
(1415, 114, 'Agua Larga'),
(1416, 114, 'Araurima'),
(1417, 115, 'Judibana'),
(1418, 115, 'Los Taques'),
(1419, 115, 'Villa Marina'),
(1420, 116, 'Mene de Mauroa'),
(1421, 116, 'Casigua'),
(1422, 116, 'San Félix'),
(1423, 117, 'Coro'),
(1424, 117, 'Mitare'),
(1425, 117, 'Sabana Larga'),
(1426, 118, 'Chichiriviche'),
(1427, 118, 'Boca de Aroa'),
(1428, 118, 'Tucacas'),
(1429, 119, 'Palmasola'),
(1430, 119, 'El Silencio'),
(1431, 119, 'El Tocuyo'),
(1432, 120, 'Cabure'),
(1433, 120, 'Colina'),
(1434, 120, 'Sabaneta'),
(1435, 121, 'Píritu'),
(1436, 121, 'San José'),
(1437, 121, 'Puerta de Píritu'),
(1438, 122, 'Mirimire'),
(1439, 122, 'El Charal'),
(1440, 122, 'San Francisco'),
(1441, 123, 'Tucacas'),
(1442, 123, 'Boca de Aroa'),
(1443, 123, 'Chichiriviche'),
(1444, 124, 'La Cruz de Taratara'),
(1445, 124, 'Sucre'),
(1446, 124, 'Píritu'),
(1447, 125, 'Tocópero'),
(1448, 125, 'Aragüita'),
(1449, 125, 'Tocuyito'),
(1450, 126, 'Santa Cruz de Bucaral'),
(1451, 126, 'Purureche'),
(1452, 126, 'El Charal'),
(1453, 127, 'Urumaco'),
(1454, 127, 'El Yabal'),
(1455, 127, 'Casigua'),
(1456, 128, 'Puerto Cumarebo'),
(1457, 128, 'La Ciénaga'),
(1458, 128, 'Pueblo Cumarebo'),
(1459, 129, 'Camaguán'),
(1460, 129, 'Puerto de Nutrias'),
(1461, 129, 'El Rosario'),
(1462, 130, 'Chaguaramas'),
(1463, 130, 'Camatagua'),
(1464, 130, 'La Candelaria'),
(1465, 131, 'El Socorro'),
(1466, 131, 'Tucupido'),
(1467, 131, 'Santa María de Ipire'),
(1468, 132, 'Calabozo'),
(1469, 132, 'El Rastro'),
(1470, 132, 'Tucupido'),
(1471, 133, 'Tucupido'),
(1472, 133, 'San Rafael de Laya'),
(1473, 133, 'Valle de la Pascua'),
(1474, 134, 'Altagracia de Orituco'),
(1475, 134, 'Lezama'),
(1476, 134, 'Paso Real de Macaira'),
(1477, 135, 'San Juan de los Morros'),
(1478, 135, 'Parapara'),
(1479, 135, 'Cantagallo'),
(1480, 136, 'El Sombrero'),
(1481, 136, 'Barbacoas'),
(1482, 136, 'San Francisco de Tiznados'),
(1483, 137, 'Las Mercedes'),
(1484, 137, 'Cazorla'),
(1485, 137, 'Tucupido'),
(1486, 138, 'Valle de la Pascua'),
(1487, 138, 'Espino'),
(1488, 138, 'Santa María de Ipire'),
(1489, 139, 'Zaraza'),
(1490, 139, 'San José de Unare'),
(1491, 139, 'San Juan de los Morros'),
(1492, 140, 'Ortíz'),
(1493, 140, 'San Francisco de Tiznados'),
(1494, 140, 'Guayabal'),
(1495, 141, 'San Gerónimo de Guayabal'),
(1496, 141, 'Camaguán'),
(1497, 141, 'Puerto de Nutrias'),
(1498, 142, 'San José de Guaribe'),
(1499, 142, 'San José'),
(1500, 142, 'Altagracia de Orituco'),
(1501, 143, 'Santa María de Ipire'),
(1502, 143, 'Zaraza'),
(1503, 143, 'Pariaguán'),
(1504, 144, 'Sanare'),
(1505, 144, 'Pío Tamayo'),
(1506, 144, 'Yacambú'),
(1507, 145, 'Duaca'),
(1508, 145, 'Crespo'),
(1509, 145, 'Agua Salada'),
(1510, 146, 'Concepción'),
(1511, 146, 'Aguedo Felipe Alvarado'),
(1512, 146, 'Buena Vista'),
(1513, 147, 'Quíbor'),
(1514, 147, 'Cubiro'),
(1515, 147, 'José Bernardo Dorante'),
(1516, 148, 'El Tocuyo'),
(1517, 148, 'Anzoátegui'),
(1518, 148, 'Guarico'),
(1519, 149, 'Cabudare'),
(1520, 149, 'José Gregorio Bastidas'),
(1521, 149, 'La Piedad'),
(1522, 150, 'Sarare'),
(1523, 150, 'Buría'),
(1524, 150, 'Gustavo Vegas León'),
(1525, 151, 'Carora'),
(1526, 151, 'Camacaro'),
(1527, 151, 'Espinoza de los Monteros'),
(1528, 152, 'Siquisique'),
(1529, 152, 'Moroturo'),
(1530, 152, 'San Miguel'),
(1531, 153, 'El Vigía'),
(1532, 153, 'Presidente Betancourt'),
(1533, 153, 'Presidente Páez'),
(1534, 154, 'La Azulita'),
(1535, 154, 'Santiago de la Punta'),
(1536, 154, 'San Rafael de Tabay'),
(1537, 155, 'Santa Cruz de Mora'),
(1538, 155, 'Mesa de Las Palmas'),
(1539, 155, 'San Pedro del Lagunillas'),
(1540, 156, 'Aricagua'),
(1541, 156, 'San Pablo'),
(1542, 156, 'Guaraque'),
(1543, 157, 'Canaguá'),
(1544, 157, 'Mucutuy'),
(1545, 157, 'Quino'),
(1546, 158, 'Ejido'),
(1547, 158, 'Fernández Peña'),
(1548, 158, 'Matriz'),
(1549, 159, 'Tucaní'),
(1550, 159, 'Florencio Ramírez'),
(1551, 159, 'Tovar'),
(1552, 160, 'Santo Domingo'),
(1553, 160, 'Las Piedras'),
(1554, 160, 'Mesa de Quintero'),
(1555, 161, 'Guaraque'),
(1556, 161, 'Mesa de Quintero'),
(1557, 161, 'Río Negro'),
(1558, 162, 'Arapuey'),
(1559, 162, 'San Rafael de Onoto'),
(1560, 162, 'Palmarito'),
(1561, 163, 'Torondoy'),
(1562, 163, 'Santa Elena de Arenales'),
(1563, 163, 'Río Chiquito'),
(1564, 164, 'El Llano'),
(1565, 164, 'Gonzalo Picón Febres'),
(1566, 164, 'Caracciolo Parra Pérez'),
(1567, 165, 'Timotes'),
(1568, 165, 'La Mesa de Esnujaque'),
(1569, 165, 'Mocotíes'),
(1570, 166, 'Santa Elena de Arenales'),
(1571, 166, 'Eloy Paredes'),
(1572, 166, 'San Rafael de Alcántara'),
(1573, 167, 'Santa María de Caparo'),
(1574, 167, 'Mesa de Las Palmas'),
(1575, 167, 'Pueblo Llano'),
(1576, 168, 'Pueblo Llano'),
(1577, 168, 'Mesa de Quintero'),
(1578, 168, 'Chiguará'),
(1579, 169, 'Mucuchíes'),
(1580, 169, 'San Rafael'),
(1581, 169, 'Gavidia'),
(1582, 170, 'Bailadores'),
(1583, 170, 'Mariño'),
(1584, 170, 'La Playa'),
(1585, 171, 'Tabay'),
(1586, 171, 'La Venta'),
(1587, 171, 'El Molino'),
(1588, 172, 'Lagunillas'),
(1589, 172, 'Chiguará'),
(1590, 172, 'San Juan'),
(1591, 173, 'Tovar'),
(1592, 173, 'El Amparo'),
(1593, 173, 'San Francisco'),
(1594, 174, 'Nueva Bolivia'),
(1595, 174, 'Independencia'),
(1596, 174, 'Santa Apolonia'),
(1597, 175, 'Zea'),
(1598, 175, 'Caño Tigre'),
(1599, 175, 'El Amparo'),
(1600, 176, 'Caucagua'),
(1601, 176, 'Aragüita'),
(1602, 176, 'Arévalo González'),
(1603, 177, 'San José de Barlovento'),
(1604, 177, 'Cumbo'),
(1605, 177, 'Panaquire'),
(1606, 178, 'Baruta'),
(1607, 178, 'El Cafetal'),
(1608, 178, 'Las Minas de Baruta'),
(1609, 179, 'Higuerote'),
(1610, 179, 'Curiepe'),
(1611, 179, 'Tacarigua de Mamporal'),
(1612, 180, 'Mamporal'),
(1613, 180, 'El Pao'),
(1614, 180, 'San Juan de Guatire'),
(1615, 181, 'Carrizal'),
(1616, 181, 'Los Teques'),
(1617, 181, 'El Volcancito'),
(1618, 182, 'Chacao'),
(1619, 182, 'Altamira'),
(1620, 182, 'El Rosal'),
(1621, 183, 'Charallave'),
(1622, 183, 'Las Brisas'),
(1623, 183, 'La Democracia'),
(1624, 184, 'El Hatillo'),
(1625, 184, 'La Lagunita'),
(1626, 184, 'La Unión'),
(1627, 185, 'Los Teques'),
(1628, 185, 'Altagracia de la Montaña'),
(1629, 185, 'San Pedro'),
(1630, 186, 'Santa Teresa del Tuy'),
(1631, 186, 'El Cartanal'),
(1632, 186, 'Las Rosas'),
(1633, 187, 'Ocumare del Tuy'),
(1634, 187, 'La Democracia'),
(1635, 187, 'Santa Bárbara'),
(1636, 188, 'San Antonio de los Altos'),
(1637, 188, 'La Rosaleda'),
(1638, 188, 'Los Salías'),
(1639, 189, 'Río Chico'),
(1640, 189, 'El Guapo'),
(1641, 189, 'Tacarigua de la Laguna'),
(1642, 190, 'Santa Lucía'),
(1643, 190, 'Santa Teresa'),
(1644, 190, 'La Democracia'),
(1645, 191, 'Cúpira'),
(1646, 191, 'Machurucuto'),
(1647, 191, 'El Guapo'),
(1648, 192, 'Guarenas'),
(1649, 192, 'Ojo de Agua'),
(1650, 192, 'Guairita'),
(1651, 193, 'San Francisco de Yare'),
(1652, 193, 'El Tigre'),
(1653, 193, 'San Antonio'),
(1654, 194, 'Petare'),
(1655, 194, 'Leoncio Martínez'),
(1656, 194, 'Caucagüita'),
(1657, 195, 'Cúa'),
(1658, 195, 'Nueva Cúa'),
(1659, 195, 'San Casimiro'),
(1660, 196, 'Guatire'),
(1661, 196, 'Bolívar'),
(1662, 196, 'Araira'),
(1663, 197, 'San Antonio de Capayacuar'),
(1664, 197, 'Taguaya'),
(1665, 197, 'Areo'),
(1666, 198, 'Aguasay'),
(1667, 198, 'El Tejero'),
(1668, 198, 'Las Piedras de Punceres'),
(1669, 199, 'Caripito'),
(1670, 199, 'San Antonio'),
(1671, 199, 'El Furrial'),
(1672, 200, 'Caripe'),
(1673, 200, 'Teresén'),
(1674, 200, 'La Guanota'),
(1675, 201, 'Caicara'),
(1676, 201, 'Areo'),
(1677, 201, 'El Tigre'),
(1678, 202, 'Punta de Mata'),
(1679, 202, 'El Tejero'),
(1680, 202, 'San Isidro'),
(1681, 203, 'Temblador'),
(1682, 203, 'Chaguaramal'),
(1683, 203, 'Tabasca'),
(1684, 204, 'Alto de Los Godos'),
(1685, 204, 'Boquerón'),
(1686, 204, 'Cachipo'),
(1687, 205, 'Aragua de Maturín'),
(1688, 205, 'Aparicio'),
(1689, 205, 'Chaguaramal'),
(1690, 206, 'Quiriquire'),
(1691, 206, 'Punceres'),
(1692, 206, 'San Félix'),
(1693, 207, 'Santa Bárbara'),
(1694, 207, 'La Mata'),
(1695, 207, 'Punta de Mata'),
(1696, 208, 'Barrancas del Orinoco'),
(1697, 208, 'Los Barrancos de Fajardo'),
(1698, 208, 'San Rafael de Barrancas'),
(1699, 209, 'Uracoa'),
(1700, 209, 'San Vicente'),
(1701, 209, 'Temblador'),
(1702, 210, 'La Plaza de Paraguachí'),
(1703, 210, 'El Salado'),
(1704, 210, 'La Ponderosa'),
(1705, 211, 'La Asunción'),
(1706, 211, 'El Coquito'),
(1707, 211, 'Guacuco'),
(1708, 212, 'San Juan Bautista'),
(1709, 212, 'Fuentidueño'),
(1710, 212, 'Vicente Fuentes'),
(1711, 213, 'El Valle del Espíritu Santo'),
(1712, 213, 'Francisco Fajardo'),
(1713, 213, 'San Antonio'),
(1714, 214, 'Santa Ana'),
(1715, 214, 'Vicente Fuentes'),
(1716, 214, 'Altagracia'),
(1717, 215, 'Pampatar'),
(1718, 215, 'Aguirre'),
(1719, 215, 'Juangriego'),
(1720, 216, 'Juan Griego'),
(1721, 216, 'Las Piedras de Punceres'),
(1722, 216, 'San Juan Bautista'),
(1723, 217, 'Porlamar'),
(1724, 217, 'Boquerón'),
(1725, 217, 'Los Robles'),
(1726, 218, 'Boca del Río'),
(1727, 218, 'San Francisco de Macanao'),
(1728, 218, 'El Mangle'),
(1729, 219, 'Punta de Piedras'),
(1730, 219, 'Los Robles'),
(1731, 219, 'San Pedro de Coche'),
(1732, 220, 'San Pedro de Coche'),
(1733, 220, 'El Poblado'),
(1734, 220, 'Sabaneta'),
(1735, 221, 'Agua Blanca'),
(1736, 221, 'La Encrucijada'),
(1737, 221, 'El Regalo'),
(1738, 222, 'Araure'),
(1739, 222, 'Río Acarigua'),
(1740, 222, 'Mesa de Cavaca'),
(1741, 223, 'Píritu'),
(1742, 223, 'Uveral'),
(1743, 223, 'La Aparición'),
(1744, 224, 'Guanare'),
(1745, 224, 'Córdoba'),
(1746, 224, 'San José de la Montaña'),
(1747, 225, 'Guanarito'),
(1748, 225, 'Divina Pastora'),
(1749, 225, 'San Juan'),
(1750, 226, 'Peña Blanca'),
(1751, 226, 'Paraíso de Chabasquén'),
(1752, 226, 'Chabasquén'),
(1753, 227, 'Ospino'),
(1754, 227, 'La Aparición'),
(1755, 227, 'Santa Lucía'),
(1756, 228, 'Acarigua'),
(1757, 228, 'Payara'),
(1758, 228, 'La Encrucijada'),
(1759, 229, 'Papelón'),
(1760, 229, 'Caño Delgadito'),
(1761, 229, 'Píritu'),
(1762, 230, 'Boconoíto'),
(1763, 230, 'San Genaro'),
(1764, 230, 'Antolín del Campo'),
(1765, 231, 'San Rafael de Onoto'),
(1766, 231, 'Santa Cruz'),
(1767, 231, 'La Montaña'),
(1768, 232, 'El Playón'),
(1769, 232, 'Santa Rosalía'),
(1770, 232, 'La Montaña'),
(1771, 233, 'Biscucuy'),
(1772, 233, 'San Rafael de Palo Santo'),
(1773, 233, 'Guanarito'),
(1774, 234, 'Villa Bruzual'),
(1775, 234, 'Canaguá'),
(1776, 234, 'Santa Cruz de Guacas'),
(1777, 235, 'Casanay'),
(1778, 235, 'El Paují'),
(1779, 235, 'Santa Rosa'),
(1780, 236, 'San José de Aerocuar'),
(1781, 236, 'San Agustín'),
(1782, 236, 'El Rincón'),
(1783, 237, 'Río Caribe'),
(1784, 237, 'San Juan'),
(1785, 237, 'Andrés Eloy Blanco'),
(1786, 238, 'El Pilar'),
(1787, 238, 'Benítez'),
(1788, 238, 'Tunapuy'),
(1789, 239, 'Carúpano'),
(1790, 239, 'Santa Catalina'),
(1791, 239, 'Santa Inés'),
(1792, 240, 'Marigüitar'),
(1793, 240, 'San Antonio del Golfo'),
(1794, 240, 'Andrés Eloy Blanco'),
(1795, 241, 'Yaguaraparo'),
(1796, 241, 'Libertad'),
(1797, 241, 'El Paují'),
(1798, 242, 'Araya'),
(1799, 242, 'Manicuare'),
(1800, 242, 'San Pedro del Río'),
(1801, 243, 'Tunapuy'),
(1802, 243, 'San Rafael de Tunapuy'),
(1803, 243, 'Santa Inés'),
(1804, 244, 'Irapa'),
(1805, 244, 'San Antonio de Irapa'),
(1806, 244, 'Los Pozos'),
(1807, 245, 'San Antonio del Golfo'),
(1808, 245, 'El Rincón'),
(1809, 245, 'Santa Fe'),
(1810, 246, 'Cumanacoa'),
(1811, 246, 'San Lorenzo'),
(1812, 246, 'Cocollar'),
(1813, 247, 'Cariaco'),
(1814, 247, 'Catuaro'),
(1815, 247, 'Santa Inés'),
(1816, 248, 'Ayacucho'),
(1817, 248, 'Marigüitar'),
(1818, 248, 'San Juan'),
(1819, 249, 'Güiria'),
(1820, 249, 'Cristóbal Colón'),
(1821, 249, 'Bideau'),
(1822, 250, 'Cordero'),
(1823, 250, 'José María Vargas'),
(1824, 250, 'Palo Grande'),
(1825, 251, 'Las Mesas'),
(1826, 251, 'El Cobre'),
(1827, 251, 'Umuquena'),
(1828, 252, 'Colón'),
(1829, 252, 'Rivas Dávila'),
(1830, 252, 'San Pedro del Río'),
(1831, 253, 'San Antonio del Táchira'),
(1832, 253, 'Ureña'),
(1833, 253, 'Pata de Gallo'),
(1834, 254, 'Táriba'),
(1835, 254, 'Cutufí'),
(1836, 254, 'San Rafael de El Piñal'),
(1837, 255, 'San Rafael del Piñal'),
(1838, 255, 'La Ceiba'),
(1839, 255, 'Torbes'),
(1840, 256, 'San Rafael del Piñal'),
(1841, 256, 'Santo Domingo'),
(1842, 256, 'Chorro de Indio'),
(1843, 257, 'San José de Bolívar'),
(1844, 257, 'Chorro de Indio'),
(1845, 257, 'Señor de la Misericordia'),
(1846, 258, 'La Fría'),
(1847, 258, 'Panamericano'),
(1848, 258, 'Boca de Grita'),
(1849, 259, 'Palmira'),
(1850, 259, 'Palmira Arriba'),
(1851, 259, 'Palmira Abajo'),
(1852, 260, 'Capacho Nuevo'),
(1853, 260, 'Capacho Viejo'),
(1854, 260, 'San Cristóbal'),
(1855, 261, 'La Grita'),
(1856, 261, 'El Cobre'),
(1857, 261, 'Señor de la Misericordia'),
(1858, 262, 'El Cobre'),
(1859, 262, 'La Tendida'),
(1860, 262, 'Rivas Dávila'),
(1861, 263, 'Rubio'),
(1862, 263, 'Bramón'),
(1863, 263, 'Rivas Dávila'),
(1864, 264, 'Capacho Viejo'),
(1865, 264, 'Independencia'),
(1866, 264, 'San Antonio del Táchira'),
(1867, 265, 'Abejales'),
(1868, 265, 'La Laguna'),
(1869, 265, 'Capacho Viejo'),
(1870, 266, 'Lobatera'),
(1871, 266, 'Borotá'),
(1872, 266, 'San Juan de Lobatera'),
(1873, 267, 'Michelena'),
(1874, 267, 'Señor de la Misericordia'),
(1875, 267, 'El Cobre'),
(1876, 268, 'Colón'),
(1877, 268, 'La Tendida'),
(1878, 268, 'El Cobre'),
(1879, 269, 'Ureña'),
(1880, 269, 'San Pedro del Río'),
(1881, 269, 'Las Delicias'),
(1882, 270, 'Delicias'),
(1883, 270, 'San Antonio del Táchira'),
(1884, 270, 'Ureña'),
(1885, 271, 'La Tendida'),
(1886, 271, 'Boca de Grita'),
(1887, 271, 'El Pinal'),
(1888, 272, 'San Cristóbal'),
(1889, 272, 'La Concordia'),
(1890, 272, 'Pedro María Morantes'),
(1891, 273, 'Umuquena'),
(1892, 273, 'Las Mesas'),
(1893, 273, 'El Cobre'),
(1894, 274, 'Seboruco'),
(1895, 274, 'La Tendida'),
(1896, 274, 'La Grita'),
(1897, 275, 'San Simón'),
(1898, 275, 'Ureña'),
(1899, 275, 'Seboruco'),
(1900, 276, 'Queniquea'),
(1901, 276, 'San Pablo'),
(1902, 276, 'Bramón'),
(1903, 277, 'San Josecito'),
(1904, 277, 'El Corozo'),
(1905, 277, 'San Cristóbal'),
(1906, 278, 'Pregonero'),
(1907, 278, 'Cárdenas'),
(1908, 278, 'San Josecito'),
(1909, 279, 'Santa Isabel'),
(1910, 279, 'Aragua'),
(1911, 279, 'San Rafael de Onoto'),
(1912, 280, 'Boconó'),
(1913, 280, 'Boconó Arriba'),
(1914, 280, 'San Miguel'),
(1915, 281, 'Sabana Grande'),
(1916, 281, 'Sabana de Mendoza'),
(1917, 281, 'Valera'),
(1918, 282, 'Chejendé'),
(1919, 282, 'Candelaria'),
(1920, 282, 'Arnoldo Gabaldón'),
(1921, 283, 'Carache'),
(1922, 283, 'Cuicas'),
(1923, 283, 'La Concepción'),
(1924, 284, 'Escuque'),
(1925, 284, 'La Unión'),
(1926, 284, 'Santa Rita'),
(1927, 285, 'El Paradero'),
(1928, 285, 'Las Mesitas'),
(1929, 285, 'Carrillo'),
(1930, 286, 'Campo Elías'),
(1931, 286, 'Campo Elías Arriba'),
(1932, 286, 'La Ceiba'),
(1933, 287, 'Santa Apolonia'),
(1934, 287, 'El Amparo'),
(1935, 287, 'Pampanito'),
(1936, 288, 'El Silencio'),
(1937, 288, 'Aguas Calientes'),
(1938, 288, 'El Corozo'),
(1939, 289, 'Monte Carmelo'),
(1940, 289, 'San Rafael de Carvajal'),
(1941, 289, 'Pampán'),
(1942, 290, 'Motatán'),
(1943, 290, 'El Baño'),
(1944, 290, 'Jajo'),
(1945, 291, 'Pampán'),
(1946, 291, 'Santa Ana'),
(1947, 291, 'La Paz'),
(1948, 292, 'Pampanito'),
(1949, 292, 'Flor de Patria'),
(1950, 292, 'La Concepción'),
(1951, 293, 'Betijoque'),
(1952, 293, 'José Gregorio Hernández'),
(1953, 293, 'La Puebla'),
(1954, 294, 'San Rafael de Carvajal'),
(1955, 294, 'Campo Alegre'),
(1956, 294, 'La Ceiba'),
(1957, 295, 'Sabana de Mendoza'),
(1958, 295, 'Jajó'),
(1959, 295, 'Montecarmelo'),
(1960, 296, 'Trujillo'),
(1961, 296, 'Cristóbal Mendoza'),
(1962, 296, 'Matriz'),
(1963, 297, 'La Quebrada'),
(1964, 297, 'Jajó'),
(1965, 297, 'Santiago'),
(1966, 298, 'Valera'),
(1967, 298, 'San Luis'),
(1968, 298, 'La Beatriz'),
(1969, 299, 'Caraballeda'),
(1970, 299, 'Carayaca'),
(1971, 299, 'Naiguatá'),
(1972, 300, 'San Pablo'),
(1973, 300, 'Las Minas'),
(1974, 300, 'La Montaña'),
(1975, 301, 'Aroa'),
(1976, 301, 'Farriar'),
(1977, 301, 'Albarico'),
(1978, 302, 'Chivacoa'),
(1979, 302, 'Camburito'),
(1980, 302, 'Urachiche'),
(1981, 303, 'Cocorote'),
(1982, 303, 'Albarico'),
(1983, 303, 'La Trinchera'),
(1984, 304, 'Independencia'),
(1985, 304, 'San Pablo'),
(1986, 304, 'Salom'),
(1987, 305, 'Sabana de Parra'),
(1988, 305, 'Yumare'),
(1989, 305, 'San Pablo'),
(1990, 306, 'Boraure'),
(1991, 306, 'San Felipe'),
(1992, 306, 'La Trinidad'),
(1993, 307, 'Yumare'),
(1994, 307, 'Guama'),
(1995, 307, 'Urachiche'),
(1996, 308, 'Nirgua'),
(1997, 308, 'Salom'),
(1998, 308, 'Temerla'),
(1999, 309, 'Yaritagua'),
(2000, 309, 'San Andrés'),
(2001, 309, 'El Peñón');
INSERT INTO `parroquia` (`id_parroquia`, `id_municipio`, `nombre_parroquia`) VALUES
(2002, 310, 'San Felipe'),
(2003, 310, 'Cocorote'),
(2004, 310, 'Albarico'),
(2005, 311, 'Guama'),
(2006, 311, 'Sabana de Parra'),
(2007, 311, 'San Felipe'),
(2008, 312, 'Urachiche'),
(2009, 312, 'Sucre'),
(2010, 312, 'José Antonio Páez'),
(2011, 313, 'San Pablo'),
(2012, 313, 'El Chino'),
(2013, 313, 'El Guayabo'),
(2014, 314, 'Isla de Toas'),
(2015, 314, 'Isla de Zapara'),
(2016, 314, 'Monagas'),
(2017, 315, 'San Timoteo'),
(2018, 315, 'Libertad'),
(2019, 315, 'Mene Grande'),
(2020, 316, 'Cabimas'),
(2021, 316, 'Ambrosio'),
(2022, 316, 'Carmen Herrera'),
(2023, 317, 'Encontrados'),
(2024, 317, 'Udón Pérez'),
(2025, 317, 'Chiquinquirá'),
(2026, 318, 'San Carlos del Zulia'),
(2027, 318, 'Santa Cruz del Zulia'),
(2028, 318, 'San Rafael'),
(2029, 319, 'Pueblo Nuevo'),
(2030, 319, 'El Chivo'),
(2031, 319, 'El Guayabo'),
(2032, 320, 'La Concepción'),
(2033, 320, 'San Isidro'),
(2034, 320, 'José Ramón Yépez'),
(2035, 321, 'Casigua-El Cubo'),
(2036, 321, 'Maracaibo'),
(2037, 321, 'Jesús María Semprún'),
(2038, 322, 'Concepción'),
(2039, 322, 'San José'),
(2040, 322, 'El Carmelo'),
(2041, 323, 'Ciudad Ojeda'),
(2042, 323, 'Alonso de Ojeda'),
(2043, 323, 'Eleazar López Contreras'),
(2044, 324, 'Libertad'),
(2045, 324, 'San José'),
(2046, 324, 'Rio Negro'),
(2047, 325, 'San Rafael'),
(2048, 325, 'La Sierrita'),
(2049, 325, 'Luis de Vicente'),
(2050, 326, 'Cacique Mara'),
(2051, 326, 'Chiquinquirá'),
(2052, 326, 'Coquivacoa'),
(2053, 327, 'Altagracia'),
(2054, 327, 'Ana María Campos'),
(2055, 327, 'San Antonio'),
(2056, 328, 'Sinamaica'),
(2057, 328, 'Alta Guajira'),
(2058, 328, 'Guajira'),
(2059, 329, 'Rosario'),
(2060, 329, 'Sixto Zambrano'),
(2061, 329, 'Maracaibo'),
(2062, 330, 'San Francisco'),
(2063, 330, 'Francisco Ochoa'),
(2064, 330, 'Maracaibo'),
(2065, 331, 'Santa Rita'),
(2066, 331, 'José Cenobio Urribarrí'),
(2067, 331, 'El Mene'),
(2068, 332, 'Tía Juana'),
(2069, 332, 'Manuel Manrique'),
(2070, 332, 'Maracaibo'),
(2071, 333, 'Bobures'),
(2072, 333, 'Gibraltar'),
(2073, 333, 'Maracaibo'),
(2074, 334, 'Bachaquero'),
(2075, 334, 'La Pica'),
(2076, 334, 'El Toco'),
(2077, 335, 'Altagracia'),
(2078, 335, 'Antímano'),
(2079, 335, 'El Recreo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_escolar`
--

CREATE TABLE `periodo_escolar` (
  `id_periodo_escolar` int(11) NOT NULL,
  `periodo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `periodo_escolar`
--

INSERT INTO `periodo_escolar` (`id_periodo_escolar`, `periodo`) VALUES
(1, '2025-2026');

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

--
-- Volcado de datos para la tabla `prendas`
--

INSERT INTO `prendas` (`id_prenda`, `nombre_prenda`) VALUES
(1, 'Camisa'),
(2, 'Pantalon'),
(3, 'Zapato'),
(4, 'Circunferencia Baquial');

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

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id_seccion`, `nombre_seccion`, `id_nivel`) VALUES
(1, 'Sección A', 1),
(2, 'Sección B', 1),
(3, 'Seccion A', 1);

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
(1, 1, '...'),
(2, 2, 'Centro'),
(3, 2, 'Sierra Parima Norte'),
(4, 3, 'Mavaca Centro'),
(5, 3, 'Comunidad Yutajé'),
(6, 4, 'Sierra Parima Sur'),
(7, 4, 'Comunidad Parima B'),
(8, 5, 'Atabapo Centro'),
(9, 5, 'Río Guainía'),
(10, 6, 'Ucata Norte'),
(11, 6, 'Ucata Sur'),
(12, 7, 'Yapacana Centro'),
(13, 7, 'Comunidad Maroa'),
(14, 8, 'Fernando Girón'),
(15, 8, 'Patanemo Norte'),
(16, 9, 'Patanemo Sur'),
(17, 9, 'Comunidad Coromoto'),
(18, 10, 'San Juan Centro'),
(19, 10, 'Manapiare Sur'),
(20, 11, 'Autana Centro'),
(21, 11, 'Río Sipapo'),
(22, 12, 'Munduapo Este'),
(23, 12, 'Munduapo Oeste'),
(24, 13, 'Samariapo Norte'),
(25, 13, 'Samariapo Sur'),
(26, 14, 'Alto Ventuari'),
(27, 14, 'Comunidad Yavita'),
(28, 15, 'Manapiare Centro'),
(29, 15, 'Comunidad Marueta'),
(30, 16, 'San Juan Norte'),
(31, 16, 'San Juan Sur'),
(32, 17, 'Maroa Centro'),
(33, 17, 'Comunidad Guarinuma'),
(34, 18, 'Comunidad Maroa'),
(35, 18, 'Sector Aeropuerto'),
(36, 19, 'San Carlos Centro'),
(37, 19, 'Río Negro Sur'),
(38, 20, 'Río Negro Centro'),
(39, 20, 'Comunidad Isla Ratón'),
(40, 21, 'Solano Este'),
(41, 21, 'Solano Oeste'),
(42, 22, 'San Carlos Norte'),
(43, 22, 'San Carlos Sur'),
(44, 23, 'Centro'),
(45, 23, 'Buenos Aires'),
(46, 24, 'Buena Vista Norte'),
(47, 24, 'Buena Vista Sur'),
(48, 25, 'San Joaquín Este'),
(49, 25, 'San Joaquín Oeste'),
(50, 26, 'Aragua Centro'),
(51, 26, 'Río Aragua'),
(52, 27, 'Cachipo Norte'),
(53, 27, 'Cachipo Sur'),
(54, 28, 'Santa Rosa Este'),
(55, 28, 'Santa Rosa Oeste'),
(56, 29, 'Lechería Centro'),
(57, 29, 'Playa Colorada'),
(58, 30, 'El Morro Este'),
(59, 30, 'El Morro Oeste'),
(60, 31, 'Santa Rosa Norte'),
(61, 31, 'Santa Rosa Sur'),
(62, 32, 'Puerto Píritu Norte'),
(63, 32, 'Puerto Píritu Sur'),
(64, 33, 'San Miguel Este'),
(65, 33, 'San Miguel Oeste'),
(66, 34, 'Sucre Norte'),
(67, 34, 'Sucre Sur'),
(68, 35, 'Valle de Guanape'),
(69, 35, 'La Esperanza'),
(70, 36, 'Santa Bárbara Este'),
(71, 36, 'Santa Bárbara Oeste'),
(72, 36, 'San Luis Norte'),
(73, 36, 'San Luis Sur'),
(74, 37, 'Pariaguán Centro'),
(75, 37, 'Zona Industrial'),
(76, 38, 'Atapirire Norte'),
(77, 38, 'Atapirire Sur'),
(78, 39, 'El Pao Este'),
(79, 39, 'El Pao Oeste'),
(80, 40, 'Guanta Centro'),
(81, 40, 'Playa Larga'),
(82, 41, 'Chorrerón Norte'),
(83, 41, 'Chorrerón Sur'),
(84, 42, 'Cumanacoa Este'),
(85, 42, 'Cumanacoa Oeste'),
(86, 43, 'Soledad Centro'),
(87, 43, 'El Carmen'),
(88, 44, 'Mamo Norte'),
(89, 44, 'Mamo Sur'),
(90, 45, 'Aguasay Este'),
(91, 45, 'Aguasay Oeste'),
(92, 46, 'Mapire Centro'),
(93, 46, 'Río Mapire'),
(94, 47, 'Piar Norte'),
(95, 47, 'Piar Sur'),
(96, 48, 'San Diego Este'),
(97, 48, 'San Diego Oeste'),
(98, 49, 'Puerto La Cruz Centro'),
(99, 49, 'Paseo Colón'),
(100, 50, 'Pozuelos Norte'),
(101, 50, 'Pozuelos Sur'),
(102, 51, 'Guaraguao Este'),
(103, 51, 'Guaraguao Oeste'),
(104, 52, 'Onoto Centro'),
(105, 52, 'La Victoria'),
(106, 53, 'San Pablo Norte'),
(107, 53, 'San Pablo Sur'),
(108, 54, 'La Trinchera Este'),
(109, 54, 'La Trinchera Oeste'),
(110, 55, 'San Mateo Centro'),
(111, 55, 'El Progreso'),
(112, 56, 'Lechería Norte'),
(113, 56, 'Lechería Sur'),
(114, 57, 'El Carito Este'),
(115, 57, 'El Carito Oeste'),
(116, 58, 'Clarines Centro'),
(117, 58, 'Río Unare'),
(118, 59, 'Guanape Norte'),
(119, 59, 'Guanape Sur'),
(120, 60, 'Sabana de Uchire Este'),
(121, 60, 'Sabana de Uchire Oeste'),
(122, 61, 'Cantaura Centro'),
(123, 61, 'Zona Industrial'),
(124, 62, 'Libertador Norte'),
(125, 62, 'Libertador Sur'),
(126, 63, 'Santa Rosa Este'),
(127, 63, 'Santa Rosa Oeste'),
(128, 64, 'Píritu Centro'),
(129, 64, 'El Calvario'),
(130, 65, 'San Francisco Este'),
(131, 65, 'San Francisco Oeste'),
(132, 66, 'El Tigrito Norte'),
(133, 66, 'El Tigrito Sur'),
(134, 67, 'San José Centro'),
(135, 67, 'La Floresta'),
(136, 68, 'El Tigre Norte'),
(137, 68, 'El Tigre Sur'),
(138, 69, 'Cantaura Este'),
(139, 69, 'Cantaura Oeste'),
(140, 70, 'Boca de Uchire Centro'),
(141, 70, 'Playa Boca de Uchire'),
(142, 71, 'Chacal Norte'),
(143, 71, 'Chacal Sur'),
(144, 80, 'La Montaña Este'),
(145, 80, 'La Montaña Oeste'),
(146, 81, 'Santa Ana Centro'),
(147, 81, 'El Tamarindo'),
(148, 82, 'La Encrucijada Norte'),
(149, 82, 'La Encrucijada Sur'),
(150, 83, 'San Juan Este'),
(151, 83, 'San Juan Oeste'),
(152, 84, 'El Carmen Centro'),
(153, 84, 'Los Mangos'),
(154, 85, 'San Cristóbal Norte'),
(155, 85, 'San Cristóbal Sur'),
(156, 86, 'Bergantín Este'),
(157, 86, 'Bergantín Oeste'),
(158, 87, 'Edmundo Barrios Centro'),
(159, 87, 'La Esperanza'),
(160, 88, 'El Tigre Norte'),
(161, 88, 'El Tigre Sur'),
(162, 89, 'Puerto Ordaz Este'),
(163, 89, 'Puerto Ordaz Oeste'),
(164, 90, 'Achaguas Centro'),
(165, 90, 'Barrio El Progreso'),
(166, 91, 'Guarico Norte'),
(167, 91, 'Guarico Sur'),
(168, 92, 'Mantecal Este'),
(169, 92, 'Mantecal Oeste'),
(170, 93, 'Biruaca Centro'),
(171, 93, 'Barrio Libertador'),
(172, 94, 'San Juan de Payara Norte'),
(173, 94, 'San Juan de Payara Sur'),
(174, 95, 'El Yagual Este'),
(175, 95, 'El Yagual Oeste'),
(176, 96, 'Muñoz Centro'),
(177, 96, 'Barrio Bolívar'),
(178, 97, 'Bruzual Norte'),
(179, 97, 'Bruzual Sur'),
(180, 98, 'Elorza Este'),
(181, 98, 'Elorza Oeste'),
(182, 99, 'Guasdualito Centro'),
(183, 99, 'Barrio El Carmen'),
(184, 100, 'Aramendi Norte'),
(185, 100, 'Aramendi Sur'),
(186, 101, 'El Amparo Este'),
(187, 101, 'El Amparo Oeste'),
(188, 102, 'San Juan de Payara Centro'),
(189, 102, 'Barrio Nuevo'),
(190, 103, 'La Trinidad de Orichuna Norte'),
(191, 103, 'La Trinidad de Orichuna Sur'),
(192, 104, 'Mata de Caña Este'),
(193, 104, 'Mata de Caña Oeste'),
(194, 105, 'Elorza Centro'),
(195, 105, 'Barrio La Victoria'),
(196, 106, 'El Viento Norte'),
(197, 106, 'El Viento Sur'),
(198, 107, 'Guachara Este'),
(199, 107, 'Guachara Oeste'),
(200, 108, 'San Fernando Centro'),
(201, 108, 'Barrio El Recreo'),
(202, 109, 'El Recreo Norte'),
(203, 109, 'El Recreo Sur'),
(204, 110, 'San Rafael de Atamaica Este'),
(205, 110, 'San Rafael de Atamaica Oeste'),
(206, 111, 'San Mateo Centro'),
(207, 111, 'La Aragüita'),
(208, 112, 'El Consejo Norte'),
(209, 112, 'El Consejo Sur'),
(210, 113, 'Augusto Mijares Este'),
(211, 113, 'Augusto Mijares Oeste'),
(212, 114, 'Camatagua Centro'),
(213, 114, 'Río Guárico'),
(214, 115, 'Carmen de Cura Norte'),
(215, 115, 'Carmen de Cura Sur'),
(216, 116, 'Urdaneta Este'),
(217, 116, 'Urdaneta Oeste'),
(218, 117, 'Santa Rita Centro'),
(219, 117, 'Barrio Nuevo'),
(220, 118, 'Francisco de Miranda Norte'),
(221, 118, 'Francisco de Miranda Sur'),
(222, 119, 'Monseñor Feliciano Norte'),
(223, 119, 'Monseñor Feliciano Sur'),
(224, 120, 'Choroní Centro'),
(225, 120, 'Playa Grande'),
(226, 121, 'El Limón Norte'),
(227, 121, 'El Limón Sur'),
(228, 122, 'Las Delicias Este'),
(229, 122, 'Las Delicias Oeste'),
(230, 123, 'Santa Cruz Centro'),
(231, 123, 'Barrio Unión'),
(232, 124, 'La Pica Norte'),
(233, 124, 'La Pica Sur'),
(234, 125, 'Chuao Este'),
(235, 125, 'Chuao Oeste'),
(236, 126, 'La Victoria Centro'),
(237, 126, 'San Martín'),
(238, 127, 'Castor Nieves Ríos Norte'),
(239, 127, 'Castor Nieves Ríos Sur'),
(240, 128, 'Las Mercedes Este'),
(241, 128, 'Las Mercedes Oeste'),
(242, 129, 'El Consejo Centro'),
(243, 129, 'Barrio Bolívar'),
(244, 130, 'San Pablo Norte'),
(245, 130, 'San Pablo Sur'),
(246, 131, 'Punta Brava Este'),
(247, 131, 'Punta Brava Oeste'),
(248, 132, 'Palo Negro Centro'),
(249, 132, 'Zona Industrial'),
(250, 133, 'San Martín Norte'),
(251, 133, 'San Martín Sur'),
(252, 134, 'Santa Inés Este'),
(253, 134, 'Santa Inés Oeste'),
(254, 135, 'El Limón Centro'),
(255, 135, 'Urbanización El Castaño'),
(256, 136, 'Caña de Azúcar Norte'),
(257, 136, 'Caña de Azúcar Sur'),
(258, 137, 'La Victoria Este'),
(259, 137, 'La Victoria Oeste'),
(260, 138, 'Ocumare Centro'),
(261, 138, 'Playa Cata'),
(262, 139, 'El Limón Norte'),
(263, 139, 'El Limón Sur'),
(264, 140, 'Cata Este'),
(265, 140, 'Cata Oeste'),
(266, 141, 'San Casimiro Centro'),
(267, 141, 'Barrio El Calvario'),
(268, 142, 'Guiripa Norte'),
(269, 142, 'Guiripa Sur'),
(270, 143, 'Valle Morín Este'),
(271, 143, 'Valle Morín Oeste'),
(272, 144, 'San Sebastián Centro'),
(273, 144, 'Barrio El Progreso'),
(274, 145, 'Guayabal Norte'),
(275, 145, 'Guayabal Sur'),
(276, 146, 'Quiroz Este'),
(277, 146, 'Quiroz Oeste'),
(278, 147, 'Turmero Centro'),
(279, 147, 'Urbanización Mariño'),
(280, 148, 'Arevalo Aponte Norte'),
(281, 148, 'Arevalo Aponte Sur'),
(282, 149, 'Chuao Este'),
(283, 149, 'Chuao Oeste'),
(284, 150, 'Las Tejerías Centro'),
(285, 150, 'Zona Industrial'),
(286, 151, 'Tiara Norte'),
(287, 151, 'Tiara Sur'),
(288, 152, 'La Victoria Este'),
(289, 152, 'La Victoria Oeste'),
(290, 153, 'Cagua Centro'),
(291, 153, 'Barrio Sucre'),
(292, 154, 'Bella Vista Norte'),
(293, 154, 'Bella Vista Sur'),
(294, 155, 'Chuao Este'),
(295, 155, 'Chuao Oeste'),
(296, 156, 'Colonia Tovar Centro'),
(297, 156, 'Sector Alemán'),
(298, 157, 'El Cedral Norte'),
(299, 157, 'El Cedral Sur'),
(300, 158, 'La Montaña Este'),
(301, 158, 'La Montaña Oeste'),
(302, 159, 'Barbacoas Centro'),
(303, 159, 'Barrio El Rincón'),
(304, 160, 'Las Peñitas Norte'),
(305, 160, 'Las Peñitas Sur'),
(306, 161, 'San Casimiro Este'),
(307, 161, 'San Casimiro Oeste'),
(308, 162, 'Villa de Cura Centro'),
(309, 162, 'Barrio Bolívar'),
(310, 163, 'Magdaleno Norte'),
(311, 163, 'Magdaleno Sur'),
(312, 164, 'San Francisco Este'),
(313, 164, 'San Francisco Oeste'),
(314, 165, 'Sabaneta Centro'),
(315, 165, 'Barrio La Esperanza'),
(316, 166, 'Rodríguez Domínguez Norte'),
(317, 166, 'Rodríguez Domínguez Sur'),
(318, 167, 'Barinas Norte'),
(319, 167, 'Barinas Sur'),
(320, 168, 'El Cantón Centro'),
(321, 168, 'Barrio Bolívar'),
(322, 169, 'Santa Cruz de Guacas Este'),
(323, 169, 'Santa Cruz de Guacas Oeste'),
(324, 170, 'Puerto Vivas Norte'),
(325, 170, 'Puerto Vivas Sur'),
(326, 171, 'Socopó Centro'),
(327, 171, 'Zona Industrial'),
(328, 172, 'Ticoporo Norte'),
(329, 172, 'Ticoporo Sur'),
(330, 173, 'Nicolás Pulido Este'),
(331, 173, 'Nicolás Pulido Oeste'),
(332, 174, 'Arismendi Centro'),
(333, 174, 'Barrio El Progreso'),
(334, 175, 'Arismendi de Caicara Norte'),
(335, 175, 'Arismendi de Caicara Sur'),
(336, 176, 'Chaguaramo Este'),
(337, 176, 'Chaguaramo Oeste'),
(338, 177, 'Alto Barinas Centro'),
(339, 177, 'Urbanización El Recreo'),
(340, 178, 'Barinas Norte'),
(341, 178, 'Barinas Sur'),
(342, 179, 'Corazón de Jesús Este'),
(343, 179, 'Corazón de Jesús Oeste'),
(344, 180, 'Barinitas Centro'),
(345, 180, 'Barrio Sucre'),
(346, 181, 'Altamira de Cáceres Norte'),
(347, 181, 'Altamira de Cáceres Sur'),
(348, 182, 'Calderas Este'),
(349, 182, 'Calderas Oeste'),
(350, 183, 'Barrancas Centro'),
(351, 183, 'Barrio El Carmen'),
(352, 184, 'El Socorro Norte'),
(353, 184, 'El Socorro Sur'),
(354, 185, 'Santa Bárbara Este'),
(355, 185, 'Santa Bárbara Oeste'),
(356, 186, 'Santa Bárbara Centro'),
(357, 186, 'Barrio Libertador'),
(358, 187, 'Pedraza La Vieja Norte'),
(359, 187, 'Pedraza La Vieja Sur'),
(360, 188, 'Ciudad Bolivia Este'),
(361, 188, 'Ciudad Bolivia Oeste'),
(362, 189, 'Obispos Centro'),
(363, 189, 'Barrio Nuevo'),
(364, 190, 'El Real Norte'),
(365, 190, 'El Real Sur'),
(366, 191, 'Los Guasimitos Este'),
(367, 191, 'Los Guasimitos Oeste'),
(368, 192, 'Ciudad Bolivia Centro'),
(369, 192, 'Barrio El Rincón'),
(370, 193, 'Iglesia Norte'),
(371, 193, 'Iglesia Sur'),
(372, 194, 'José Ignacio del Pumar Este'),
(373, 194, 'José Ignacio del Pumar Oeste'),
(374, 195, 'Libertad Centro'),
(375, 195, 'Barrio Unión'),
(376, 196, 'Dolores Norte'),
(377, 196, 'Dolores Sur'),
(378, 197, 'Palacio Fajardo Este'),
(379, 197, 'Palacio Fajardo Oeste'),
(380, 198, 'Ciudad de Nutrias Centro'),
(381, 198, 'Barrio El Progreso'),
(382, 199, 'El Regalo Norte'),
(383, 199, 'El Regalo Sur'),
(384, 200, 'Puerto de Nutrias Este'),
(385, 200, 'Puerto de Nutrias Oeste'),
(386, 201, 'Cachamay Centro'),
(387, 201, 'Unare'),
(388, 202, 'Chirica Norte'),
(389, 202, 'Chirica Sur'),
(390, 203, 'Dalla Costa Este'),
(391, 203, 'Dalla Costa Oeste'),
(392, 204, 'Caicara Centro'),
(393, 204, 'Río Orinoco'),
(394, 205, 'Altagracia Norte'),
(395, 205, 'Altagracia Sur'),
(396, 206, 'Ascensión Farreras Este'),
(397, 206, 'Ascensión Farreras Oeste'),
(398, 207, 'El Callao Centro'),
(399, 207, 'Minas de Oro'),
(400, 208, 'El Dorado Norte'),
(401, 208, 'El Dorado Sur'),
(402, 209, 'Tumeremo Este'),
(403, 209, 'Tumeremo Oeste'),
(404, 210, 'Santa Elena Centro'),
(405, 210, 'Frontera Brasil'),
(406, 211, 'Ikabarú Norte'),
(407, 211, 'Ikabarú Sur'),
(408, 212, 'Urimán Este'),
(409, 212, 'Urimán Oeste'),
(410, 213, 'Catedral Centro'),
(411, 213, 'Paseo Orinoco'),
(412, 214, 'Zea Norte'),
(413, 214, 'Zea Sur'),
(414, 215, 'Panapana Este'),
(415, 215, 'Panapana Oeste'),
(416, 216, 'Upata Centro'),
(417, 216, 'Andrés Bello'),
(418, 217, 'El Pao Norte'),
(419, 217, 'El Pao Sur'),
(420, 218, 'Andrés Eloy Blanco Este'),
(421, 218, 'Andrés Eloy Blanco Oeste'),
(422, 219, 'Ciudad Piar Centro'),
(423, 219, 'Zona Minera'),
(424, 220, 'Raúl Leoni Norte'),
(425, 220, 'Raúl Leoni Sur'),
(426, 221, 'La Paragua Este'),
(427, 221, 'La Paragua Oeste'),
(428, 222, 'Guasipati Centro'),
(429, 222, 'El Mango'),
(430, 223, 'Salto La Llovizna Norte'),
(431, 223, 'Salto La Llovizna Sur'),
(432, 224, 'San Isidro Este'),
(433, 224, 'San Isidro Oeste'),
(434, 225, 'Tumeremo Centro'),
(435, 225, 'El Perú'),
(436, 226, 'Dalla Costa Norte'),
(437, 226, 'Dalla Costa Sur'),
(438, 227, 'El Dorado Este'),
(439, 227, 'El Dorado Oeste'),
(440, 228, 'Maripa Centro'),
(441, 228, 'Río Caura'),
(442, 229, 'Las Majadas Norte'),
(443, 229, 'Las Majadas Sur'),
(444, 230, 'Santa Rosa Este'),
(445, 230, 'Santa Rosa Oeste'),
(446, 231, 'El Palmar Centro'),
(447, 231, 'Frontera Colombia'),
(448, 232, 'Padre Pedro Chien Norte'),
(449, 232, 'Padre Pedro Chien Sur'),
(450, 233, 'Santa Cruz Este'),
(451, 233, 'Santa Cruz Oeste'),
(452, 234, 'Bejuma Centro'),
(453, 234, 'El Potrero'),
(454, 235, 'Canoabo Norte'),
(455, 235, 'Canoabo Sur'),
(456, 236, 'Simón Bolívar Este'),
(457, 236, 'Simón Bolívar Oeste'),
(458, 237, 'Güigüe Centro'),
(459, 237, 'Barrio Bolívar'),
(460, 238, 'Belén Norte'),
(461, 238, 'Belén Sur'),
(462, 239, 'Tacarigua Este'),
(463, 239, 'Tacarigua Oeste'),
(464, 240, 'Mariara Centro'),
(465, 240, 'Zona Industrial'),
(466, 241, 'Aguas Calientes Norte'),
(467, 241, 'Aguas Calientes Sur'),
(468, 242, 'San Joaquín Este'),
(469, 242, 'San Joaquín Oeste'),
(470, 243, 'Guacara Centro'),
(471, 243, 'Urbanización La Isabelica'),
(472, 244, 'Yagua Norte'),
(473, 244, 'Yagua Sur'),
(474, 245, 'Ciudad Alianza Este'),
(475, 245, 'Ciudad Alianza Oeste'),
(476, 246, 'Morón Centro'),
(477, 246, 'Puerto Morón'),
(478, 247, 'Urama Norte'),
(479, 247, 'Urama Sur'),
(480, 248, 'Yaracuy Este'),
(481, 248, 'Yaracuy Oeste'),
(482, 249, 'Tocuyito Centro'),
(483, 249, 'Barrio San José'),
(484, 250, 'Independencia Norte'),
(485, 250, 'Independencia Sur'),
(486, 251, 'Los Naranjos Este'),
(487, 251, 'Los Naranjos Oeste'),
(488, 252, 'Los Guayos Centro'),
(489, 252, 'Urbanización El Samán'),
(490, 253, 'Las Vegas Norte'),
(491, 253, 'Las Vegas Sur'),
(492, 254, 'Parque Industrial Este'),
(493, 254, 'Parque Industrial Oeste'),
(494, 255, 'Miranda Centro'),
(495, 255, 'Barrio El Carmen'),
(496, 256, 'El Toco Norte'),
(497, 256, 'El Toco Sur'),
(498, 257, 'La Aguada Este'),
(499, 257, 'La Aguada Oeste'),
(500, 258, 'Montalbán Centro'),
(501, 258, 'Barrio El Rincón'),
(502, 259, 'La Yaguara Norte'),
(503, 259, 'La Yaguara Sur'),
(504, 260, 'Monseñor Castro Este'),
(505, 260, 'Monseñor Castro Oeste'),
(506, 261, 'Naguanagua Centro'),
(507, 261, 'Urbanización La Granja'),
(508, 262, 'La Campiña Norte'),
(509, 262, 'La Campiña Sur'),
(510, 263, 'Mañongo Este'),
(511, 263, 'Mañongo Oeste'),
(512, 264, 'Bartolomé Salom Centro'),
(513, 264, 'Zona Portuaria'),
(514, 265, 'Borburata Norte'),
(515, 265, 'Borburata Sur'),
(516, 266, 'Fraternidad Este'),
(517, 266, 'Fraternidad Oeste'),
(518, 267, 'San Diego Centro'),
(519, 267, 'Urbanización El Trigal'),
(520, 268, 'Yaracuy Norte'),
(521, 268, 'Yaracuy Sur'),
(522, 269, 'La Cumaca Este'),
(523, 269, 'La Cumaca Oeste'),
(524, 270, 'San Joaquín Centro'),
(525, 270, 'Barrio Nuevo'),
(526, 271, 'Los Palos Grandes Norte'),
(527, 271, 'Los Palos Grandes Sur'),
(528, 272, 'La Pradera Este'),
(529, 272, 'La Pradera Oeste'),
(530, 273, 'Candelaria Centro'),
(531, 273, 'Urbanización El Viñedo'),
(532, 274, 'Catedral Norte'),
(533, 274, 'Catedral Sur'),
(534, 275, 'El Socorro Este'),
(535, 275, 'El Socorro Oeste'),
(536, 276, 'Cojedes Centro'),
(537, 276, 'Barrio El Progreso'),
(538, 277, 'El Baúl Norte'),
(539, 277, 'El Baúl Sur'),
(540, 278, 'La Aguadita Este'),
(541, 278, 'La Aguadita Oeste'),
(542, 279, 'El Pao Centro'),
(543, 279, 'Zona Agrícola'),
(544, 280, 'Manrique Norte'),
(545, 280, 'Manrique Sur'),
(546, 281, 'Las Vegas Este'),
(547, 281, 'Las Vegas Oeste'),
(548, 282, 'Tinaquillo Centro'),
(549, 282, 'Urbanización La Florida'),
(550, 283, 'Macapo Norte'),
(551, 283, 'Macapo Sur'),
(552, 284, 'La Candelaria Este'),
(553, 284, 'La Candelaria Oeste'),
(554, 285, 'El Baúl Centro'),
(555, 285, 'Barrio Bolívar'),
(556, 286, 'Sucre Norte'),
(557, 286, 'Sucre Sur'),
(558, 287, 'El Baúl Abajo Este'),
(559, 287, 'El Baúl Abajo Oeste'),
(560, 288, 'Macapo Centro'),
(561, 288, 'Barrio Unión'),
(562, 289, 'La Aguadita Norte'),
(563, 289, 'La Aguadita Sur'),
(564, 290, 'El Limón Este'),
(565, 290, 'El Limón Oeste'),
(566, 291, 'Libertad Centro'),
(567, 291, 'Barrio Nuevo'),
(568, 292, 'Ricaurte Norte'),
(569, 292, 'Ricaurte Sur'),
(570, 293, 'Las Vegas Este'),
(571, 293, 'Las Vegas Oeste'),
(572, 294, 'Las Vegas Centro'),
(573, 294, 'Zona Ganadera'),
(574, 295, 'El Pao Norte'),
(575, 295, 'El Pao Sur'),
(576, 296, 'Manrique Este'),
(577, 296, 'Manrique Oeste'),
(578, 297, 'San Carlos Centro'),
(579, 297, 'Barrio El Carmen'),
(580, 298, 'Juan Ángel Bravo Norte'),
(581, 298, 'Juan Ángel Bravo Sur'),
(582, 299, 'Manuel Manrique Este'),
(583, 299, 'Manuel Manrique Oeste'),
(584, 300, 'Tinaco Centro'),
(585, 300, 'Barrio La Esperanza'),
(586, 301, 'Macapo Norte'),
(587, 301, 'Macapo Sur'),
(588, 302, 'La Aguadita Este'),
(589, 302, 'La Aguadita Oeste'),
(590, 303, 'Curiapo Centro'),
(591, 303, 'Barrio Warao'),
(592, 304, 'Almirante Luis Brión Norte'),
(593, 304, 'Almirante Luis Brión Sur'),
(594, 305, 'Manuel Renaud Este'),
(595, 305, 'Manuel Renaud Oeste'),
(596, 306, 'Irapa Centro'),
(597, 306, 'Zona Fluvial'),
(598, 307, 'Manuel Piar Norte'),
(599, 307, 'Manuel Piar Sur'),
(600, 308, 'Vicente Díaz Este'),
(601, 308, 'Vicente Díaz Oeste'),
(602, 309, 'Pedernales Centro'),
(603, 309, 'Barrio Delta'),
(604, 310, 'Guasina Norte'),
(605, 310, 'Guasina Sur'),
(606, 311, 'Punta Pescador Este'),
(607, 311, 'Punta Pescador Oeste'),
(608, 312, 'San José Centro'),
(609, 312, 'Barrio Mánamo'),
(610, 313, 'San Rafael Norte'),
(611, 313, 'San Rafael Sur'),
(612, 315, 'Tucupita Este'),
(613, 315, 'Tucupita Oeste'),
(614, 316, 'San Juan Centro'),
(615, 316, 'Barrio El Mangle'),
(616, 317, 'Capadare Norte'),
(617, 317, 'Capadare Sur'),
(618, 318, 'La Vela Este'),
(619, 318, 'La Vela Oeste'),
(620, 319, 'San Luis Centro'),
(621, 319, 'Barrio Libertador'),
(622, 320, 'La Vela Norte'),
(623, 320, 'La Vela Sur'),
(624, 321, 'Bolívar Este'),
(625, 321, 'Bolívar Oeste'),
(626, 322, 'Capatárida Centro'),
(627, 322, 'Barrio Nuevo'),
(628, 323, 'San José de Seque Norte'),
(629, 323, 'San José de Seque Sur'),
(630, 324, 'Zazárida Este'),
(631, 324, 'Zazárida Oeste'),
(632, 325, 'La Vela de Coro Centro'),
(633, 325, 'Barrio El Calvario'),
(634, 326, 'Punta Cardón Norte'),
(635, 326, 'Punta Cardón Sur'),
(636, 327, 'San Luis Este'),
(637, 327, 'San Luis Oeste'),
(638, 328, 'Carirubana Centro'),
(639, 328, 'Barrio Ziruma'),
(640, 329, 'Norte Centro'),
(641, 329, 'Urbanización Las Palmas'),
(642, 330, 'Punta Cardón Este'),
(643, 330, 'Punta Cardón Oeste'),
(644, 331, 'La Vela de Coro Centro'),
(645, 331, 'Paseo Alameda'),
(646, 332, 'Acurigua Norte'),
(647, 332, 'Acurigua Sur'),
(648, 333, 'Guaibacoa Este'),
(649, 333, 'Guaibacoa Oeste'),
(650, 334, 'Dabajuro Centro'),
(651, 334, 'Barrio El Progreso'),
(652, 335, 'Hato Viejo Norte'),
(653, 335, 'Hato Viejo Sur'),
(654, 336, 'Urumaco Este'),
(655, 336, 'Urumaco Oeste'),
(656, 337, 'Pedregal Centro'),
(657, 337, 'Barrio El Carmen'),
(658, 338, 'Agua Larga Norte'),
(659, 338, 'Agua Larga Sur'),
(660, 339, 'Avaria Este'),
(661, 339, 'Avaria Oeste'),
(662, 340, 'Pueblo Nuevo Centro'),
(663, 340, 'Barrio La Esperanza'),
(664, 341, 'Adícora Norte'),
(665, 341, 'Adícora Sur'),
(666, 342, 'Jadacaquiva Este'),
(667, 342, 'Jadacaquiva Oeste'),
(668, 343, 'Churuguara Centro'),
(669, 343, 'Barrio Bolívar'),
(670, 344, 'Agua Larga Norte'),
(671, 344, 'Agua Larga Sur'),
(672, 345, 'El Paují Este'),
(673, 345, 'El Paují Oeste'),
(674, 346, 'Jacura Centro'),
(675, 346, 'Barrio El Mango'),
(676, 347, 'Agua Larga Norte'),
(677, 347, 'Agua Larga Sur'),
(678, 348, 'Araurima Este'),
(679, 348, 'Araurima Oeste'),
(680, 349, 'Judibana Centro'),
(681, 349, 'Urbanización Costa Azul'),
(682, 350, 'Los Taques Norte'),
(683, 350, 'Los Taques Sur'),
(684, 351, 'Villa Marina Este'),
(685, 351, 'Villa Marina Oeste'),
(686, 352, 'Mene de Mauroa Centro'),
(687, 352, 'Barrio El Rincón'),
(688, 353, 'Casigua Norte'),
(689, 353, 'Casigua Sur'),
(690, 354, 'San Félix Este'),
(691, 354, 'San Félix Oeste'),
(692, 355, 'Coro Centro'),
(693, 355, 'Barrio San Nicolás'),
(694, 356, 'Mitare Norte'),
(695, 356, 'Mitare Sur'),
(696, 357, 'Sabana Larga Este'),
(697, 357, 'Sabana Larga Oeste'),
(698, 358, 'Chichiriviche Centro'),
(699, 358, 'Zona Turística'),
(700, 359, 'Boca de Aroa Norte'),
(701, 359, 'Boca de Aroa Sur'),
(702, 360, 'Tucacas Este'),
(703, 360, 'Tucacas Oeste'),
(704, 361, 'Palmasola Centro'),
(705, 361, 'Barrio El Progreso'),
(706, 362, 'El Silencio Norte'),
(707, 362, 'El Silencio Sur'),
(708, 363, 'El Tocuyo Este'),
(709, 363, 'El Tocuyo Oeste'),
(710, 364, 'Cabure Centro'),
(711, 364, 'Barrio La Paz'),
(712, 365, 'Colina Norte'),
(713, 365, 'Colina Sur'),
(714, 366, 'Sabaneta Este'),
(715, 366, 'Sabaneta Oeste'),
(716, 367, 'Píritu Centro'),
(717, 367, 'Barrio El Carmen'),
(718, 368, 'San José Norte'),
(719, 368, 'San José Sur'),
(720, 369, 'Puerta de Píritu Este'),
(721, 369, 'Puerta de Píritu Oeste'),
(722, 370, 'Mirimire Centro'),
(723, 370, 'Barrio El Valle'),
(724, 371, 'El Charal Norte'),
(725, 371, 'El Charal Sur'),
(726, 372, 'San Francisco Este'),
(727, 372, 'San Francisco Oeste'),
(728, 373, 'Tucacas Centro'),
(729, 373, 'Zona Hotelera'),
(730, 374, 'Boca de Aroa Norte'),
(731, 374, 'Boca de Aroa Sur'),
(732, 375, 'Chichiriviche Este'),
(733, 375, 'Chichiriviche Oeste'),
(734, 376, 'La Cruz de Taratara Centro'),
(735, 376, 'Barrio El Hato'),
(736, 377, 'Sucre Norte'),
(737, 377, 'Sucre Sur'),
(738, 378, 'Píritu Este'),
(739, 378, 'Píritu Oeste'),
(740, 379, 'Tocópero Centro'),
(741, 379, 'Barrio La Cruz'),
(742, 380, 'Aragüita Norte'),
(743, 380, 'Aragüita Sur'),
(744, 381, 'Tocuyito Este'),
(745, 381, 'Tocuyito Oeste'),
(746, 382, 'Santa Cruz de Bucaral Centro'),
(747, 382, 'Barrio El Rincón'),
(748, 383, 'Purureche Norte'),
(749, 383, 'Purureche Sur'),
(750, 384, 'El Charal Este'),
(751, 384, 'El Charal Oeste'),
(752, 385, 'Urumaco Centro'),
(753, 385, 'Barrio El Mangle'),
(754, 386, 'El Yabal Norte'),
(755, 386, 'El Yabal Sur'),
(756, 387, 'Casigua Este'),
(757, 387, 'Casigua Oeste'),
(758, 388, 'Puerto Cumarebo Centro'),
(759, 388, 'Barrio El Puerto'),
(760, 389, 'La Ciénaga Norte'),
(761, 389, 'La Ciénaga Sur'),
(762, 390, 'Pueblo Cumarebo Este'),
(763, 390, 'Pueblo Cumarebo Oeste'),
(764, 391, 'Camaguán Centro'),
(765, 391, 'Barrio El Progreso'),
(766, 392, 'Puerto de Nutrias Norte'),
(767, 392, 'Puerto de Nutrias Sur'),
(768, 393, 'El Rosario Este'),
(769, 393, 'El Rosario Oeste'),
(770, 394, 'Chaguaramas Centro'),
(771, 394, 'Barrio Bolívar'),
(772, 395, 'Camatagua Norte'),
(773, 395, 'Camatagua Sur'),
(774, 396, 'La Candelaria Este'),
(775, 396, 'La Candelaria Oeste'),
(776, 397, 'El Socorro Centro'),
(777, 397, 'Barrio La Paz'),
(778, 398, 'Tucupido Norte'),
(779, 398, 'Tucupido Sur'),
(780, 399, 'Santa María de Ipire Este'),
(781, 399, 'Santa María de Ipire Oeste'),
(782, 400, 'Calabozo Centro'),
(783, 400, 'Urbanización La Manga'),
(784, 401, 'El Rastro Norte'),
(785, 401, 'El Rastro Sur'),
(786, 402, 'Tucupido Este'),
(787, 402, 'Tucupido Oeste'),
(788, 403, 'Tucupido Centro'),
(789, 403, 'Barrio San Rafael'),
(790, 404, 'San Rafael de Laya Norte'),
(791, 404, 'San Rafael de Laya Sur'),
(792, 405, 'Valle de la Pascua Este'),
(793, 405, 'Valle de la Pascua Oeste'),
(794, 406, 'Altagracia de Orituco Centro'),
(795, 406, 'Barrio El Calvario'),
(796, 407, 'Lezama Norte'),
(797, 407, 'Lezama Sur'),
(798, 408, 'Paso Real de Macaira Este'),
(799, 408, 'Paso Real de Macaira Oeste'),
(800, 409, 'San Juan de los Morros Centro'),
(801, 409, 'Urbanización La Arboleda'),
(802, 410, 'Parapara Norte'),
(803, 410, 'Parapara Sur'),
(804, 411, 'Cantagallo Este'),
(805, 411, 'Cantagallo Oeste'),
(806, 412, 'El Sombrero Centro'),
(807, 412, 'Barrio Unión'),
(808, 413, 'Barbacoas Norte'),
(809, 413, 'Barbacoas Sur'),
(810, 414, 'San Francisco de Tiznados Este'),
(811, 414, 'San Francisco de Tiznados Oeste'),
(812, 415, 'Las Mercedes Centro'),
(813, 415, 'Barrio El Rincón'),
(814, 416, 'Cazorla Norte'),
(815, 416, 'Cazorla Sur'),
(816, 417, 'Tucupido Este'),
(817, 417, 'Tucupido Oeste'),
(818, 418, 'Valle de la Pascua Centro'),
(819, 418, 'Urbanización Las Flores'),
(820, 419, 'Espino Norte'),
(821, 419, 'Espino Sur'),
(822, 420, 'Santa María de Ipire Este'),
(823, 420, 'Santa María de Ipire Oeste'),
(824, 421, 'Zaraza Centro'),
(825, 421, 'Barrio San José'),
(826, 422, 'San José de Unare Norte'),
(827, 422, 'San José de Unare Sur'),
(828, 423, 'San Juan de los Morros Este'),
(829, 423, 'San Juan de los Morros Oeste'),
(830, 424, 'Ortíz Centro'),
(831, 424, 'Barrio El Progreso'),
(832, 425, 'San Francisco de Tiznados Norte'),
(833, 425, 'San Francisco de Tiznados Sur'),
(834, 426, 'Guayabal Este'),
(835, 426, 'Guayabal Oeste'),
(836, 427, 'San Gerónimo de Guayabal Centro'),
(837, 427, 'Barrio La Esperanza'),
(838, 428, 'Camaguán Norte'),
(839, 428, 'Camaguán Sur'),
(840, 429, 'Puerto de Nutrias Este'),
(841, 429, 'Puerto de Nutrias Oeste'),
(842, 430, 'San José de Guaribe Centro'),
(843, 430, 'Barrio Nuevo'),
(844, 431, 'San José Norte'),
(845, 431, 'San José Sur'),
(846, 432, 'Altagracia de Orituco Este'),
(847, 432, 'Altagracia de Orituco Oeste'),
(848, 433, 'Santa María de Ipire Centro'),
(849, 433, 'Barrio Bolívar'),
(850, 434, 'Zaraza Norte'),
(851, 434, 'Zaraza Sur'),
(852, 435, 'Pariaguán Este'),
(853, 435, 'Pariaguán Oeste'),
(854, 463, 'El Vigía Centro'),
(855, 463, 'Urbanización Los Andes'),
(856, 464, 'Presidente Betancourt Norte'),
(857, 464, 'Presidente Betancourt Sur'),
(858, 465, 'Presidente Párez Este'),
(859, 465, 'Presidente Párez Oeste'),
(860, 466, 'La Azulita Centro'),
(861, 466, 'Barrio El Progreso'),
(862, 467, 'Santiago de la Punta Norte'),
(863, 467, 'Santiago de la Punta Sur'),
(864, 468, 'San Rafael de Tabay Este'),
(865, 468, 'San Rafael de Tabay Oeste'),
(866, 469, 'Santa Cruz de Mora Centro'),
(867, 469, 'Barrio Bolívar'),
(868, 470, 'Mesa de Las Palmas Norte'),
(869, 470, 'Mesa de Las Palmas Sur'),
(870, 471, 'San Pedro del Lagunillas Este'),
(871, 471, 'San Pedro del Lagunillas Oeste'),
(872, 472, 'Aricagua Centro'),
(873, 472, 'Barrio La Paz'),
(874, 473, 'San Pablo Norte'),
(875, 473, 'San Pablo Sur'),
(876, 474, 'Guaraque Este'),
(877, 474, 'Guaraque Oeste'),
(878, 475, 'Canaguá Centro'),
(879, 475, 'Sector El Valle'),
(880, 476, 'Mucutuy Norte'),
(881, 476, 'Mucutuy Sur'),
(882, 477, 'Quino Este'),
(883, 477, 'Quino Oeste'),
(884, 478, 'Ejido Centro'),
(885, 478, 'Urbanización Los Sauces'),
(886, 479, 'Fernández Peña Norte'),
(887, 479, 'Fernández Peña Sur'),
(888, 480, 'Matriz Este'),
(889, 480, 'Matriz Oeste'),
(890, 481, 'Tucaní Centro'),
(891, 481, 'Barrio Nuevo'),
(892, 482, 'Florencio Ramírez Norte'),
(893, 482, 'Florencio Ramírez Sur'),
(894, 483, 'Tovar Este'),
(895, 483, 'Tovar Oeste'),
(896, 484, 'Santo Domingo Centro'),
(897, 484, 'Sector Los Nevados'),
(898, 485, 'Las Piedras Norte'),
(899, 485, 'Las Piedras Sur'),
(900, 486, 'Mesa de Quintero Este'),
(901, 486, 'Mesa de Quintero Oeste'),
(902, 487, 'Guaraque Centro'),
(903, 487, 'Barrio La Esperanza'),
(904, 488, 'Mesa de Quintero Norte'),
(905, 488, 'Mesa de Quintero Sur'),
(906, 489, 'Río Negro Este'),
(907, 489, 'Río Negro Oeste'),
(908, 490, 'Arapuey Centro'),
(909, 490, 'Barrio El Carmen'),
(910, 491, 'San Rafael de Onoto Norte'),
(911, 491, 'San Rafael de Onoto Sur'),
(912, 492, 'Palmarito Este'),
(913, 492, 'Palmarito Oeste'),
(914, 493, 'Torondoy Centro'),
(915, 493, 'Barrio La Cruz'),
(916, 494, 'Santa Elena de Arenales Norte'),
(917, 494, 'Santa Elena de Arenales Sur'),
(918, 495, 'Río Chiquito Este'),
(919, 495, 'Río Chiquito Oeste'),
(920, 496, 'El Llano Centro'),
(921, 496, 'Urbanización La Parroquia'),
(922, 497, 'Gonzalo Picón Febres Norte'),
(923, 497, 'Gonzalo Picón Febres Sur'),
(924, 498, 'Caracciolo Parra Pérez Este'),
(925, 498, 'Caracciolo Parra Pérez Oeste'),
(926, 499, 'Timotes Centro'),
(927, 499, 'Barrio El Progreso'),
(928, 500, 'La Mesa de Esnujaque Norte'),
(929, 500, 'La Mesa de Esnujaque Sur'),
(930, 501, 'Mocotíes Este'),
(931, 501, 'Mocotíes Oeste'),
(932, 502, 'Santa Elena de Arenales Centro'),
(933, 502, 'Barrio Bolívar'),
(934, 503, 'Eloy Paredes Norte'),
(935, 503, 'Eloy Paredes Sur'),
(936, 504, 'San Rafael de Alcántara Este'),
(937, 504, 'San Rafael de Alcántara Oeste'),
(938, 505, 'Santa María de Caparo Centro'),
(939, 505, 'Sector El Páramo'),
(940, 506, 'Mesa de Las Palmas Norte'),
(941, 506, 'Mesa de Las Palmas Sur'),
(942, 507, 'Pueblo Llano Este'),
(943, 507, 'Pueblo Llano Oeste'),
(944, 508, 'Pueblo Llano Centro'),
(945, 508, 'Barrio La Paz'),
(946, 509, 'Mesa de Quintero Norte'),
(947, 509, 'Mesa de Quintero Sur'),
(948, 510, 'Chiguará Este'),
(949, 510, 'Chiguará Oeste'),
(950, 511, 'Mucuchíes Centro'),
(951, 511, 'Barrio San Rafael'),
(952, 512, 'San Rafael Norte'),
(953, 512, 'San Rafael Sur'),
(954, 513, 'Gavidia Este'),
(955, 513, 'Gavidia Oeste'),
(956, 514, 'Bailadores Centro'),
(957, 514, 'Barrio El Carmen'),
(958, 515, 'Mariño Norte'),
(959, 515, 'Mariño Sur'),
(960, 516, 'La Playa Este'),
(961, 516, 'La Playa Oeste'),
(962, 517, 'Tabay Centro'),
(963, 517, 'Sector La Venta'),
(964, 518, 'La Venta Norte'),
(965, 518, 'La Venta Sur'),
(966, 519, 'El Molino Este'),
(967, 519, 'El Molino Oeste'),
(968, 520, 'Lagunillas Centro'),
(969, 520, 'Barrio Nuevo'),
(970, 521, 'Chiguará Norte'),
(971, 521, 'Chiguará Sur'),
(972, 522, 'San Juan Este'),
(973, 522, 'San Juan Oeste'),
(974, 523, 'Tovar Centro'),
(975, 523, 'Urbanización El Amparo'),
(976, 524, 'El Amparo Norte'),
(977, 524, 'El Amparo Sur'),
(978, 525, 'San Francisco Este'),
(979, 525, 'San Francisco Oeste'),
(980, 526, 'Nueva Bolivia Centro'),
(981, 526, 'Barrio La Esperanza'),
(982, 527, 'Independencia Norte'),
(983, 527, 'Independencia Sur'),
(984, 528, 'Santa Apolonia Este'),
(985, 528, 'Santa Apolonia Oeste'),
(986, 529, 'Zea Centro'),
(987, 529, 'Barrio El Rincón'),
(988, 530, 'Caño Tigre Norte'),
(989, 530, 'Caño Tigre Sur'),
(990, 531, 'El Amparo Este'),
(991, 531, 'El Amparo Oeste'),
(992, 1, '...'),
(993, 2, 'Centro'),
(994, 2, 'Sierra Parima Norte'),
(995, 3, 'Mavaca Centro'),
(996, 3, 'Comunidad Yutajé'),
(997, 4, 'Sierra Parima Sur'),
(998, 4, 'Comunidad Parima B'),
(999, 5, 'Atabapo Centro'),
(1000, 5, 'Río Guainía'),
(1001, 6, 'Ucata Norte'),
(1002, 6, 'Ucata Sur'),
(1003, 7, 'Yapacana Centro'),
(1004, 7, 'Comunidad Maroa'),
(1005, 8, 'Fernando Girón'),
(1006, 8, 'Patanemo Norte'),
(1007, 9, 'Patanemo Sur'),
(1008, 9, 'Comunidad Coromoto'),
(1009, 10, 'San Juan Centro'),
(1010, 10, 'Manapiare Sur'),
(1011, 11, 'Autana Centro'),
(1012, 11, 'Río Sipapo'),
(1013, 12, 'Munduapo Este'),
(1014, 12, 'Munduapo Oeste'),
(1015, 13, 'Samariapo Norte'),
(1016, 13, 'Samariapo Sur'),
(1017, 14, 'Alto Ventuari'),
(1018, 14, 'Comunidad Yavita'),
(1019, 15, 'Manapiare Centro'),
(1020, 15, 'Comunidad Marueta'),
(1021, 16, 'San Juan Norte'),
(1022, 16, 'San Juan Sur'),
(1023, 17, 'Maroa Centro'),
(1024, 17, 'Comunidad Guarinuma'),
(1025, 18, 'Comunidad Maroa'),
(1026, 18, 'Sector Aeropuerto'),
(1027, 19, 'San Carlos Centro'),
(1028, 19, 'Río Negro Sur'),
(1029, 20, 'Río Negro Centro'),
(1030, 20, 'Comunidad Isla Ratón'),
(1031, 21, 'Solano Este'),
(1032, 21, 'Solano Oeste'),
(1033, 22, 'San Carlos Norte'),
(1034, 22, 'San Carlos Sur'),
(1035, 23, 'Centro'),
(1036, 23, 'Buenos Aires'),
(1037, 24, 'Buena Vista Norte'),
(1038, 24, 'Buena Vista Sur'),
(1039, 25, 'San Joaquín Este'),
(1040, 25, 'San Joaquín Oeste'),
(1041, 26, 'Aragua Centro'),
(1042, 26, 'Río Aragua'),
(1043, 27, 'Cachipo Norte'),
(1044, 27, 'Cachipo Sur'),
(1045, 28, 'Santa Rosa Este'),
(1046, 28, 'Santa Rosa Oeste'),
(1047, 29, 'Lechería Centro'),
(1048, 29, 'Playa Colorada'),
(1049, 30, 'El Morro Este'),
(1050, 30, 'El Morro Oeste'),
(1051, 31, 'Santa Rosa Norte'),
(1052, 31, 'Santa Rosa Sur'),
(1053, 32, 'Puerto Píritu Norte'),
(1054, 32, 'Puerto Píritu Sur'),
(1055, 33, 'San Miguel Este'),
(1056, 33, 'San Miguel Oeste'),
(1057, 34, 'Sucre Norte'),
(1058, 34, 'Sucre Sur'),
(1059, 35, 'Valle de Guanape'),
(1060, 35, 'La Esperanza'),
(1061, 36, 'Santa Bárbara Este'),
(1062, 36, 'Santa Bárbara Oeste'),
(1063, 36, 'San Luis Norte'),
(1064, 36, 'San Luis Sur'),
(1065, 37, 'Pariaguán Centro'),
(1066, 37, 'Zona Industrial'),
(1067, 38, 'Atapirire Norte'),
(1068, 38, 'Atapirire Sur'),
(1069, 39, 'El Pao Este'),
(1070, 39, 'El Pao Oeste'),
(1071, 40, 'Guanta Centro'),
(1072, 40, 'Playa Larga'),
(1073, 41, 'Chorrerón Norte'),
(1074, 41, 'Chorrerón Sur'),
(1075, 42, 'Cumanacoa Este'),
(1076, 42, 'Cumanacoa Oeste'),
(1077, 43, 'Soledad Centro'),
(1078, 43, 'El Carmen'),
(1079, 44, 'Mamo Norte'),
(1080, 44, 'Mamo Sur'),
(1081, 45, 'Aguasay Este'),
(1082, 45, 'Aguasay Oeste'),
(1083, 46, 'Mapire Centro'),
(1084, 46, 'Río Mapire'),
(1085, 47, 'Piar Norte'),
(1086, 47, 'Piar Sur'),
(1087, 48, 'San Diego Este'),
(1088, 48, 'San Diego Oeste'),
(1089, 49, 'Puerto La Cruz Centro'),
(1090, 49, 'Paseo Colón'),
(1091, 50, 'Pozuelos Norte'),
(1092, 50, 'Pozuelos Sur'),
(1093, 51, 'Guaraguao Este'),
(1094, 51, 'Guaraguao Oeste'),
(1095, 52, 'Onoto Centro'),
(1096, 52, 'La Victoria'),
(1097, 53, 'San Pablo Norte'),
(1098, 53, 'San Pablo Sur'),
(1099, 54, 'La Trinchera Este'),
(1100, 54, 'La Trinchera Oeste'),
(1101, 55, 'San Mateo Centro'),
(1102, 55, 'El Progreso'),
(1103, 56, 'Lechería Norte'),
(1104, 56, 'Lechería Sur'),
(1105, 57, 'El Carito Este'),
(1106, 57, 'El Carito Oeste'),
(1107, 58, 'Clarines Centro'),
(1108, 58, 'Río Unare'),
(1109, 59, 'Guanape Norte'),
(1110, 59, 'Guanape Sur'),
(1111, 60, 'Sabana de Uchire Este'),
(1112, 60, 'Sabana de Uchire Oeste'),
(1113, 61, 'Cantaura Centro'),
(1114, 61, 'Zona Industrial'),
(1115, 62, 'Libertador Norte'),
(1116, 62, 'Libertador Sur'),
(1117, 63, 'Santa Rosa Este'),
(1118, 63, 'Santa Rosa Oeste'),
(1119, 64, 'Píritu Centro'),
(1120, 64, 'El Calvario'),
(1121, 65, 'San Francisco Este'),
(1122, 65, 'San Francisco Oeste'),
(1123, 66, 'El Tigrito Norte'),
(1124, 66, 'El Tigrito Sur'),
(1125, 67, 'San José Centro'),
(1126, 67, 'La Floresta'),
(1127, 68, 'El Tigre Norte'),
(1128, 68, 'El Tigre Sur'),
(1129, 69, 'Cantaura Este'),
(1130, 69, 'Cantaura Oeste'),
(1131, 70, 'Boca de Uchire Centro'),
(1132, 70, 'Playa Boca de Uchire'),
(1133, 71, 'Chacal Norte'),
(1134, 71, 'Chacal Sur'),
(1135, 80, 'La Montaña Este'),
(1136, 80, 'La Montaña Oeste'),
(1137, 81, 'Santa Ana Centro'),
(1138, 81, 'El Tamarindo'),
(1139, 82, 'La Encrucijada Norte'),
(1140, 82, 'La Encrucijada Sur'),
(1141, 83, 'San Juan Este'),
(1142, 83, 'San Juan Oeste'),
(1143, 84, 'El Carmen Centro'),
(1144, 84, 'Los Mangos'),
(1145, 85, 'San Cristóbal Norte'),
(1146, 85, 'San Cristóbal Sur'),
(1147, 86, 'Bergantín Este'),
(1148, 86, 'Bergantín Oeste'),
(1149, 87, 'Edmundo Barrios Centro'),
(1150, 87, 'La Esperanza'),
(1151, 88, 'El Tigre Norte'),
(1152, 88, 'El Tigre Sur'),
(1153, 89, 'Puerto Ordaz Este'),
(1154, 89, 'Puerto Ordaz Oeste'),
(1155, 90, 'Achaguas Centro'),
(1156, 90, 'Barrio El Progreso'),
(1157, 91, 'Guarico Norte'),
(1158, 91, 'Guarico Sur'),
(1159, 92, 'Mantecal Este'),
(1160, 92, 'Mantecal Oeste'),
(1161, 93, 'Biruaca Centro'),
(1162, 93, 'Barrio Libertador'),
(1163, 94, 'San Juan de Payara Norte'),
(1164, 94, 'San Juan de Payara Sur'),
(1165, 95, 'El Yagual Este'),
(1166, 95, 'El Yagual Oeste'),
(1167, 96, 'Muñoz Centro'),
(1168, 96, 'Barrio Bolívar'),
(1169, 97, 'Bruzual Norte'),
(1170, 97, 'Bruzual Sur'),
(1171, 98, 'Elorza Este'),
(1172, 98, 'Elorza Oeste'),
(1173, 99, 'Guasdualito Centro'),
(1174, 99, 'Barrio El Carmen'),
(1175, 100, 'Aramendi Norte'),
(1176, 100, 'Aramendi Sur'),
(1177, 101, 'El Amparo Este'),
(1178, 101, 'El Amparo Oeste'),
(1179, 102, 'San Juan de Payara Centro'),
(1180, 102, 'Barrio Nuevo'),
(1181, 103, 'La Trinidad de Orichuna Norte'),
(1182, 103, 'La Trinidad de Orichuna Sur'),
(1183, 104, 'Mata de Caña Este'),
(1184, 104, 'Mata de Caña Oeste'),
(1185, 105, 'Elorza Centro'),
(1186, 105, 'Barrio La Victoria'),
(1187, 106, 'El Viento Norte'),
(1188, 106, 'El Viento Sur'),
(1189, 107, 'Guachara Este'),
(1190, 107, 'Guachara Oeste'),
(1191, 108, 'San Fernando Centro'),
(1192, 108, 'Barrio El Recreo'),
(1193, 109, 'El Recreo Norte'),
(1194, 109, 'El Recreo Sur'),
(1195, 110, 'San Rafael de Atamaica Este'),
(1196, 110, 'San Rafael de Atamaica Oeste'),
(1197, 111, 'San Mateo Centro'),
(1198, 111, 'La Aragüita'),
(1199, 112, 'El Consejo Norte'),
(1200, 112, 'El Consejo Sur'),
(1201, 113, 'Augusto Mijares Este'),
(1202, 113, 'Augusto Mijares Oeste'),
(1203, 114, 'Camatagua Centro'),
(1204, 114, 'Río Guárico'),
(1205, 115, 'Carmen de Cura Norte'),
(1206, 115, 'Carmen de Cura Sur'),
(1207, 116, 'Urdaneta Este'),
(1208, 116, 'Urdaneta Oeste'),
(1209, 117, 'Santa Rita Centro'),
(1210, 117, 'Barrio Nuevo'),
(1211, 118, 'Francisco de Miranda Norte'),
(1212, 118, 'Francisco de Miranda Sur'),
(1213, 119, 'Monseñor Feliciano Norte'),
(1214, 119, 'Monseñor Feliciano Sur'),
(1215, 120, 'Choroní Centro'),
(1216, 120, 'Playa Grande'),
(1217, 121, 'El Limón Norte'),
(1218, 121, 'El Limón Sur'),
(1219, 122, 'Las Delicias Este'),
(1220, 122, 'Las Delicias Oeste'),
(1221, 123, 'Santa Cruz Centro'),
(1222, 123, 'Barrio Unión'),
(1223, 124, 'La Pica Norte'),
(1224, 124, 'La Pica Sur'),
(1225, 125, 'Chuao Este'),
(1226, 125, 'Chuao Oeste'),
(1227, 126, 'La Victoria Centro'),
(1228, 126, 'San Martín'),
(1229, 127, 'Castor Nieves Ríos Norte'),
(1230, 127, 'Castor Nieves Ríos Sur'),
(1231, 128, 'Las Mercedes Este'),
(1232, 128, 'Las Mercedes Oeste'),
(1233, 129, 'El Consejo Centro'),
(1234, 129, 'Barrio Bolívar'),
(1235, 130, 'San Pablo Norte'),
(1236, 130, 'San Pablo Sur'),
(1237, 131, 'Punta Brava Este'),
(1238, 131, 'Punta Brava Oeste'),
(1239, 132, 'Palo Negro Centro'),
(1240, 132, 'Zona Industrial'),
(1241, 133, 'San Martín Norte'),
(1242, 133, 'San Martín Sur'),
(1243, 134, 'Santa Inés Este'),
(1244, 134, 'Santa Inés Oeste'),
(1245, 135, 'El Limón Centro'),
(1246, 135, 'Urbanización El Castaño'),
(1247, 136, 'Caña de Azúcar Norte'),
(1248, 136, 'Caña de Azúcar Sur'),
(1249, 137, 'La Victoria Este'),
(1250, 137, 'La Victoria Oeste'),
(1251, 138, 'Ocumare Centro'),
(1252, 138, 'Playa Cata'),
(1253, 139, 'El Limón Norte'),
(1254, 139, 'El Limón Sur'),
(1255, 140, 'Cata Este'),
(1256, 140, 'Cata Oeste'),
(1257, 141, 'San Casimiro Centro'),
(1258, 141, 'Barrio El Calvario'),
(1259, 142, 'Guiripa Norte'),
(1260, 142, 'Guiripa Sur'),
(1261, 143, 'Valle Morín Este'),
(1262, 143, 'Valle Morín Oeste'),
(1263, 144, 'San Sebastián Centro'),
(1264, 144, 'Barrio El Progreso'),
(1265, 145, 'Guayabal Norte'),
(1266, 145, 'Guayabal Sur'),
(1267, 146, 'Quiroz Este'),
(1268, 146, 'Quiroz Oeste'),
(1269, 147, 'Turmero Centro'),
(1270, 147, 'Urbanización Mariño'),
(1271, 148, 'Arevalo Aponte Norte'),
(1272, 148, 'Arevalo Aponte Sur'),
(1273, 149, 'Chuao Este'),
(1274, 149, 'Chuao Oeste'),
(1275, 150, 'Las Tejerías Centro'),
(1276, 150, 'Zona Industrial'),
(1277, 151, 'Tiara Norte'),
(1278, 151, 'Tiara Sur'),
(1279, 152, 'La Victoria Este'),
(1280, 152, 'La Victoria Oeste'),
(1281, 153, 'Cagua Centro'),
(1282, 153, 'Barrio Sucre'),
(1283, 154, 'Bella Vista Norte'),
(1284, 154, 'Bella Vista Sur'),
(1285, 155, 'Chuao Este'),
(1286, 155, 'Chuao Oeste'),
(1287, 156, 'Colonia Tovar Centro'),
(1288, 156, 'Sector Alemán'),
(1289, 157, 'El Cedral Norte'),
(1290, 157, 'El Cedral Sur'),
(1291, 158, 'La Montaña Este'),
(1292, 158, 'La Montaña Oeste'),
(1293, 159, 'Barbacoas Centro'),
(1294, 159, 'Barrio El Rincón'),
(1295, 160, 'Las Peñitas Norte'),
(1296, 160, 'Las Peñitas Sur'),
(1297, 161, 'San Casimiro Este'),
(1298, 161, 'San Casimiro Oeste'),
(1299, 162, 'Villa de Cura Centro'),
(1300, 162, 'Barrio Bolívar'),
(1301, 163, 'Magdaleno Norte'),
(1302, 163, 'Magdaleno Sur'),
(1303, 164, 'San Francisco Este'),
(1304, 164, 'San Francisco Oeste'),
(1305, 165, 'Sabaneta Centro'),
(1306, 165, 'Barrio La Esperanza'),
(1307, 166, 'Rodríguez Domínguez Norte'),
(1308, 166, 'Rodríguez Domínguez Sur'),
(1309, 167, 'Barinas Norte'),
(1310, 167, 'Barinas Sur'),
(1311, 168, 'El Cantón Centro'),
(1312, 168, 'Barrio Bolívar'),
(1313, 169, 'Santa Cruz de Guacas Este'),
(1314, 169, 'Santa Cruz de Guacas Oeste'),
(1315, 170, 'Puerto Vivas Norte'),
(1316, 170, 'Puerto Vivas Sur'),
(1317, 171, 'Socopó Centro'),
(1318, 171, 'Zona Industrial'),
(1319, 172, 'Ticoporo Norte'),
(1320, 172, 'Ticoporo Sur'),
(1321, 173, 'Nicolás Pulido Este'),
(1322, 173, 'Nicolás Pulido Oeste'),
(1323, 174, 'Arismendi Centro'),
(1324, 174, 'Barrio El Progreso'),
(1325, 175, 'Arismendi de Caicara Norte'),
(1326, 175, 'Arismendi de Caicara Sur'),
(1327, 176, 'Chaguaramo Este'),
(1328, 176, 'Chaguaramo Oeste'),
(1329, 177, 'Alto Barinas Centro'),
(1330, 177, 'Urbanización El Recreo'),
(1331, 178, 'Barinas Norte'),
(1332, 178, 'Barinas Sur'),
(1333, 179, 'Corazón de Jesús Este'),
(1334, 179, 'Corazón de Jesús Oeste'),
(1335, 180, 'Barinitas Centro'),
(1336, 180, 'Barrio Sucre'),
(1337, 181, 'Altamira de Cáceres Norte'),
(1338, 181, 'Altamira de Cáceres Sur'),
(1339, 182, 'Calderas Este'),
(1340, 182, 'Calderas Oeste'),
(1341, 183, 'Barrancas Centro'),
(1342, 183, 'Barrio El Carmen'),
(1343, 184, 'El Socorro Norte'),
(1344, 184, 'El Socorro Sur'),
(1345, 185, 'Santa Bárbara Este'),
(1346, 185, 'Santa Bárbara Oeste'),
(1347, 186, 'Santa Bárbara Centro'),
(1348, 186, 'Barrio Libertador'),
(1349, 187, 'Pedraza La Vieja Norte'),
(1350, 187, 'Pedraza La Vieja Sur'),
(1351, 188, 'Ciudad Bolivia Este'),
(1352, 188, 'Ciudad Bolivia Oeste'),
(1353, 189, 'Obispos Centro'),
(1354, 189, 'Barrio Nuevo'),
(1355, 190, 'El Real Norte'),
(1356, 190, 'El Real Sur'),
(1357, 191, 'Los Guasimitos Este'),
(1358, 191, 'Los Guasimitos Oeste'),
(1359, 192, 'Ciudad Bolivia Centro'),
(1360, 192, 'Barrio El Rincón'),
(1361, 193, 'Iglesia Norte'),
(1362, 193, 'Iglesia Sur'),
(1363, 194, 'José Ignacio del Pumar Este'),
(1364, 194, 'José Ignacio del Pumar Oeste'),
(1365, 195, 'Libertad Centro'),
(1366, 195, 'Barrio Unión'),
(1367, 196, 'Dolores Norte'),
(1368, 196, 'Dolores Sur'),
(1369, 197, 'Palacio Fajardo Este'),
(1370, 197, 'Palacio Fajardo Oeste'),
(1371, 198, 'Ciudad de Nutrias Centro'),
(1372, 198, 'Barrio El Progreso'),
(1373, 199, 'El Regalo Norte'),
(1374, 199, 'El Regalo Sur'),
(1375, 200, 'Puerto de Nutrias Este'),
(1376, 200, 'Puerto de Nutrias Oeste'),
(1377, 201, 'Cachamay Centro'),
(1378, 201, 'Unare'),
(1379, 202, 'Chirica Norte'),
(1380, 202, 'Chirica Sur'),
(1381, 203, 'Dalla Costa Este'),
(1382, 203, 'Dalla Costa Oeste'),
(1383, 204, 'Caicara Centro'),
(1384, 204, 'Río Orinoco'),
(1385, 205, 'Altagracia Norte'),
(1386, 205, 'Altagracia Sur'),
(1387, 206, 'Ascensión Farreras Este'),
(1388, 206, 'Ascensión Farreras Oeste'),
(1389, 207, 'El Callao Centro'),
(1390, 207, 'Minas de Oro'),
(1391, 208, 'El Dorado Norte'),
(1392, 208, 'El Dorado Sur'),
(1393, 209, 'Tumeremo Este'),
(1394, 209, 'Tumeremo Oeste'),
(1395, 210, 'Santa Elena Centro'),
(1396, 210, 'Frontera Brasil'),
(1397, 211, 'Ikabarú Norte'),
(1398, 211, 'Ikabarú Sur'),
(1399, 212, 'Urimán Este'),
(1400, 212, 'Urimán Oeste'),
(1401, 213, 'Catedral Centro'),
(1402, 213, 'Paseo Orinoco'),
(1403, 214, 'Zea Norte'),
(1404, 214, 'Zea Sur'),
(1405, 215, 'Panapana Este'),
(1406, 215, 'Panapana Oeste'),
(1407, 216, 'Upata Centro'),
(1408, 216, 'Andrés Bello'),
(1409, 217, 'El Pao Norte'),
(1410, 217, 'El Pao Sur'),
(1411, 218, 'Andrés Eloy Blanco Este'),
(1412, 218, 'Andrés Eloy Blanco Oeste'),
(1413, 219, 'Ciudad Piar Centro'),
(1414, 219, 'Zona Minera'),
(1415, 220, 'Raúl Leoni Norte'),
(1416, 220, 'Raúl Leoni Sur'),
(1417, 221, 'La Paragua Este'),
(1418, 221, 'La Paragua Oeste'),
(1419, 222, 'Guasipati Centro'),
(1420, 222, 'El Mango'),
(1421, 223, 'Salto La Llovizna Norte'),
(1422, 223, 'Salto La Llovizna Sur'),
(1423, 224, 'San Isidro Este'),
(1424, 224, 'San Isidro Oeste'),
(1425, 225, 'Tumeremo Centro'),
(1426, 225, 'El Perú'),
(1427, 226, 'Dalla Costa Norte'),
(1428, 226, 'Dalla Costa Sur'),
(1429, 227, 'El Dorado Este'),
(1430, 227, 'El Dorado Oeste'),
(1431, 228, 'Maripa Centro'),
(1432, 228, 'Río Caura'),
(1433, 229, 'Las Majadas Norte'),
(1434, 229, 'Las Majadas Sur'),
(1435, 230, 'Santa Rosa Este'),
(1436, 230, 'Santa Rosa Oeste'),
(1437, 231, 'El Palmar Centro'),
(1438, 231, 'Frontera Colombia'),
(1439, 232, 'Padre Pedro Chien Norte'),
(1440, 232, 'Padre Pedro Chien Sur'),
(1441, 233, 'Santa Cruz Este'),
(1442, 233, 'Santa Cruz Oeste'),
(1443, 234, 'Bejuma Centro'),
(1444, 234, 'El Potrero'),
(1445, 235, 'Canoabo Norte'),
(1446, 235, 'Canoabo Sur'),
(1447, 236, 'Simón Bolívar Este'),
(1448, 236, 'Simón Bolívar Oeste'),
(1449, 237, 'Güigüe Centro'),
(1450, 237, 'Barrio Bolívar'),
(1451, 238, 'Belén Norte'),
(1452, 238, 'Belén Sur'),
(1453, 239, 'Tacarigua Este'),
(1454, 239, 'Tacarigua Oeste'),
(1455, 240, 'Mariara Centro'),
(1456, 240, 'Zona Industrial'),
(1457, 241, 'Aguas Calientes Norte'),
(1458, 241, 'Aguas Calientes Sur'),
(1459, 242, 'San Joaquín Este'),
(1460, 242, 'San Joaquín Oeste'),
(1461, 243, 'Guacara Centro'),
(1462, 243, 'Urbanización La Isabelica'),
(1463, 244, 'Yagua Norte'),
(1464, 244, 'Yagua Sur'),
(1465, 245, 'Ciudad Alianza Este'),
(1466, 245, 'Ciudad Alianza Oeste'),
(1467, 246, 'Morón Centro'),
(1468, 246, 'Puerto Morón'),
(1469, 247, 'Urama Norte'),
(1470, 247, 'Urama Sur'),
(1471, 248, 'Yaracuy Este'),
(1472, 248, 'Yaracuy Oeste'),
(1473, 249, 'Tocuyito Centro'),
(1474, 249, 'Barrio San José'),
(1475, 250, 'Independencia Norte'),
(1476, 250, 'Independencia Sur'),
(1477, 251, 'Los Naranjos Este'),
(1478, 251, 'Los Naranjos Oeste'),
(1479, 252, 'Los Guayos Centro'),
(1480, 252, 'Urbanización El Samán'),
(1481, 253, 'Las Vegas Norte'),
(1482, 253, 'Las Vegas Sur'),
(1483, 254, 'Parque Industrial Este'),
(1484, 254, 'Parque Industrial Oeste'),
(1485, 255, 'Miranda Centro'),
(1486, 255, 'Barrio El Carmen'),
(1487, 256, 'El Toco Norte'),
(1488, 256, 'El Toco Sur'),
(1489, 257, 'La Aguada Este'),
(1490, 257, 'La Aguada Oeste'),
(1491, 258, 'Montalbán Centro'),
(1492, 258, 'Barrio El Rincón'),
(1493, 259, 'La Yaguara Norte'),
(1494, 259, 'La Yaguara Sur'),
(1495, 260, 'Monseñor Castro Este'),
(1496, 260, 'Monseñor Castro Oeste'),
(1497, 261, 'Naguanagua Centro'),
(1498, 261, 'Urbanización La Granja'),
(1499, 262, 'La Campiña Norte'),
(1500, 262, 'La Campiña Sur'),
(1501, 263, 'Mañongo Este'),
(1502, 263, 'Mañongo Oeste'),
(1503, 264, 'Bartolomé Salom Centro'),
(1504, 264, 'Zona Portuaria'),
(1505, 265, 'Borburata Norte'),
(1506, 265, 'Borburata Sur'),
(1507, 266, 'Fraternidad Este'),
(1508, 266, 'Fraternidad Oeste'),
(1509, 267, 'San Diego Centro'),
(1510, 267, 'Urbanización El Trigal'),
(1511, 268, 'Yaracuy Norte'),
(1512, 268, 'Yaracuy Sur'),
(1513, 269, 'La Cumaca Este'),
(1514, 269, 'La Cumaca Oeste'),
(1515, 270, 'San Joaquín Centro'),
(1516, 270, 'Barrio Nuevo'),
(1517, 271, 'Los Palos Grandes Norte'),
(1518, 271, 'Los Palos Grandes Sur'),
(1519, 272, 'La Pradera Este'),
(1520, 272, 'La Pradera Oeste'),
(1521, 273, 'Candelaria Centro'),
(1522, 273, 'Urbanización El Viñedo'),
(1523, 274, 'Catedral Norte'),
(1524, 274, 'Catedral Sur'),
(1525, 275, 'El Socorro Este'),
(1526, 275, 'El Socorro Oeste'),
(1527, 276, 'Cojedes Centro'),
(1528, 276, 'Barrio El Progreso'),
(1529, 277, 'El Baúl Norte'),
(1530, 277, 'El Baúl Sur'),
(1531, 278, 'La Aguadita Este'),
(1532, 278, 'La Aguadita Oeste'),
(1533, 279, 'El Pao Centro'),
(1534, 279, 'Zona Agrícola'),
(1535, 280, 'Manrique Norte'),
(1536, 280, 'Manrique Sur'),
(1537, 281, 'Las Vegas Este'),
(1538, 281, 'Las Vegas Oeste'),
(1539, 282, 'Tinaquillo Centro'),
(1540, 282, 'Urbanización La Florida'),
(1541, 283, 'Macapo Norte'),
(1542, 283, 'Macapo Sur'),
(1543, 284, 'La Candelaria Este'),
(1544, 284, 'La Candelaria Oeste'),
(1545, 285, 'El Baúl Centro'),
(1546, 285, 'Barrio Bolívar'),
(1547, 286, 'Sucre Norte'),
(1548, 286, 'Sucre Sur'),
(1549, 287, 'El Baúl Abajo Este'),
(1550, 287, 'El Baúl Abajo Oeste'),
(1551, 288, 'Macapo Centro'),
(1552, 288, 'Barrio Unión'),
(1553, 289, 'La Aguadita Norte'),
(1554, 289, 'La Aguadita Sur'),
(1555, 290, 'El Limón Este'),
(1556, 290, 'El Limón Oeste'),
(1557, 291, 'Libertad Centro'),
(1558, 291, 'Barrio Nuevo'),
(1559, 292, 'Ricaurte Norte'),
(1560, 292, 'Ricaurte Sur'),
(1561, 293, 'Las Vegas Este'),
(1562, 293, 'Las Vegas Oeste'),
(1563, 294, 'Las Vegas Centro'),
(1564, 294, 'Zona Ganadera'),
(1565, 295, 'El Pao Norte'),
(1566, 295, 'El Pao Sur'),
(1567, 296, 'Manrique Este'),
(1568, 296, 'Manrique Oeste'),
(1569, 297, 'San Carlos Centro'),
(1570, 297, 'Barrio El Carmen'),
(1571, 298, 'Juan Ángel Bravo Norte'),
(1572, 298, 'Juan Ángel Bravo Sur'),
(1573, 299, 'Manuel Manrique Este'),
(1574, 299, 'Manuel Manrique Oeste'),
(1575, 300, 'Tinaco Centro'),
(1576, 300, 'Barrio La Esperanza'),
(1577, 301, 'Macapo Norte'),
(1578, 301, 'Macapo Sur'),
(1579, 302, 'La Aguadita Este'),
(1580, 302, 'La Aguadita Oeste'),
(1581, 303, 'Curiapo Centro'),
(1582, 303, 'Barrio Warao'),
(1583, 304, 'Almirante Luis Brión Norte'),
(1584, 304, 'Almirante Luis Brión Sur'),
(1585, 305, 'Manuel Renaud Este'),
(1586, 305, 'Manuel Renaud Oeste'),
(1587, 306, 'Irapa Centro'),
(1588, 306, 'Zona Fluvial'),
(1589, 307, 'Manuel Piar Norte'),
(1590, 307, 'Manuel Piar Sur'),
(1591, 308, 'Vicente Díaz Este'),
(1592, 308, 'Vicente Díaz Oeste'),
(1593, 309, 'Pedernales Centro'),
(1594, 309, 'Barrio Delta'),
(1595, 310, 'Guasina Norte'),
(1596, 310, 'Guasina Sur'),
(1597, 311, 'Punta Pescador Este'),
(1598, 311, 'Punta Pescador Oeste'),
(1599, 312, 'San José Centro'),
(1600, 312, 'Barrio Mánamo'),
(1601, 313, 'San Rafael Norte'),
(1602, 313, 'San Rafael Sur'),
(1603, 315, 'Tucupita Este'),
(1604, 315, 'Tucupita Oeste'),
(1605, 316, 'San Juan Centro'),
(1606, 316, 'Barrio El Mangle'),
(1607, 317, 'Capadare Norte'),
(1608, 317, 'Capadare Sur'),
(1609, 318, 'La Vela Este'),
(1610, 318, 'La Vela Oeste'),
(1611, 319, 'San Luis Centro'),
(1612, 319, 'Barrio Libertador'),
(1613, 320, 'La Vela Norte'),
(1614, 320, 'La Vela Sur'),
(1615, 321, 'Bolívar Este'),
(1616, 321, 'Bolívar Oeste'),
(1617, 322, 'Capatárida Centro'),
(1618, 322, 'Barrio Nuevo'),
(1619, 323, 'San José de Seque Norte'),
(1620, 323, 'San José de Seque Sur'),
(1621, 324, 'Zazárida Este'),
(1622, 324, 'Zazárida Oeste'),
(1623, 325, 'La Vela de Coro Centro'),
(1624, 325, 'Barrio El Calvario'),
(1625, 326, 'Punta Cardón Norte'),
(1626, 326, 'Punta Cardón Sur'),
(1627, 327, 'San Luis Este'),
(1628, 327, 'San Luis Oeste'),
(1629, 328, 'Carirubana Centro'),
(1630, 328, 'Barrio Ziruma'),
(1631, 329, 'Norte Centro'),
(1632, 329, 'Urbanización Las Palmas'),
(1633, 330, 'Punta Cardón Este'),
(1634, 330, 'Punta Cardón Oeste'),
(1635, 331, 'La Vela de Coro Centro'),
(1636, 331, 'Paseo Alameda'),
(1637, 332, 'Acurigua Norte'),
(1638, 332, 'Acurigua Sur'),
(1639, 333, 'Guaibacoa Este'),
(1640, 333, 'Guaibacoa Oeste'),
(1641, 334, 'Dabajuro Centro'),
(1642, 334, 'Barrio El Progreso'),
(1643, 335, 'Hato Viejo Norte'),
(1644, 335, 'Hato Viejo Sur'),
(1645, 336, 'Urumaco Este'),
(1646, 336, 'Urumaco Oeste'),
(1647, 337, 'Pedregal Centro'),
(1648, 337, 'Barrio El Carmen'),
(1649, 338, 'Agua Larga Norte'),
(1650, 338, 'Agua Larga Sur'),
(1651, 339, 'Avaria Este'),
(1652, 339, 'Avaria Oeste'),
(1653, 340, 'Pueblo Nuevo Centro'),
(1654, 340, 'Barrio La Esperanza'),
(1655, 341, 'Adícora Norte'),
(1656, 341, 'Adícora Sur'),
(1657, 342, 'Jadacaquiva Este'),
(1658, 342, 'Jadacaquiva Oeste'),
(1659, 343, 'Churuguara Centro'),
(1660, 343, 'Barrio Bolívar'),
(1661, 344, 'Agua Larga Norte'),
(1662, 344, 'Agua Larga Sur'),
(1663, 345, 'El Paují Este'),
(1664, 345, 'El Paují Oeste'),
(1665, 346, 'Jacura Centro'),
(1666, 346, 'Barrio El Mango'),
(1667, 347, 'Agua Larga Norte'),
(1668, 347, 'Agua Larga Sur'),
(1669, 348, 'Araurima Este'),
(1670, 348, 'Araurima Oeste'),
(1671, 349, 'Judibana Centro'),
(1672, 349, 'Urbanización Costa Azul'),
(1673, 350, 'Los Taques Norte'),
(1674, 350, 'Los Taques Sur'),
(1675, 351, 'Villa Marina Este'),
(1676, 351, 'Villa Marina Oeste');
INSERT INTO `sector` (`id_sector`, `id_parroquia`, `nombre_sector`) VALUES
(1677, 352, 'Mene de Mauroa Centro'),
(1678, 352, 'Barrio El Rincón'),
(1679, 353, 'Casigua Norte'),
(1680, 353, 'Casigua Sur'),
(1681, 354, 'San Félix Este'),
(1682, 354, 'San Félix Oeste'),
(1683, 355, 'Coro Centro'),
(1684, 355, 'Barrio San Nicolás'),
(1685, 356, 'Mitare Norte'),
(1686, 356, 'Mitare Sur'),
(1687, 357, 'Sabana Larga Este'),
(1688, 357, 'Sabana Larga Oeste'),
(1689, 358, 'Chichiriviche Centro'),
(1690, 358, 'Zona Turística'),
(1691, 359, 'Boca de Aroa Norte'),
(1692, 359, 'Boca de Aroa Sur'),
(1693, 360, 'Tucacas Este'),
(1694, 360, 'Tucacas Oeste'),
(1695, 361, 'Palmasola Centro'),
(1696, 361, 'Barrio El Progreso'),
(1697, 362, 'El Silencio Norte'),
(1698, 362, 'El Silencio Sur'),
(1699, 363, 'El Tocuyo Este'),
(1700, 363, 'El Tocuyo Oeste'),
(1701, 364, 'Cabure Centro'),
(1702, 364, 'Barrio La Paz'),
(1703, 365, 'Colina Norte'),
(1704, 365, 'Colina Sur'),
(1705, 366, 'Sabaneta Este'),
(1706, 366, 'Sabaneta Oeste'),
(1707, 367, 'Píritu Centro'),
(1708, 367, 'Barrio El Carmen'),
(1709, 368, 'San José Norte'),
(1710, 368, 'San José Sur'),
(1711, 369, 'Puerta de Píritu Este'),
(1712, 369, 'Puerta de Píritu Oeste'),
(1713, 370, 'Mirimire Centro'),
(1714, 370, 'Barrio El Valle'),
(1715, 371, 'El Charal Norte'),
(1716, 371, 'El Charal Sur'),
(1717, 372, 'San Francisco Este'),
(1718, 372, 'San Francisco Oeste'),
(1719, 373, 'Tucacas Centro'),
(1720, 373, 'Zona Hotelera'),
(1721, 374, 'Boca de Aroa Norte'),
(1722, 374, 'Boca de Aroa Sur'),
(1723, 375, 'Chichiriviche Este'),
(1724, 375, 'Chichiriviche Oeste'),
(1725, 376, 'La Cruz de Taratara Centro'),
(1726, 376, 'Barrio El Hato'),
(1727, 377, 'Sucre Norte'),
(1728, 377, 'Sucre Sur'),
(1729, 378, 'Píritu Este'),
(1730, 378, 'Píritu Oeste'),
(1731, 379, 'Tocópero Centro'),
(1732, 379, 'Barrio La Cruz'),
(1733, 380, 'Aragüita Norte'),
(1734, 380, 'Aragüita Sur'),
(1735, 381, 'Tocuyito Este'),
(1736, 381, 'Tocuyito Oeste'),
(1737, 382, 'Santa Cruz de Bucaral Centro'),
(1738, 382, 'Barrio El Rincón'),
(1739, 383, 'Purureche Norte'),
(1740, 383, 'Purureche Sur'),
(1741, 384, 'El Charal Este'),
(1742, 384, 'El Charal Oeste'),
(1743, 385, 'Urumaco Centro'),
(1744, 385, 'Barrio El Mangle'),
(1745, 386, 'El Yabal Norte'),
(1746, 386, 'El Yabal Sur'),
(1747, 387, 'Casigua Este'),
(1748, 387, 'Casigua Oeste'),
(1749, 388, 'Puerto Cumarebo Centro'),
(1750, 388, 'Barrio El Puerto'),
(1751, 389, 'La Ciénaga Norte'),
(1752, 389, 'La Ciénaga Sur'),
(1753, 390, 'Pueblo Cumarebo Este'),
(1754, 390, 'Pueblo Cumarebo Oeste'),
(1755, 391, 'Camaguán Centro'),
(1756, 391, 'Barrio El Progreso'),
(1757, 392, 'Puerto de Nutrias Norte'),
(1758, 392, 'Puerto de Nutrias Sur'),
(1759, 393, 'El Rosario Este'),
(1760, 393, 'El Rosario Oeste'),
(1761, 394, 'Chaguaramas Centro'),
(1762, 394, 'Barrio Bolívar'),
(1763, 395, 'Camatagua Norte'),
(1764, 395, 'Camatagua Sur'),
(1765, 396, 'La Candelaria Este'),
(1766, 396, 'La Candelaria Oeste'),
(1767, 397, 'El Socorro Centro'),
(1768, 397, 'Barrio La Paz'),
(1769, 398, 'Tucupido Norte'),
(1770, 398, 'Tucupido Sur'),
(1771, 399, 'Santa María de Ipire Este'),
(1772, 399, 'Santa María de Ipire Oeste'),
(1773, 400, 'Calabozo Centro'),
(1774, 400, 'Urbanización La Manga'),
(1775, 401, 'El Rastro Norte'),
(1776, 401, 'El Rastro Sur'),
(1777, 402, 'Tucupido Este'),
(1778, 402, 'Tucupido Oeste'),
(1779, 403, 'Tucupido Centro'),
(1780, 403, 'Barrio San Rafael'),
(1781, 404, 'San Rafael de Laya Norte'),
(1782, 404, 'San Rafael de Laya Sur'),
(1783, 405, 'Valle de la Pascua Este'),
(1784, 405, 'Valle de la Pascua Oeste'),
(1785, 406, 'Altagracia de Orituco Centro'),
(1786, 406, 'Barrio El Calvario'),
(1787, 407, 'Lezama Norte'),
(1788, 407, 'Lezama Sur'),
(1789, 408, 'Paso Real de Macaira Este'),
(1790, 408, 'Paso Real de Macaira Oeste'),
(1791, 409, 'San Juan de los Morros Centro'),
(1792, 409, 'Urbanización La Arboleda'),
(1793, 410, 'Parapara Norte'),
(1794, 410, 'Parapara Sur'),
(1795, 411, 'Cantagallo Este'),
(1796, 411, 'Cantagallo Oeste'),
(1797, 412, 'El Sombrero Centro'),
(1798, 412, 'Barrio Unión'),
(1799, 413, 'Barbacoas Norte'),
(1800, 413, 'Barbacoas Sur'),
(1801, 414, 'San Francisco de Tiznados Este'),
(1802, 414, 'San Francisco de Tiznados Oeste'),
(1803, 415, 'Las Mercedes Centro'),
(1804, 415, 'Barrio El Rincón'),
(1805, 416, 'Cazorla Norte'),
(1806, 416, 'Cazorla Sur'),
(1807, 417, 'Tucupido Este'),
(1808, 417, 'Tucupido Oeste'),
(1809, 418, 'Valle de la Pascua Centro'),
(1810, 418, 'Urbanización Las Flores'),
(1811, 419, 'Espino Norte'),
(1812, 419, 'Espino Sur'),
(1813, 420, 'Santa María de Ipire Este'),
(1814, 420, 'Santa María de Ipire Oeste'),
(1815, 421, 'Zaraza Centro'),
(1816, 421, 'Barrio San José'),
(1817, 422, 'San José de Unare Norte'),
(1818, 422, 'San José de Unare Sur'),
(1819, 423, 'San Juan de los Morros Este'),
(1820, 423, 'San Juan de los Morros Oeste'),
(1821, 424, 'Ortíz Centro'),
(1822, 424, 'Barrio El Progreso'),
(1823, 425, 'San Francisco de Tiznados Norte'),
(1824, 425, 'San Francisco de Tiznados Sur'),
(1825, 426, 'Guayabal Este'),
(1826, 426, 'Guayabal Oeste'),
(1827, 427, 'San Gerónimo de Guayabal Centro'),
(1828, 427, 'Barrio La Esperanza'),
(1829, 428, 'Camaguán Norte'),
(1830, 428, 'Camaguán Sur'),
(1831, 429, 'Puerto de Nutrias Este'),
(1832, 429, 'Puerto de Nutrias Oeste'),
(1833, 430, 'San José de Guaribe Centro'),
(1834, 430, 'Barrio Nuevo'),
(1835, 431, 'San José Norte'),
(1836, 431, 'San José Sur'),
(1837, 432, 'Altagracia de Orituco Este'),
(1838, 432, 'Altagracia de Orituco Oeste'),
(1839, 433, 'Santa María de Ipire Centro'),
(1840, 433, 'Barrio Bolívar'),
(1841, 434, 'Zaraza Norte'),
(1842, 434, 'Zaraza Sur'),
(1843, 435, 'Pariaguán Este'),
(1844, 435, 'Pariaguán Oeste'),
(1845, 436, 'Sanare Centro'),
(1846, 436, 'Sector La Toma'),
(1847, 437, 'Pío Tamayo Norte'),
(1848, 437, 'Pío Tamayo Sur'),
(1849, 438, 'Yacambú Este'),
(1850, 438, 'Yacambú Oeste'),
(1851, 439, 'Duaca Centro'),
(1852, 439, 'Barrio El Progreso'),
(1853, 440, 'Crespo Norte'),
(1854, 440, 'Crespo Sur'),
(1855, 441, 'Agua Salada Este'),
(1856, 441, 'Agua Salada Oeste'),
(1857, 442, 'Concepción Centro'),
(1858, 442, 'Urbanización La Carucieña'),
(1859, 443, 'Aguedo Felipe Alvarado Norte'),
(1860, 443, 'Aguedo Felipe Alvarado Sur'),
(1861, 444, 'Buena Vista Este'),
(1862, 444, 'Buena Vista Oeste'),
(1863, 445, 'Quíbor Centro'),
(1864, 445, 'Barrio Pueblo Nuevo'),
(1865, 446, 'Cubiro Norte'),
(1866, 446, 'Cubiro Sur'),
(1867, 447, 'José Bernardo Dorante Este'),
(1868, 447, 'José Bernardo Dorante Oeste'),
(1869, 448, 'El Tocuyo Centro'),
(1870, 448, 'Barrio La Cruz'),
(1871, 449, 'Anzoátegui Norte'),
(1872, 449, 'Anzoátegui Sur'),
(1873, 450, 'Guarico Este'),
(1874, 450, 'Guarico Oeste'),
(1875, 451, 'Cabudare Centro'),
(1876, 451, 'Urbanización El Manzano'),
(1877, 452, 'José Gregorio Bastidas Norte'),
(1878, 452, 'José Gregorio Bastidas Sur'),
(1879, 453, 'La Piedad Este'),
(1880, 453, 'La Piedad Oeste'),
(1881, 454, 'Sarare Centro'),
(1882, 454, 'Barrio Unión'),
(1883, 455, 'Buría Norte'),
(1884, 455, 'Buría Sur'),
(1885, 456, 'Gustavo Vegas León Este'),
(1886, 456, 'Gustavo Vegas León Oeste'),
(1887, 457, 'Carora Centro'),
(1888, 457, 'Barrio San Juan'),
(1889, 458, 'Camacaro Norte'),
(1890, 458, 'Camacaro Sur'),
(1891, 459, 'Espinoza de los Monteros Este'),
(1892, 459, 'Espinoza de los Monteros Oeste'),
(1893, 460, 'Siquisique Centro'),
(1894, 460, 'Barrio La Esperanza'),
(1895, 461, 'Moroturo Norte'),
(1896, 461, 'Moroturo Sur'),
(1897, 462, 'San Miguel Este'),
(1898, 462, 'San Miguel Oeste'),
(1899, 463, 'El Vigía Centro'),
(1900, 463, 'Urbanización Los Andes'),
(1901, 464, 'Presidente Betancourt Norte'),
(1902, 464, 'Presidente Betancourt Sur'),
(1903, 465, 'Presidente Párez Este'),
(1904, 465, 'Presidente Párez Oeste'),
(1905, 466, 'La Azulita Centro'),
(1906, 466, 'Barrio El Progreso'),
(1907, 467, 'Santiago de la Punta Norte'),
(1908, 467, 'Santiago de la Punta Sur'),
(1909, 468, 'San Rafael de Tabay Este'),
(1910, 468, 'San Rafael de Tabay Oeste'),
(1911, 469, 'Santa Cruz de Mora Centro'),
(1912, 469, 'Barrio Bolívar'),
(1913, 470, 'Mesa de Las Palmas Norte'),
(1914, 470, 'Mesa de Las Palmas Sur'),
(1915, 471, 'San Pedro del Lagunillas Este'),
(1916, 471, 'San Pedro del Lagunillas Oeste'),
(1917, 472, 'Aricagua Centro'),
(1918, 472, 'Barrio La Paz'),
(1919, 473, 'San Pablo Norte'),
(1920, 473, 'San Pablo Sur'),
(1921, 474, 'Guaraque Este'),
(1922, 474, 'Guaraque Oeste'),
(1923, 475, 'Canaguá Centro'),
(1924, 475, 'Sector El Valle'),
(1925, 476, 'Mucutuy Norte'),
(1926, 476, 'Mucutuy Sur'),
(1927, 477, 'Quino Este'),
(1928, 477, 'Quino Oeste'),
(1929, 478, 'Ejido Centro'),
(1930, 478, 'Urbanización Los Sauces'),
(1931, 479, 'Fernández Peña Norte'),
(1932, 479, 'Fernández Peña Sur'),
(1933, 480, 'Matriz Este'),
(1934, 480, 'Matriz Oeste'),
(1935, 481, 'Tucaní Centro'),
(1936, 481, 'Barrio Nuevo'),
(1937, 482, 'Florencio Ramírez Norte'),
(1938, 482, 'Florencio Ramírez Sur'),
(1939, 483, 'Tovar Este'),
(1940, 483, 'Tovar Oeste'),
(1941, 484, 'Santo Domingo Centro'),
(1942, 484, 'Sector Los Nevados'),
(1943, 485, 'Las Piedras Norte'),
(1944, 485, 'Las Piedras Sur'),
(1945, 486, 'Mesa de Quintero Este'),
(1946, 486, 'Mesa de Quintero Oeste'),
(1947, 487, 'Guaraque Centro'),
(1948, 487, 'Barrio La Esperanza'),
(1949, 488, 'Mesa de Quintero Norte'),
(1950, 488, 'Mesa de Quintero Sur'),
(1951, 489, 'Río Negro Este'),
(1952, 489, 'Río Negro Oeste'),
(1953, 490, 'Arapuey Centro'),
(1954, 490, 'Barrio El Carmen'),
(1955, 491, 'San Rafael de Onoto Norte'),
(1956, 491, 'San Rafael de Onoto Sur'),
(1957, 492, 'Palmarito Este'),
(1958, 492, 'Palmarito Oeste'),
(1959, 493, 'Torondoy Centro'),
(1960, 493, 'Barrio La Cruz'),
(1961, 494, 'Santa Elena de Arenales Norte'),
(1962, 494, 'Santa Elena de Arenales Sur'),
(1963, 495, 'Río Chiquito Este'),
(1964, 495, 'Río Chiquito Oeste'),
(1965, 496, 'El Llano Centro'),
(1966, 496, 'Urbanización La Parroquia'),
(1967, 497, 'Gonzalo Picón Febres Norte'),
(1968, 497, 'Gonzalo Picón Febres Sur'),
(1969, 498, 'Caracciolo Parra Pérez Este'),
(1970, 498, 'Caracciolo Parra Pérez Oeste'),
(1971, 499, 'Timotes Centro'),
(1972, 499, 'Barrio El Progreso'),
(1973, 500, 'La Mesa de Esnujaque Norte'),
(1974, 500, 'La Mesa de Esnujaque Sur'),
(1975, 501, 'Mocotíes Este'),
(1976, 501, 'Mocotíes Oeste'),
(1977, 502, 'Santa Elena de Arenales Centro'),
(1978, 502, 'Barrio Bolívar'),
(1979, 503, 'Eloy Paredes Norte'),
(1980, 503, 'Eloy Paredes Sur'),
(1981, 504, 'San Rafael de Alcántara Este'),
(1982, 504, 'San Rafael de Alcántara Oeste'),
(1983, 505, 'Santa María de Caparo Centro'),
(1984, 505, 'Sector El Páramo'),
(1985, 506, 'Mesa de Las Palmas Norte'),
(1986, 506, 'Mesa de Las Palmas Sur'),
(1987, 507, 'Pueblo Llano Este'),
(1988, 507, 'Pueblo Llano Oeste'),
(1989, 508, 'Pueblo Llano Centro'),
(1990, 508, 'Barrio La Paz'),
(1991, 509, 'Mesa de Quintero Norte'),
(1992, 509, 'Mesa de Quintero Sur'),
(1993, 510, 'Chiguará Este'),
(1994, 510, 'Chiguará Oeste'),
(1995, 511, 'Mucuchíes Centro'),
(1996, 511, 'Barrio San Rafael'),
(1997, 512, 'San Rafael Norte'),
(1998, 512, 'San Rafael Sur'),
(1999, 513, 'Gavidia Este'),
(2000, 513, 'Gavidia Oeste'),
(2001, 514, 'Bailadores Centro'),
(2002, 514, 'Barrio El Carmen'),
(2003, 515, 'Mariño Norte'),
(2004, 515, 'Mariño Sur'),
(2005, 516, 'La Playa Este'),
(2006, 516, 'La Playa Oeste'),
(2007, 517, 'Tabay Centro'),
(2008, 517, 'Sector La Venta'),
(2009, 518, 'La Venta Norte'),
(2010, 518, 'La Venta Sur'),
(2011, 519, 'El Molino Este'),
(2012, 519, 'El Molino Oeste'),
(2013, 520, 'Lagunillas Centro'),
(2014, 520, 'Barrio Nuevo'),
(2015, 521, 'Chiguará Norte'),
(2016, 521, 'Chiguará Sur'),
(2017, 522, 'San Juan Este'),
(2018, 522, 'San Juan Oeste'),
(2019, 523, 'Tovar Centro'),
(2020, 523, 'Urbanización El Amparo'),
(2021, 524, 'El Amparo Norte'),
(2022, 524, 'El Amparo Sur'),
(2023, 525, 'San Francisco Este'),
(2024, 525, 'San Francisco Oeste'),
(2025, 526, 'Nueva Bolivia Centro'),
(2026, 526, 'Barrio La Esperanza'),
(2027, 527, 'Independencia Norte'),
(2028, 527, 'Independencia Sur'),
(2029, 528, 'Santa Apolonia Este'),
(2030, 528, 'Santa Apolonia Oeste'),
(2031, 529, 'Zea Centro'),
(2032, 529, 'Barrio El Rincón'),
(2033, 530, 'Caño Tigre Norte'),
(2034, 530, 'Caño Tigre Sur'),
(2035, 531, 'El Amparo Este'),
(2036, 531, 'El Amparo Oeste'),
(2037, 532, 'Caucagua Centro'),
(2038, 532, 'Barrio El Rincón'),
(2039, 533, 'Aragüita Norte'),
(2040, 533, 'Aragüita Sur'),
(2041, 534, 'Arévalo González Este'),
(2042, 534, 'Arévalo González Oeste'),
(2043, 535, 'San José de Barlovento Centro'),
(2044, 535, 'Barrio El Carmen'),
(2045, 536, 'Cumbo Norte'),
(2046, 536, 'Cumbo Sur'),
(2047, 537, 'Panaquire Este'),
(2048, 537, 'Panaquire Oeste'),
(2049, 538, 'Baruta Centro'),
(2050, 538, 'Urbanización Las Mercedes'),
(2051, 539, 'El Cafetal Norte'),
(2052, 539, 'El Cafetal Sur'),
(2053, 540, 'Las Minas de Baruta Este'),
(2054, 540, 'Las Minas de Baruta Oeste'),
(2055, 541, 'Higuerote Centro'),
(2056, 541, 'Zona Costera'),
(2057, 542, 'Curiepe Norte'),
(2058, 542, 'Curiepe Sur'),
(2059, 543, 'Tacarigua de Mamporal Este'),
(2060, 543, 'Tacarigua de Mamporal Oeste'),
(2061, 544, 'Mamporal Centro'),
(2062, 544, 'Barrio Nuevo'),
(2063, 545, 'El Pao Norte'),
(2064, 545, 'El Pao Sur'),
(2065, 546, 'San Juan de Guatire Este'),
(2066, 546, 'San Juan de Guatire Oeste'),
(2067, 547, 'Carrizal Centro'),
(2068, 547, 'Urbanización La Mata'),
(2069, 548, 'Los Teques Norte'),
(2070, 548, 'Los Teques Sur'),
(2071, 549, 'El Volcancito Este'),
(2072, 549, 'El Volcancito Oeste'),
(2073, 550, 'Chacao Centro'),
(2074, 550, 'Urbanización Altamira'),
(2075, 551, 'Altamira Norte'),
(2076, 551, 'Altamira Sur'),
(2077, 552, 'El Rosal Este'),
(2078, 552, 'El Rosal Oeste'),
(2079, 553, 'Charallave Centro'),
(2080, 553, 'Barrio Las Brisas'),
(2081, 554, 'Las Brisas Norte'),
(2082, 554, 'Las Brisas Sur'),
(2083, 555, 'La Democracia Este'),
(2084, 555, 'La Democracia Oeste'),
(2085, 556, 'El Hatillo Centro'),
(2086, 556, 'Urbanización La Lagunita'),
(2087, 557, 'La Lagunita Norte'),
(2088, 557, 'La Lagunita Sur'),
(2089, 558, 'La Unión Este'),
(2090, 558, 'La Unión Oeste'),
(2091, 559, 'Los Teques Centro'),
(2092, 559, 'Barrio San Pedro'),
(2093, 560, 'Altagracia de la Montaña Norte'),
(2094, 560, 'Altagracia de la Montaña Sur'),
(2095, 561, 'San Pedro Este'),
(2096, 561, 'San Pedro Oeste'),
(2097, 562, 'Santa Teresa Centro'),
(2098, 562, 'Barrio El Cartanal'),
(2099, 563, 'El Cartanal Norte'),
(2100, 563, 'El Cartanal Sur'),
(2101, 564, 'Las Rosas Este'),
(2102, 564, 'Las Rosas Oeste'),
(2103, 565, 'Ocumare Centro'),
(2104, 565, 'Urbanización La Democracia'),
(2105, 566, 'La Democracia Norte'),
(2106, 566, 'La Democracia Sur'),
(2107, 567, 'Santa Bárbara Este'),
(2108, 567, 'Santa Bárbara Oeste'),
(2109, 568, 'San Antonio Centro'),
(2110, 568, 'Urbanización La Rosaleda'),
(2111, 569, 'La Rosaleda Norte'),
(2112, 569, 'La Rosaleda Sur'),
(2113, 570, 'Los Salías Este'),
(2114, 570, 'Los Salías Oeste'),
(2115, 571, 'Río Chico Centro'),
(2116, 571, 'Barrio El Guapo'),
(2117, 572, 'El Guapo Norte'),
(2118, 572, 'El Guapo Sur'),
(2119, 573, 'Tacarigua de la Laguna Este'),
(2120, 573, 'Tacarigua de la Laguna Oeste'),
(2121, 574, 'Santa Lucía Centro'),
(2122, 574, 'Urbanización Santa Teresa'),
(2123, 575, 'Santa Teresa Norte'),
(2124, 575, 'Santa Teresa Sur'),
(2125, 576, 'La Democracia Este'),
(2126, 576, 'La Democracia Oeste'),
(2127, 577, 'Cúpira Centro'),
(2128, 577, 'Barrio Machurucuto'),
(2129, 578, 'Machurucuto Norte'),
(2130, 578, 'Machurucuto Sur'),
(2131, 579, 'El Guapo Este'),
(2132, 579, 'El Guapo Oeste'),
(2133, 580, 'Guarenas Centro'),
(2134, 580, 'Urbanización Ojo de Agua'),
(2135, 581, 'Ojo de Agua Norte'),
(2136, 581, 'Ojo de Agua Sur'),
(2137, 582, 'Guairita Este'),
(2138, 582, 'Guairita Oeste'),
(2139, 583, 'San Francisco Centro'),
(2140, 583, 'Barrio El Tigre'),
(2141, 584, 'El Tigre Norte'),
(2142, 584, 'El Tigre Sur'),
(2143, 585, 'San Antonio Este'),
(2144, 585, 'San Antonio Oeste'),
(2145, 586, 'Petare Centro'),
(2146, 586, 'Barrio Leoncio Martínez'),
(2147, 587, 'Leoncio Martínez Norte'),
(2148, 587, 'Leoncio Martínez Sur'),
(2149, 588, 'Caucagüita Este'),
(2150, 588, 'Caucagüita Oeste'),
(2151, 589, 'Cúa Centro'),
(2152, 589, 'Urbanización Nueva Cúa'),
(2153, 590, 'Nueva Cúa Norte'),
(2154, 590, 'Nueva Cúa Sur'),
(2155, 591, 'San Casimiro Este'),
(2156, 591, 'San Casimiro Oeste'),
(2157, 592, 'Guatire Centro'),
(2158, 592, 'Barrio Bolívar'),
(2159, 593, 'Bolívar Norte'),
(2160, 593, 'Bolívar Sur'),
(2161, 594, 'Araira Este'),
(2162, 594, 'Araira Oeste'),
(2163, 595, 'San Antonio Centro'),
(2164, 595, 'Sector Taguaya'),
(2165, 596, 'Aguasay Norte'),
(2166, 596, 'Aguasay Sur'),
(2167, 597, 'Areo Este'),
(2168, 597, 'Areo Oeste'),
(2169, 598, 'Aguasay Centro'),
(2170, 598, 'Sector El Tejero'),
(2171, 599, 'Caripito Centro'),
(2172, 599, 'Zona Industrial'),
(2173, 600, 'Caripe Centro'),
(2174, 600, 'Sector La Guanota'),
(2175, 601, 'Caicara Centro'),
(2176, 601, 'Barrio Areo'),
(2177, 602, 'Punta de Mata Centro'),
(2178, 602, 'Urbanización San Isidro'),
(2179, 603, 'Temblador Centro'),
(2180, 603, 'Barrio Chaguaramal'),
(2181, 604, 'Alto de Los Godos Centro'),
(2182, 604, 'Urbanización Boquerón'),
(2183, 605, 'Boquerón Norte'),
(2184, 605, 'Boquerón Sur'),
(2185, 606, 'Cachipo Este'),
(2186, 606, 'Cachipo Oeste'),
(2187, 607, 'Aragua Centro'),
(2188, 607, 'Sector La Pica'),
(2189, 608, 'Quiriquire Centro'),
(2190, 608, 'Barrio San Félix'),
(2191, 609, 'Santa Bárbara Centro'),
(2192, 609, 'Sector La Mata'),
(2193, 610, 'Barrancas Centro'),
(2194, 610, 'Barrio Los Barrancos'),
(2195, 611, 'Uracoa Centro'),
(2196, 611, 'Sector San Vicente'),
(2197, 612, 'Agua Blanca Centro'),
(2198, 612, 'Barrio El Progreso'),
(2199, 613, 'La Encrucijada Norte'),
(2200, 613, 'La Encrucijada Sur'),
(2201, 614, 'El Regalo Este'),
(2202, 614, 'El Regalo Oeste'),
(2203, 615, 'Araure Centro'),
(2204, 615, 'Urbanización Los Llanos'),
(2205, 616, 'Río Acarigua Norte'),
(2206, 616, 'Río Acarigua Sur'),
(2207, 617, 'Mesa de Cavaca Este'),
(2208, 617, 'Mesa de Cavaca Oeste'),
(2209, 618, 'Píritu Centro'),
(2210, 618, 'Barrio Uveral'),
(2211, 619, 'Uveral Norte'),
(2212, 619, 'Uveral Sur'),
(2213, 620, 'La Aparición Este'),
(2214, 620, 'La Aparición Oeste'),
(2215, 621, 'Guanare Centro'),
(2216, 621, 'Barrio Córdoba'),
(2217, 622, 'Córdoba Norte'),
(2218, 622, 'Córdoba Sur'),
(2219, 623, 'San José de la Montaña Este'),
(2220, 623, 'San José de la Montaña Oeste'),
(2221, 624, 'Guanarito Centro'),
(2222, 624, 'Barrio Divina Pastora'),
(2223, 625, 'Divina Pastora Norte'),
(2224, 625, 'Divina Pastora Sur'),
(2225, 626, 'San Juan Este'),
(2226, 626, 'San Juan Oeste'),
(2227, 627, 'Peña Blanca Centro'),
(2228, 627, 'Barrio Paraíso'),
(2229, 628, 'Paraíso de Chabasquén Norte'),
(2230, 628, 'Paraíso de Chabasquén Sur'),
(2231, 629, 'Chabasquén Este'),
(2232, 629, 'Chabasquén Oeste'),
(2233, 630, 'Ospino Centro'),
(2234, 630, 'Barrio La Aparición'),
(2235, 631, 'La Aparición Norte'),
(2236, 631, 'La Aparición Sur'),
(2237, 632, 'Santa Lucía Este'),
(2238, 632, 'Santa Lucía Oeste'),
(2239, 633, 'Acarigua Centro'),
(2240, 633, 'Urbanización Payara'),
(2241, 634, 'Payara Norte'),
(2242, 634, 'Payara Sur'),
(2243, 635, 'La Encrucijada Este'),
(2244, 635, 'La Encrucijada Oeste'),
(2245, 636, 'Papelón Centro'),
(2246, 636, 'Barrio Caño Delgadito'),
(2247, 637, 'Caño Delgadito Norte'),
(2248, 637, 'Caño Delgadito Sur'),
(2249, 638, 'Píritu Este'),
(2250, 638, 'Píritu Oeste'),
(2251, 639, 'Boconoíto Centro'),
(2252, 639, 'Barrio San Genaro'),
(2253, 640, 'San Genaro Norte'),
(2254, 640, 'San Genaro Sur'),
(2255, 641, 'Antolín del Campo Este'),
(2256, 641, 'Antolín del Campo Oeste'),
(2257, 642, 'San Rafael Centro'),
(2258, 642, 'Barrio Santa Cruz'),
(2259, 643, 'Santa Cruz Norte'),
(2260, 643, 'Santa Cruz Sur'),
(2261, 644, 'La Montaña Este'),
(2262, 644, 'La Montaña Oeste'),
(2263, 645, 'El Playón Centro'),
(2264, 645, 'Barrio Santa Rosalía'),
(2265, 646, 'Santa Rosalía Norte'),
(2266, 646, 'Santa Rosalía Sur'),
(2267, 647, 'La Montaña Este'),
(2268, 647, 'La Montaña Oeste'),
(2269, 648, 'Biscucuy Centro'),
(2270, 648, 'Barrio San Rafael'),
(2271, 649, 'San Rafael de Palo Santo Norte'),
(2272, 649, 'San Rafael de Palo Santo Sur'),
(2273, 650, 'Guanarito Este'),
(2274, 650, 'Guanarito Oeste'),
(2275, 651, 'Villa Bruzual Centro'),
(2276, 651, 'Urbanización Canaguá'),
(2277, 652, 'Canaguá Norte'),
(2278, 652, 'Canaguá Sur'),
(2279, 653, 'Santa Cruz de Guacas Este'),
(2280, 653, 'Santa Cruz de Guacas Oeste'),
(2281, 654, 'Casanay Centro'),
(2282, 654, 'Sector El Paují'),
(2283, 655, 'Santa Rosa Norte'),
(2284, 655, 'Santa Rosa Sur'),
(2285, 656, 'San José de Aerocuar Centro'),
(2286, 656, 'Barrio Aeropuerto'),
(2287, 657, 'San Agustín Norte'),
(2288, 657, 'San Agustín Sur'),
(2289, 658, 'Río Caribe Centro'),
(2290, 658, 'Zona Portuaria'),
(2291, 659, 'San Juan Norte'),
(2292, 659, 'San Juan Sur'),
(2293, 660, 'El Pilar Centro'),
(2294, 660, 'Barrio Bolívar'),
(2295, 661, 'Benítez Norte'),
(2296, 661, 'Benítez Sur'),
(2297, 662, 'Carúpano Centro'),
(2298, 662, 'Paseo Colón'),
(2299, 663, 'Santa Catalina Norte'),
(2300, 663, 'Santa Catalina Sur'),
(2301, 664, 'Santa Inés Este'),
(2302, 664, 'Santa Inés Oeste'),
(2303, 665, 'Marigüitar Centro'),
(2304, 665, 'Barrio San Antonio'),
(2305, 666, 'San Antonio del Golfo Norte'),
(2306, 666, 'San Antonio del Golfo Sur'),
(2307, 667, 'Yaguaraparo Centro'),
(2308, 667, 'Barrio El Mangle'),
(2309, 668, 'Libertad Norte'),
(2310, 668, 'Libertad Sur'),
(2311, 669, 'Araya Centro'),
(2312, 669, 'Playa Araya'),
(2313, 670, 'Manicuare Norte'),
(2314, 670, 'Manicuare Sur'),
(2315, 671, 'Tunapuy Centro'),
(2316, 671, 'Barrio San Rafael'),
(2317, 672, 'San Rafael de Tunapuy Norte'),
(2318, 672, 'San Rafael de Tunapuy Sur'),
(2319, 673, 'Irapa Centro'),
(2320, 673, 'Barrio San Antonio'),
(2321, 674, 'San Antonio de Irapa Norte'),
(2322, 674, 'San Antonio de Irapa Sur'),
(2323, 675, 'San Antonio del Golfo Centro'),
(2324, 675, 'Barrio El Rincón'),
(2325, 676, 'El Rincón Norte'),
(2326, 676, 'El Rincón Sur'),
(2327, 677, 'Cumanacoa Centro'),
(2328, 677, 'Barrio San Lorenzo'),
(2329, 678, 'San Lorenzo Norte'),
(2330, 678, 'San Lorenzo Sur'),
(2331, 679, 'Cocollar Este'),
(2332, 679, 'Cocollar Oeste'),
(2333, 680, 'Cariaco Centro'),
(2334, 680, 'Barrio Catuaro'),
(2335, 681, 'Catuaro Norte'),
(2336, 681, 'Catuaro Sur'),
(2337, 682, 'Cumaná Centro'),
(2338, 682, 'Paseo Mariscal'),
(2339, 683, 'Ayacucho Norte'),
(2340, 683, 'Ayacucho Sur'),
(2341, 684, 'Güiria Centro'),
(2342, 684, 'Zona Portuaria'),
(2343, 685, 'Cristóbal Colón Norte'),
(2344, 685, 'Cristóbal Colón Sur'),
(2345, 686, 'Santa Isabel Centro'),
(2346, 686, 'Sector La Montaña'),
(2347, 687, 'Aragua Norte'),
(2348, 687, 'Aragua Sur'),
(2349, 688, 'San Rafael de Onoto Este'),
(2350, 688, 'San Rafael de Onoto Oeste'),
(2351, 689, 'Boconó Centro'),
(2352, 689, 'Barrio El Calvario'),
(2353, 690, 'Boconó Arriba Norte'),
(2354, 690, 'Boconó Arriba Sur'),
(2355, 691, 'San Miguel Este'),
(2356, 691, 'San Miguel Oeste'),
(2357, 692, 'Sabana Grande Centro'),
(2358, 692, 'Barrio Bolívar'),
(2359, 693, 'Sabana de Mendoza Norte'),
(2360, 693, 'Sabana de Mendoza Sur'),
(2361, 694, 'Valera Este'),
(2362, 694, 'Valera Oeste'),
(2363, 695, 'Chejendé Centro'),
(2364, 695, 'Sector El Potrero'),
(2365, 696, 'Candelaria Norte'),
(2366, 696, 'Candelaria Sur'),
(2367, 697, 'Arnoldo Gabaldón Este'),
(2368, 697, 'Arnoldo Gabaldón Oeste'),
(2369, 698, 'Carache Centro'),
(2370, 698, 'Barrio La Concepción'),
(2371, 699, 'Cuicas Norte'),
(2372, 699, 'Cuicas Sur'),
(2373, 700, 'La Concepción Este'),
(2374, 700, 'La Concepción Oeste'),
(2375, 701, 'Escuque Centro'),
(2376, 701, 'Barrio La Unión'),
(2377, 702, 'La Unión Norte'),
(2378, 702, 'La Unión Sur'),
(2379, 703, 'Santa Rita Este'),
(2380, 703, 'Santa Rita Oeste'),
(2381, 704, 'El Paradero Centro'),
(2382, 704, 'Sector Las Mesitas'),
(2383, 705, 'Las Mesitas Norte'),
(2384, 705, 'Las Mesitas Sur'),
(2385, 706, 'Carrillo Este'),
(2386, 706, 'Carrillo Oeste'),
(2387, 707, 'Campo Elías Centro'),
(2388, 707, 'Barrio La Ceiba'),
(2389, 708, 'Campo Elías Arriba Norte'),
(2390, 708, 'Campo Elías Arriba Sur'),
(2391, 709, 'La Ceiba Este'),
(2392, 709, 'La Ceiba Oeste'),
(2393, 710, 'Santa Apolonia Centro'),
(2394, 710, 'Barrio El Amparo'),
(2395, 711, 'El Amparo Norte'),
(2396, 711, 'El Amparo Sur'),
(2397, 712, 'Pampanito Este'),
(2398, 712, 'Pampanito Oeste'),
(2399, 713, 'El Silencio Centro'),
(2400, 713, 'Sector Aguas Calientes'),
(2401, 714, 'Aguas Calientes Norte'),
(2402, 714, 'Aguas Calientes Sur'),
(2403, 715, 'El Corozo Este'),
(2404, 715, 'El Corozo Oeste'),
(2405, 716, 'Monte Carmelo Centro'),
(2406, 716, 'Barrio San Rafael'),
(2407, 717, 'San Rafael de Carvajal Norte'),
(2408, 717, 'San Rafael de Carvajal Sur'),
(2409, 718, 'Pampán Este'),
(2410, 718, 'Pampán Oeste'),
(2411, 719, 'Motatán Centro'),
(2412, 719, 'Barrio El Baño'),
(2413, 720, 'El Baño Norte'),
(2414, 720, 'El Baño Sur'),
(2415, 721, 'Jajo Este'),
(2416, 721, 'Jajo Oeste'),
(2417, 722, 'Pampán Centro'),
(2418, 722, 'Barrio Santa Ana'),
(2419, 723, 'Santa Ana Norte'),
(2420, 723, 'Santa Ana Sur'),
(2421, 724, 'La Paz Este'),
(2422, 725, 'La Paz Oeste'),
(2423, 726, 'Pampanito Centro'),
(2424, 726, 'Barrio Flor de Patria'),
(2425, 727, 'Flor de Patria Norte'),
(2426, 727, 'Flor de Patria Sur'),
(2427, 728, 'La Concepción Este'),
(2428, 728, 'La Concepción Oeste'),
(2429, 729, 'Betijoque Centro'),
(2430, 729, 'Barrio José Gregorio'),
(2431, 730, 'José Gregorio Hernández Norte'),
(2432, 730, 'José Gregorio Hernández Sur'),
(2433, 731, 'La Puebla Este'),
(2434, 731, 'La Puebla Oeste'),
(2435, 732, 'San Rafael de Carvajal Centro'),
(2436, 732, 'Barrio Campo Alegre'),
(2437, 733, 'Campo Alegre Norte'),
(2438, 733, 'Campo Alegre Sur'),
(2439, 734, 'La Ceiba Este'),
(2440, 734, 'La Ceiba Oeste'),
(2441, 735, 'Sabana de Mendoza Centro'),
(2442, 735, 'Barrio Jajó'),
(2443, 736, 'Jajó Norte'),
(2444, 736, 'Jajó Sur'),
(2445, 737, 'Montecarmelo Este'),
(2446, 737, 'Montecarmelo Oeste'),
(2447, 738, 'Trujillo Centro'),
(2448, 738, 'Barrio Cristóbal Mendoza'),
(2449, 739, 'Cristóbal Mendoza Norte'),
(2450, 739, 'Cristóbal Mendoza Sur'),
(2451, 740, 'Matriz Este'),
(2452, 740, 'Matriz Oeste'),
(2453, 741, 'La Quebrada Centro'),
(2454, 741, 'Barrio Jajó'),
(2455, 742, 'Jajó Norte'),
(2456, 742, 'Jajó Sur'),
(2457, 743, 'Santiago Este'),
(2458, 743, 'Santiago Oeste'),
(2459, 744, 'Valera Centro'),
(2460, 744, 'Urbanización La Beatriz'),
(2461, 745, 'San Luis Norte'),
(2462, 745, 'San Luis Sur'),
(2463, 746, 'La Beatriz Este'),
(2464, 746, 'La Beatriz Oeste'),
(2465, 747, 'Caraballeda Centro'),
(2466, 747, 'Urbanización Tanaguarena'),
(2467, 748, 'Carayaca Norte'),
(2468, 748, 'Carayaca Sur'),
(2469, 749, 'Naiguatá Este'),
(2470, 749, 'Naiguatá Oeste'),
(2471, 750, 'San Pablo Centro'),
(2472, 750, 'Barrio Las Minas'),
(2473, 751, 'La Montaña Norte'),
(2474, 751, 'La Montaña Sur'),
(2475, 752, 'Aroa Centro'),
(2476, 752, 'Zona Minera'),
(2477, 753, 'Farriar Norte'),
(2478, 753, 'Farriar Sur'),
(2479, 754, 'Albarico Este'),
(2480, 754, 'Albarico Oeste'),
(2481, 755, 'Chivacoa Centro'),
(2482, 755, 'Barrio Camburito'),
(2483, 756, 'Camburito Norte'),
(2484, 756, 'Camburito Sur'),
(2485, 757, 'Urachiche Este'),
(2486, 757, 'Urachiche Oeste'),
(2487, 758, 'Cocorote Centro'),
(2488, 758, 'Barrio La Trinidad'),
(2489, 759, 'Independencia Norte'),
(2490, 759, 'Independencia Sur'),
(2491, 760, 'Independencia Centro'),
(2492, 760, 'Barrio San José'),
(2493, 761, 'José Antonio Páez Norte'),
(2494, 761, 'José Antonio Páez Sur'),
(2495, 762, 'Sabana de Parra Centro'),
(2496, 762, 'Barrio Yumare'),
(2497, 763, 'Yumare Norte'),
(2498, 763, 'Yumare Sur'),
(2499, 764, 'Boraure Centro'),
(2500, 764, 'Barrio San Felipe'),
(2501, 765, 'Manuel Monge Norte'),
(2502, 765, 'Manuel Monge Sur'),
(2503, 766, 'Yumare Centro'),
(2504, 766, 'Barrio Guama'),
(2505, 767, 'Nirgua Norte'),
(2506, 767, 'Nirgua Sur'),
(2507, 768, 'Nirgua Centro'),
(2508, 768, 'Barrio Temerla'),
(2509, 769, 'Peña Norte'),
(2510, 769, 'Peña Sur'),
(2511, 770, 'Yaritagua Centro'),
(2512, 770, 'Urbanización El Peñón'),
(2513, 771, 'San Andrés Este'),
(2514, 771, 'San Andrés Oeste'),
(2515, 772, 'San Felipe Centro'),
(2516, 772, 'Barrio Cocorote'),
(2517, 773, 'Cocorote Norte'),
(2518, 773, 'Cocorote Sur'),
(2519, 774, 'Guama Centro'),
(2520, 774, 'Barrio Sabana'),
(2521, 775, 'Sabana de Parra Norte'),
(2522, 775, 'Sabana de Parra Sur'),
(2523, 776, 'San Felipe Este'),
(2524, 776, 'San Felipe Oeste'),
(2525, 777, 'Urachiche Centro'),
(2526, 777, 'Barrio Sucre'),
(2527, 778, 'Veroes Norte'),
(2528, 778, 'Veroes Sur'),
(2529, 779, 'San Pablo Centro'),
(2530, 779, 'Barrio El Chino'),
(2531, 780, 'El Guayabo Este'),
(2532, 780, 'El Guayabo Oeste'),
(2533, 781, 'Isla de Toas Centro'),
(2534, 781, 'Sector Marino'),
(2535, 782, 'Monagas Norte'),
(2536, 782, 'Monagas Sur'),
(2537, 783, 'Isla de Zapara Este'),
(2538, 783, 'Isla de Zapara Oeste'),
(2539, 784, 'San Timoteo Centro'),
(2540, 784, 'Zona Petrolera'),
(2541, 785, 'Libertad Norte'),
(2542, 785, 'Libertad Sur'),
(2543, 786, 'Mene Grande Este'),
(2544, 786, 'Mene Grande Oeste'),
(2545, 787, 'Cabimas Centro'),
(2546, 787, 'Barrio Ambrosio'),
(2547, 788, 'Ambrosio Norte'),
(2548, 788, 'Ambrosio Sur'),
(2549, 789, 'Carmen Herrera Este'),
(2550, 789, 'Carmen Herrera Oeste'),
(2551, 790, 'Encontrados Centro'),
(2552, 790, 'Barrio Fluvial'),
(2553, 791, 'Udón Pérez Norte'),
(2554, 791, 'Udón Pérez Sur'),
(2555, 792, 'Chiquinquirá Este'),
(2556, 792, 'Chiquinquirá Oeste'),
(2557, 793, 'San Carlos Centro'),
(2558, 793, 'Barrio Santa Cruz'),
(2559, 794, 'Santa Cruz del Zulia Norte'),
(2560, 794, 'Santa Cruz del Zulia Sur'),
(2561, 795, 'San Rafael Este'),
(2562, 795, 'San Rafael Oeste'),
(2563, 796, 'Pueblo Nuevo Centro'),
(2564, 796, 'Sector El Chivo'),
(2565, 797, 'El Chivo Norte'),
(2566, 797, 'El Chivo Sur'),
(2567, 798, 'El Guayabo Este'),
(2568, 798, 'El Guayabo Oeste'),
(2569, 799, 'La Concepción Centro'),
(2570, 799, 'Urbanización San Isidro'),
(2571, 800, 'San Isidro Norte'),
(2572, 800, 'San Isidro Sur'),
(2573, 801, 'José Ramón Yépez Este'),
(2574, 801, 'José Ramón Yépez Oeste'),
(2575, 802, 'Casigua-El Cubo Centro'),
(2576, 802, 'Barrio Maracaibo'),
(2577, 803, 'Jesús María Semprún Norte'),
(2578, 803, 'Jesús María Semprún Sur'),
(2579, 804, 'Concepción Centro'),
(2580, 804, 'Barrio El Carmelo'),
(2581, 805, 'San José Norte'),
(2582, 805, 'San José Sur'),
(2583, 806, 'El Carmelo Este'),
(2584, 806, 'El Carmelo Oeste'),
(2585, 807, 'Ciudad Ojeda Centro'),
(2586, 807, 'Urbanización Alonso'),
(2587, 808, 'Alonso de Ojeda Norte'),
(2588, 808, 'Alonso de Ojeda Sur'),
(2589, 809, 'Eleazar López Contreras Este'),
(2590, 809, 'Eleazar López Contreras Oeste'),
(2591, 810, 'Libertad Centro'),
(2592, 810, 'Barrio San José'),
(2593, 811, 'San José Norte'),
(2594, 811, 'San José Sur'),
(2595, 812, 'Rio Negro Este'),
(2596, 812, 'Rio Negro Oeste'),
(2597, 813, 'San Rafael Centro'),
(2598, 813, 'Sector La Sierrita'),
(2599, 814, 'La Sierrita Norte'),
(2600, 814, 'La Sierrita Sur'),
(2601, 815, 'Luis de Vicente Este'),
(2602, 815, 'Luis de Vicente Oeste'),
(2603, 816, 'Cacique Mara Centro'),
(2604, 816, 'Barrio Chiquinquirá'),
(2605, 817, 'Chiquinquirá Norte'),
(2606, 817, 'Chiquinquirá Sur'),
(2607, 818, 'Coquivacoa Este'),
(2608, 818, 'Coquivacoa Oeste'),
(2609, 819, 'Altagracia Centro'),
(2610, 819, 'Barrio Ana María'),
(2611, 820, 'Ana María Campos Norte'),
(2612, 820, 'Ana María Campos Sur'),
(2613, 821, 'San Antonio Este'),
(2614, 821, 'San Antonio Oeste'),
(2615, 822, 'Sinamaica Centro'),
(2616, 822, 'Sector Alta Guajira'),
(2617, 823, 'Alta Guajira Norte'),
(2618, 823, 'Alta Guajira Sur'),
(2619, 824, 'Guajira Este'),
(2620, 824, 'Guajira Oeste'),
(2621, 825, 'Rosario Centro'),
(2622, 825, 'Barrio Sixto'),
(2623, 826, 'Sixto Zambrano Norte'),
(2624, 826, 'Sixto Zambrano Sur'),
(2625, 827, 'Maracaibo Este'),
(2626, 827, 'Maracaibo Oeste'),
(2627, 828, 'San Francisco Centro'),
(2628, 828, 'Urbanización Francisco Ochoa'),
(2629, 829, 'Francisco Ochoa Norte'),
(2630, 829, 'Francisco Ochoa Sur'),
(2631, 830, 'Maracaibo Este'),
(2632, 830, 'Maracaibo Oeste'),
(2633, 831, 'Santa Rita Centro'),
(2634, 831, 'Barrio José Cenobio'),
(2635, 832, 'José Cenobio Urribarrí Norte'),
(2636, 832, 'José Cenobio Urribarrí Sur'),
(2637, 833, 'El Mene Este'),
(2638, 833, 'El Mene Oeste'),
(2639, 834, 'Tía Juana Centro'),
(2640, 834, 'Barrio Manuel'),
(2641, 835, 'Manuel Manrique Norte'),
(2642, 835, 'Manuel Manrique Sur'),
(2643, 836, 'Maracaibo Este'),
(2644, 836, 'Maracaibo Oeste'),
(2645, 837, 'Bobures Centro'),
(2646, 837, 'Barrio Gibraltar'),
(2647, 838, 'Gibraltar Norte'),
(2648, 838, 'Gibraltar Sur'),
(2649, 839, 'Maracaibo Este'),
(2650, 839, 'Maracaibo Oeste'),
(2651, 840, 'Bachaquero Centro'),
(2652, 840, 'Barrio La Pica'),
(2653, 841, 'La Pica Norte'),
(2654, 841, 'La Pica Sur'),
(2655, 842, 'El Toco Este'),
(2656, 842, 'El Toco Oeste'),
(2657, 843, 'Altagracia Centro'),
(2658, 843, 'Casco Histórico'),
(2659, 844, 'Antímano Norte'),
(2660, 844, 'Antímano Sur'),
(2661, 845, 'El Recreo Este'),
(2662, 845, 'El Recreo Oeste');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `nombre_documento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipo_documento`, `nombre_documento`) VALUES
(1, 'Partida de Nacimiento'),
(2, 'Copia de cedula de la Madre'),
(3, 'Copia de cedula del Padre'),
(4, '4 Fotos tipo Carnet'),
(5, 'Copia del Certificado de Vacuas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_nivel`
--

CREATE TABLE `tipo_nivel` (
  `id_tipo_nivel` int(11) NOT NULL,
  `nombre_nivel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_nivel`
--

INSERT INTO `tipo_nivel` (`id_tipo_nivel`, `nombre_nivel`) VALUES
(1, 'NIVEL I'),
(2, 'NIVEL II'),
(3, 'NIVEL III');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_parentesco`
--

CREATE TABLE `tipo_parentesco` (
  `id_tipo_parentesco` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tipo_parentesco`
--

INSERT INTO `tipo_parentesco` (`id_tipo_parentesco`, `nombre`) VALUES
(1, 'representante'),
(2, 'madre'),
(3, 'padre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_procedencia`
--

CREATE TABLE `tipo_procedencia` (
  `id_tipo_procedencia` int(11) NOT NULL,
  `nombre_procedencia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(1, 309309, 'Josel', 'Alvarez Lopez ', 1, 'Usuario_1', 1, '$2y$10$Iqpu.MxyGyUPnaLSyV7bAup6u//h7N1X8wRi0wneO2KH5yS8AIWpC', 'activo'),
(5, 390390, 'Carlosh', 'Marcano', 1, '390390', 2, '$2y$10$Fs0/0/M.4u3L.QZ8FRtXduHd1DgEKI4bBOAmZYhiacwTdGyNoyxlq', 'inactivo');

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
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`id_tipo_parentesco`,`cedula`,`ci_escolar`),
  ADD KEY `cedula` (`cedula`),
  ADD KEY `ci_escolar` (`ci_escolar`);

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
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_correo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `discapacidad`
--
ALTER TABLE `discapacidad`
  MODIFY `id_discapacidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos_inscripcion`
--
ALTER TABLE `documentos_inscripcion`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  MODIFY `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id_nivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  MODIFY `id_parroquia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2080;

--
-- AUTO_INCREMENT de la tabla `periodo_escolar`
--
ALTER TABLE `periodo_escolar`
  MODIFY `id_periodo_escolar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `peso`
--
ALTER TABLE `peso`
  MODIFY `id_peso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prendas`
--
ALTER TABLE `prendas`
  MODIFY `id_prenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `procedencia`
--
ALTER TABLE `procedencia`
  MODIFY `id_procedencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `representantes`
--
ALTER TABLE `representantes`
  MODIFY `id_representante` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_seccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `id_sector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2663;

--
-- AUTO_INCREMENT de la tabla `tallas`
--
ALTER TABLE `tallas`
  MODIFY `id_talla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id_telefono` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_nivel`
--
ALTER TABLE `tipo_nivel`
  MODIFY `id_tipo_nivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_parentesco`
--
ALTER TABLE `tipo_parentesco`
  MODIFY `id_tipo_parentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_procedencia`
--
ALTER TABLE `tipo_procedencia`
  MODIFY `id_tipo_procedencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
