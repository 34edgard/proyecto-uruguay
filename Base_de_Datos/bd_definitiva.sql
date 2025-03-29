-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2025 a las 20:06:33
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd definitiva`
--

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
(1, 1, 'Alto Orinoco'),
(2, 1, 'Atabapo'),
(3, 1, 'Atures'),
(4, 1, 'Autana'),
(5, 1, 'Manapiare'),
(6, 1, 'Maroa'),
(7, 1, 'Río Negro'),
(8, 2, 'Anaco'),
(9, 2, 'Aragua'),
(10, 2, 'Bolívar'),
(11, 2, 'Bruzual'),
(12, 2, 'Cajigal'),
(13, 2, 'Freites'),
(14, 2, 'Guanipa'),
(15, 2, 'Guanta'),
(16, 2, 'Independencia'),
(17, 2, 'Libertad'),
(18, 2, 'McGregor'),
(19, 2, 'Miranda'),
(20, 2, 'Monagas'),
(21, 2, 'Peñalver'),
(22, 2, 'Píritu'),
(23, 2, 'San Juan de Capistrano'),
(24, 2, 'Santa Ana'),
(25, 2, 'Simón Rodríguez'),
(26, 2, 'Sotillo'),
(27, 2, 'Valdés'),
(28, 3, 'Achaguas'),
(29, 3, 'Biruaca'),
(30, 3, 'Muñoz'),
(31, 3, 'Páez'),
(32, 3, 'Pedro Camejo'),
(33, 3, 'Rómulo Gallegos'),
(34, 3, 'San Fernando'),
(35, 4, 'Bolívar'),
(36, 4, 'Camatagua'),
(37, 4, 'Francisco Linares Alcántara'),
(38, 4, 'Girardot'),
(39, 4, 'José Ángel Lamas'),
(40, 4, 'José Félix Ribas'),
(41, 4, 'José Rafael Revenga'),
(42, 4, 'Libertador'),
(43, 4, 'Mario Briceño Iragorry'),
(44, 4, 'Ocumare de la Costa de Oro'),
(45, 4, 'San Casimiro'),
(46, 4, 'San Sebastián'),
(47, 4, 'Santiago Mariño'),
(48, 4, 'Santos Michelena'),
(49, 4, 'Sucre'),
(50, 4, 'Tovar'),
(51, 4, 'Urdaneta'),
(52, 4, 'Zamora'),
(53, 5, 'Alberto Arvelo Torrealba'),
(54, 5, 'Andrés Eloy Blanco'),
(55, 5, 'Antonio José de Sucre'),
(56, 5, 'Arismendi'),
(57, 5, 'Barinas'),
(58, 5, 'Bolívar'),
(59, 5, 'Cruz Paredes'),
(60, 5, 'Ezequiel Zamora'),
(61, 5, 'Obispos'),
(62, 5, 'Pedraza'),
(63, 5, 'Rojas'),
(64, 5, 'Sosa'),
(65, 6, 'Angostura del Orinoco'),
(66, 6, 'Cedeño'),
(67, 6, 'El Callao'),
(68, 6, 'Gran Sabana'),
(69, 6, 'Heres'),
(70, 6, 'Padre Pedro Chien'),
(71, 6, 'Piar'),
(72, 6, 'Roscio'),
(73, 6, 'Sifontes'),
(74, 6, 'Sucre'),
(75, 6, 'Caroní'),
(76, 7, 'Bejuma'),
(77, 7, 'Carlos Arvelo'),
(78, 7, 'Diego Ibarra'),
(79, 7, 'Guacara'),
(80, 7, 'Juan José Mora'),
(81, 7, 'Libertador'),
(82, 7, 'Los Guayos'),
(83, 7, 'Miranda'),
(84, 7, 'Montalbán'),
(85, 7, 'Naguanagua'),
(86, 7, 'Puerto Cabello'),
(87, 7, 'San Diego'),
(88, 7, 'San Joaquín'),
(89, 7, 'Valencia'),
(90, 8, 'Anzoátegui'),
(91, 8, 'El Pao'),
(92, 8, 'Girardot'),
(93, 8, 'Lima Blanco'),
(94, 8, 'Ricaurte'),
(95, 8, 'Rómulo Gallegos'),
(96, 8, 'San Carlos'),
(97, 8, 'Tinaco'),
(98, 9, 'Antonio Díaz'),
(99, 9, 'Casacoima'),
(100, 9, 'Pedernales'),
(101, 9, 'Tucupita'),
(102, 10, 'Libertador'),
(103, 11, 'Acosta'),
(104, 11, 'Bolívar'),
(105, 11, 'Buchivacoa'),
(106, 11, 'Cacique Manaure'),
(107, 11, 'Carirubana'),
(108, 11, 'Colina'),
(109, 11, 'Dabajuro'),
(110, 11, 'Democracia'),
(111, 11, 'Falcón'),
(112, 11, 'Federación'),
(113, 11, 'Jacura'),
(114, 11, 'Los Taques'),
(115, 11, 'Mauroa'),
(116, 11, 'Miranda'),
(117, 11, 'Monseñor Iturriza'),
(118, 11, 'Palmasola'),
(119, 11, 'Petit'),
(120, 11, 'Píritu'),
(121, 11, 'San Francisco'),
(122, 11, 'Silva'),
(123, 11, 'Sucre'),
(124, 11, 'Tocópero'),
(125, 11, 'Unión'),
(126, 11, 'Urumaco'),
(127, 11, 'Zamora'),
(128, 12, 'Camaguán'),
(129, 12, 'Chaguaramas'),
(130, 12, 'El Socorro'),
(131, 12, 'José Félix Ribas'),
(132, 12, 'José Tadeo Monagas'),
(133, 12, 'Juan Germán Roscio'),
(134, 12, 'Julián Mellado'),
(135, 12, 'Las Mercedes'),
(136, 12, 'Leonardo Infante'),
(137, 12, 'Pedro Zaraza'),
(138, 12, 'Ortiz'),
(139, 12, 'San Gerónimo de Guayabal'),
(140, 12, 'San José de Guaribe'),
(141, 12, 'Santa María de Ipire'),
(142, 12, 'Sebastián Francisco de Miranda'),
(143, 13, 'Andrés Eloy Blanco'),
(144, 13, 'Crespo'),
(145, 13, 'Iribarren'),
(146, 13, 'Jiménez'),
(147, 13, 'Morán'),
(148, 13, 'Palavecino'),
(149, 13, 'Simón Planas'),
(150, 13, 'Torres'),
(151, 13, 'Urdaneta'),
(152, 14, 'Vargas'),
(153, 15, 'Alberto Adriani'),
(154, 15, 'Andrés Bello'),
(155, 15, 'Antonio Pinto Salinas'),
(156, 15, 'Aricagua'),
(157, 15, 'Arzobispo Chacón'),
(158, 15, 'Campo Elías'),
(159, 15, 'Caracciolo Parra Olmedo'),
(160, 15, 'Cardenal Quintero'),
(161, 15, 'Guaraque'),
(162, 15, 'Julio César Salas'),
(163, 15, 'Justo Briceño'),
(164, 15, 'Libertador'),
(165, 15, 'Miranda'),
(166, 15, 'Obispo Ramos de Lora'),
(167, 15, 'Padre Noguera'),
(168, 15, 'Pueblo Llano'),
(169, 15, 'Rangel'),
(170, 15, 'Rivas Dávila'),
(171, 15, 'Santos Marquina'),
(172, 15, 'Sucre'),
(173, 15, 'Tovar'),
(174, 15, 'Tulio Febres Cordero'),
(175, 15, 'Zea'),
(176, 16, 'Acevedo'),
(177, 16, 'Andrés Bello'),
(178, 16, 'Baruta'),
(179, 16, 'Brión'),
(180, 16, 'Buroz'),
(181, 16, 'Carrizal'),
(182, 16, 'Chacao'),
(183, 16, 'Cristóbal Rojas'),
(184, 16, 'El Hatillo'),
(185, 16, 'Guaicaipuro'),
(186, 16, 'Independencia'),
(187, 16, 'Lander'),
(188, 16, 'Los Salias'),
(189, 16, 'Páez'),
(190, 16, 'Paz Castillo'),
(191, 16, 'Pedro Gual'),
(192, 16, 'Plaza'),
(193, 16, 'Simón Bolívar'),
(194, 16, 'Sucre'),
(195, 16, 'Urdaneta'),
(196, 16, 'Zamora'),
(197, 17, 'Acosta'),
(198, 17, 'Aguasay'),
(199, 17, 'Bolívar'),
(200, 17, 'Caripe'),
(201, 17, 'Cedeño'),
(202, 17, 'Ezequiel Zamora'),
(203, 17, 'Libertador'),
(204, 17, 'Maturín'),
(205, 17, 'Piar'),
(206, 17, 'Punceres'),
(207, 17, 'Santa Bárbara'),
(208, 17, 'Sotillo'),
(209, 17, 'Uracoa'),
(210, 18, 'Antolín del Campo'),
(211, 18, 'Arismendi'),
(212, 18, 'Díaz'),
(213, 18, 'García'),
(214, 18, 'Gómez'),
(215, 18, 'Maneiro'),
(216, 18, 'Mariño'),
(217, 18, 'Península de Macanao'),
(218, 18, 'Tubores'),
(220, 19, 'Agua Blanca'),
(221, 19, 'Araure'),
(222, 19, 'Esteller'),
(223, 19, 'Guanare'),
(224, 19, 'Guanarito'),
(225, 19, 'Monseñor José Vicente de Unda'),
(226, 19, 'Ospino'),
(227, 19, 'Páez'),
(228, 19, 'San Genaro de Boconoito'),
(229, 19, 'San Rafael de Onoto'),
(230, 19, 'Santa Rosalía'),
(231, 19, 'Sucre'),
(232, 19, 'Turén'),
(234, 20, 'Andrés Eloy Blanco'),
(235, 20, 'Andrés Mata'),
(236, 20, 'Arismendi'),
(237, 20, 'Benítez'),
(238, 20, 'Bermúdez'),
(239, 20, 'Bolívar'),
(240, 20, 'Cajigal'),
(241, 20, 'Cruz Salmerón Acosta'),
(242, 20, 'Libertador'),
(243, 20, 'Mariño'),
(244, 20, 'Mejía'),
(245, 20, 'Montes'),
(246, 20, 'Ribero'),
(247, 20, 'Sucre'),
(248, 20, 'Valdez'),
(249, 21, 'Andrés Bello'),
(250, 21, 'Antonio Rómulo Costa'),
(251, 21, 'Ayacucho'),
(252, 21, 'Bolívar'),
(253, 21, 'Cárdenas'),
(254, 21, 'Córdoba'),
(255, 21, 'Fernández Feo'),
(256, 21, 'Francisco de Miranda'),
(257, 21, 'García de Hevia'),
(258, 21, 'Guásimos'),
(259, 21, 'Independencia'),
(260, 21, 'Jauregui'),
(261, 21, 'José María Vargas'),
(262, 21, 'Junín'),
(263, 21, 'Libertad'),
(264, 21, 'Libertador'),
(265, 21, 'Lobatera'),
(266, 21, 'Michelena'),
(267, 21, 'Panamericano'),
(268, 21, 'Pedro María Ureña'),
(269, 21, 'Rafael Urdaneta'),
(270, 21, 'Samuel Darío Maldonado'),
(271, 21, 'San Cristóbal'),
(272, 21, 'Seboruco'),
(273, 21, 'Simón Rodríguez'),
(274, 21, 'Sucre'),
(275, 21, 'Torbes'),
(276, 21, 'Uribante'),
(277, 21, 'San Judas Tadeo'),
(278, 22, 'Andrés Bello'),
(279, 22, 'Boconó'),
(280, 22, 'Bolívar'),
(281, 22, 'Candelaria'),
(282, 22, 'Carache'),
(283, 22, 'Escuque'),
(284, 22, 'José Felipe Márquez Cañizalez'),
(285, 22, 'Juan Vicente Campos Elías'),
(286, 22, 'La Ceiba'),
(287, 22, 'Miranda'),
(288, 22, 'Monte Carmelo'),
(289, 22, 'Motatán'),
(290, 22, 'Pampán'),
(291, 22, 'Pampanito'),
(292, 22, 'Rafael Rangel'),
(293, 22, 'San Rafael de Carvajal'),
(294, 22, 'Sucre'),
(295, 22, 'Trujillo'),
(296, 22, 'Urdaneta'),
(297, 22, 'Valera'),
(298, 23, 'Arístides Bastidas'),
(299, 23, 'Bolívar'),
(300, 23, 'Bruzual'),
(301, 23, 'Cocorote'),
(302, 23, 'Independencia'),
(303, 23, 'José Antonio Páez'),
(304, 23, 'La Trinidad'),
(305, 23, 'Manuel Monge'),
(306, 23, 'Nirgua'),
(307, 23, 'Peña'),
(308, 23, 'San Felipe'),
(309, 23, 'Sucre'),
(310, 23, 'Urachiche'),
(311, 23, 'Veroes'),
(312, 24, 'Almirante Padilla'),
(313, 24, 'Baralt'),
(314, 24, 'Cabimas'),
(315, 24, 'Catatumbo'),
(316, 24, 'Colón'),
(317, 24, 'Francisco Javier Pulgar'),
(318, 24, 'Jesús Enrique Lossada'),
(319, 24, 'Jesús María Semprún'),
(320, 24, 'La Cañada de Urdaneta'),
(321, 24, 'Lagunillas'),
(322, 24, 'Machiques de Perijá'),
(323, 24, 'Mara'),
(324, 24, 'Maracaibo'),
(325, 24, 'Miranda'),
(326, 24, 'Páez'),
(327, 24, 'Rosario de Perijá'),
(328, 24, 'San Francisco'),
(329, 24, 'Santa Rita'),
(330, 24, 'Simón Bolívar'),
(331, 24, 'Sucre'),
(332, 24, 'Valmore Rodríguez'),
(333, 25, 'Barima-Waini'),
(334, 25, 'Pomeroon-Supenaam'),
(335, 25, 'Cuyuni-Mazaruni'),
(336, 25, 'Potaro-Siparuni'),
(337, 25, 'Alto Takutu-Alto Esequibo'),
(338, 25, 'Islas Esequibo-Demerara Occidental');

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
(1, 'Afganistán'),
(2, 'Islas Gland'),
(3, 'Albania'),
(4, 'Alemania'),
(5, 'Andorra'),
(6, 'Angola'),
(7, 'Anguilla'),
(8, 'Antártida'),
(9, 'Antigua y Barbuda'),
(10, 'Antillas Holandesas'),
(11, 'Arabia Saudí'),
(12, 'Argelia'),
(13, 'Argentina'),
(14, 'Armenia'),
(15, 'Aruba'),
(16, 'Australia'),
(17, 'Austria'),
(18, 'Azerbaiyán'),
(19, 'Bahamas'),
(20, 'Bahréin'),
(21, 'Bangladesh'),
(22, 'Barbados'),
(23, 'Bielorrusia'),
(24, 'Bélgica'),
(25, 'Belice'),
(26, 'Benin'),
(27, 'Bermudas'),
(28, 'Bhután'),
(29, 'Bolivia'),
(30, 'Bosnia y Herzegovina'),
(31, 'Botsuana'),
(32, 'Isla Bouvet'),
(33, 'Brasil'),
(34, 'Brunéi'),
(35, 'Bulgaria'),
(36, 'Burkina Faso'),
(37, 'Burundi'),
(38, 'Cabo Verde'),
(39, 'Islas Caimán'),
(40, 'Camboya'),
(41, 'Camerún'),
(42, 'Canadá'),
(43, 'República Centroafricana'),
(44, 'Chad'),
(45, 'República Checa'),
(46, 'Chile'),
(47, 'China'),
(48, 'Chipre'),
(49, 'Isla de Navidad'),
(50, 'Ciudad del Vaticano'),
(51, 'Islas Cocos'),
(52, 'Colombia'),
(53, 'Comoras'),
(54, 'República Democrática del Congo'),
(55, 'Congo'),
(56, 'Islas Cook'),
(57, 'Corea del Norte'),
(58, 'Corea del Sur'),
(59, 'Costa de Marfil'),
(60, 'Costa Rica'),
(61, 'Croacia'),
(62, 'Cuba'),
(63, 'Dinamarca'),
(64, 'Dominica'),
(65, 'República Dominicana'),
(66, 'Ecuador'),
(67, 'Egipto'),
(68, 'El Salvador'),
(69, 'Emiratos Árabes Unidos'),
(70, 'Eritrea'),
(71, 'Eslovaquia'),
(72, 'Eslovenia'),
(73, 'España'),
(74, 'Islas ultramarinas de Estados Unidos'),
(75, 'Estados Unidos'),
(76, 'Estonia'),
(77, 'Etiopía'),
(78, 'Islas Feroe'),
(79, 'Filipinas'),
(80, 'Finlandia'),
(81, 'Fiyi'),
(82, 'Francia'),
(83, 'Gabón'),
(84, 'Gambia'),
(85, 'Georgia'),
(86, 'Islas Georgias del Sur y Sandwich del Sur'),
(87, 'Ghana'),
(88, 'Gibraltar'),
(89, 'Granada'),
(90, 'Grecia'),
(91, 'Groenlandia'),
(92, 'Guadalupe'),
(93, 'Guam'),
(94, 'Guatemala'),
(95, 'Guayana Francesa'),
(96, 'Guinea'),
(97, 'Guinea Ecuatorial'),
(98, 'Guinea-Bissau'),
(99, 'Guyana'),
(100, 'Haití'),
(101, 'Islas Heard y McDonald'),
(102, 'Honduras'),
(103, 'Hong Kong'),
(104, 'Hungría'),
(105, 'India'),
(106, 'Indonesia'),
(107, 'Irán'),
(108, 'Iraq'),
(109, 'Irlanda'),
(110, 'Islandia'),
(111, 'Israel'),
(112, 'Italia'),
(113, 'Jamaica'),
(114, 'Japón'),
(115, 'Jordania'),
(116, 'Kazajstán'),
(117, 'Kenia'),
(118, 'Kirguistán'),
(119, 'Kiribati'),
(120, 'Kuwait'),
(121, 'Laos'),
(122, 'Lesotho'),
(123, 'Letonia'),
(124, 'Líbano'),
(125, 'Liberia'),
(126, 'Libia'),
(127, 'Liechtenstein'),
(128, 'Lituania'),
(129, 'Luxemburgo'),
(130, 'Macao'),
(131, 'ARY Macedonia'),
(132, 'Madagascar'),
(133, 'Malasia'),
(134, 'Malawi'),
(135, 'Maldivas'),
(136, 'Malí'),
(137, 'Malta'),
(138, 'Islas Malvinas'),
(139, 'Islas Marianas del Norte'),
(140, 'Marruecos'),
(141, 'Islas Marshall'),
(142, 'Martinica'),
(143, 'Mauricio'),
(144, 'Mauritania'),
(145, 'Mayotte'),
(146, 'México'),
(147, 'Micronesia'),
(148, 'Moldavia'),
(149, 'Mónaco'),
(150, 'Mongolia'),
(151, 'Montserrat'),
(152, 'Mozambique'),
(153, 'Myanmar'),
(154, 'Namibia'),
(155, 'Nauru'),
(156, 'Nepal'),
(157, 'Nicaragua'),
(158, 'Níger'),
(159, 'Nigeria'),
(160, 'Niue'),
(161, 'Isla Norfolk'),
(162, 'Noruega'),
(163, 'Nueva Caledonia'),
(164, 'Nueva Zelanda'),
(165, 'Omán'),
(166, 'Países Bajos'),
(167, 'Pakistán'),
(168, 'Palau'),
(169, 'Palestina'),
(170, 'Panamá'),
(171, 'Papúa Nueva Guinea'),
(172, 'Paraguay'),
(173, 'Perú'),
(174, 'Islas Pitcairn'),
(175, 'Polinesia Francesa'),
(176, 'Polonia'),
(177, 'Portugal'),
(178, 'Puerto Rico'),
(179, 'Qatar'),
(180, 'Reino Unido'),
(181, 'Reunión'),
(182, 'Ruanda'),
(183, 'Rumania'),
(184, 'Rusia'),
(185, 'Sahara Occidental'),
(186, 'Islas Salomón'),
(187, 'Samoa'),
(188, 'Samoa Americana'),
(189, 'San Cristóbal y Nevis'),
(190, 'San Marino'),
(191, 'San Pedro y Miquelón'),
(192, 'San Vicente y las Granadinas'),
(193, 'Santa Helena'),
(194, 'Santa Lucía'),
(195, 'Santo Tomé y Príncipe'),
(196, 'Senegal'),
(197, 'Serbia y Montenegro'),
(198, 'Seychelles'),
(199, 'Sierra Leona'),
(200, 'Singapur'),
(201, 'Siria'),
(202, 'Somalia'),
(203, 'Sri Lanka'),
(204, 'Suazilandia'),
(205, 'Sudáfrica'),
(206, 'Sudán'),
(207, 'Suecia'),
(208, 'Suiza'),
(209, 'Surinam'),
(210, 'Svalbard y Jan Mayen'),
(211, 'Tailandia'),
(212, 'Taiwán'),
(213, 'Tanzania'),
(214, 'Tayikistán'),
(215, 'Territorio Británico del Océano Índico'),
(216, 'Territorios Australes Franceses'),
(217, 'Timor Oriental'),
(218, 'Togo'),
(219, 'Tokelau'),
(220, 'Tonga'),
(221, 'Trinidad y Tobago'),
(222, 'Túnez'),
(223, 'Islas Turcas y Caicos'),
(224, 'Turkmenistán'),
(225, 'Turquía'),
(226, 'Tuvalu'),
(227, 'Ucrania'),
(228, 'Uganda'),
(229, 'Uruguay'),
(230, 'Uzbekistán'),
(231, 'Vanuatu'),
(232, 'Venezuela'),
(233, 'Vietnam'),
(234, 'Islas Vírgenes Británicas'),
(235, 'Islas Vírgenes de los Estados Unidos'),
(236, 'Wallis y Futuna'),
(237, 'Yemen'),
(238, 'Yibuti'),
(239, 'Zambia'),
(240, 'Zimbabue');

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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `id_estado` (`id_estado`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  MODIFY `id_parroquia` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `parroquia_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
