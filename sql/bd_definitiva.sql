INSERT INTO `pais` (`nombre_pais`) VALUES ('Venezuela');

INSERT INTO `estado`  (`id_pais`, `nombre_estado`) VALUES (1, 'Amazonas')
,(1, 'Anzoátegui'),(1, 'Aragua')
,(1, 'Barinas'),(1, 'Bolívar')
,(1, 'Carabobo'),(1, 'Cojedes')
,(1, 'Delta Amacuro'),(1, 'Falcón')
,(1, 'Guárico'),(1, 'Lara')
,(1, 'Mérida'),(1, 'Miranda')
,(1, 'Monagas'),(1, 'Nueva Esparta')
,(1, 'Portuguesa'),(1, 'Sucre')
,(1, 'Táchira'),(1, 'Trujillo')
,(1, 'Vargas'),(1, 'Yaracuy')
,(1, 'Zulia')
,(1, 'Dependencias Federales');

INSERT INTO `municipio`  (`id_estado`, `nombre_municipio`) VALUES (14, 'Maturín')
, (14, 'Acosta')
, (14, 'Aguasay')
, (14, 'Bolívar')
, (14, 'Caripe')
, (14, 'Cedeño')
, (14, 'Ezequiel Zamora')
, (14, 'Libertador')
, (14, 'Piar')
, (14, 'Punceres')
, (14, 'Santa Bárbara')
, (14, 'Sotillo')
, (14, 'Uracoa');

INSERT INTO `parroquia`  (`id_municipio`, `nombre_parroquia`) VALUES (1, 'El Furrial')
,(1, 'San Simón')
,(1, 'Alto de Los Godos')
,(1, 'Boquerón')
,(1, 'Las Cocuizas')
,(1, 'San Vicente')
,(1, 'El Corozo')
,(1, 'La Cruz')
,(1, 'Maturín')
,(1, 'Jusepín');


INSERT INTO `sector` (`id_parroquia`, `nombre_sector`) VALUES
(9, 'Zona Centro'),
(9, 'Barrio Obrero'),
(9, 'Las Cocuizas'),
(9, 'Los Guaritos I'),
(9, 'Los Guaritos II'),
(9, 'Los Guaritos III'),
(9, 'Los Guaritos IV'),
(9, 'Los Guaritos V'),
(9, 'El Parquecito'),
(9, 'La Muralla'),
(9, 'La Floresta'),
(9, 'Fundemos'),
(9, 'Simón Bolívar'),
(9, 'Juanico'),
(9, 'Los Cortijos'),
(9, 'Ciudad Universitaria'),
(9, 'Alto Paramaconi'),
(9, 'Paramaconi'),
(9, 'Villas del Paramaconi'),
(9, 'Terrazas del Paramaconi'),
(9, 'Doña Menca I'),
(9, 'Doña Menca II'),
(9, 'Prados del Este'),
(9, 'Avenida Bella Vista'),
(9, 'Las Brisas del Orinoco'),
(9, 'La Concordia'),
(9, 'Complejo Habitacional Paramaconi'),
(9, 'Lomas del Viento'),
(9, 'Valle Verde'),
(9, 'El Guayabal'),
(9, 'La Cruz'),
(9, 'Virgen del Valle'),
(9, '23 de Enero');


