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
CREATE TABLE `inscripciones_estudiante` (

  `ci_escolar` int(11) NOT NULL,

  `id_inscripcion` int(11) NOT NULL,
  PRIMARY KEY (`ci_escolar`, `id_inscripcion`)
  -- FOREIGN KEY (`ci_escolar`) REFERENCES `estudiante`(`ci_escolar`),
  -- FOREIGN KEY (`id_inscripcion`) REFERENCES `inscripciones`(`id_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;