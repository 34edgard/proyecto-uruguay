CREATE TABLE anio_escolar (
  id_anio_escolar INTEGER PRIMARY KEY AUTOINCREMENT,
  anio INTEGER NOT NULL,
  id_periodo_escolar INTEGER NOT NULL,
  id_aula INTEGER NOT NULL,
  ci_escolar INTEGER NOT NULL,
  FOREIGN KEY (id_periodo_escolar) REFERENCES periodo_escolar (id_periodo_escolar),
  FOREIGN KEY (id_aula) REFERENCES aulas (id_aula),
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar)
);






CREATE TABLE anio_escolar_estudiante (
  ci_escolar INTEGER NOT NULL,
  id_anio_escolar INTEGER NOT NULL,
  PRIMARY KEY (ci_escolar, id_anio_escolar),
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar),
  FOREIGN KEY (id_anio_escolar) REFERENCES anio_escolar (id_anio_escolar)
);

CREATE TABLE archivos (
  id_archivo INTEGER PRIMARY KEY AUTOINCREMENT,
  ci_escolar INTEGER NOT NULL,
  nombre_archivo VARCHAR(100) NOT NULL,
  ruta_archivo VARCHAR(255) NOT NULL,
  tipo_archivo TEXT CHECK( tipo_archivo IN ('documento','foto','otro') ) NOT NULL,
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar)
);

CREATE TABLE asistencia (
  id_asistencia INTEGER PRIMARY KEY AUTOINCREMENT,
  ci_escolar INTEGER NOT NULL,
  fecha DATE NOT NULL,
  asistio TEXT CHECK( asistio IN ('si','no') ) DEFAULT 'si' NOT NULL,
  observaciones TEXT,
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar)
);

CREATE TABLE aulas (
  id_aula INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_aula VARCHAR(20) NOT NULL,
  id_seccion INTEGER NOT NULL,
  FOREIGN KEY (id_seccion) REFERENCES secciones (id_seccion)
);

CREATE TABLE conceptos_pago (
  id_concepto_pago INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_concepto VARCHAR(50) NOT NULL
);

CREATE TABLE condicion_medica (
  id_condicion_medica INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_condicion_medica VARCHAR(50) NOT NULL
);

CREATE TABLE condicion_medica_estudiante (
  ci_escolar INTEGER NOT NULL,
  id_condicion_medica INTEGER NOT NULL,
  PRIMARY KEY (ci_escolar, id_condicion_medica),
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar),
  FOREIGN KEY (id_condicion_medica) REFERENCES condicion_medica (id_condicion_medica)
);

CREATE TABLE configuracion (
  id_configuracion INTEGER PRIMARY KEY AUTOINCREMENT,
  clave VARCHAR(50) NOT NULL,
  valor VARCHAR(255) NOT NULL
);

CREATE TABLE correo (
  id_correo INTEGER PRIMARY KEY AUTOINCREMENT,
  email VARCHAR(50) NOT NULL
);

CREATE TABLE direccion (
  id_direccion INTEGER PRIMARY KEY AUTOINCREMENT,
  id_ubicacion INTEGER NOT NULL,
  tipo_direccion TEXT CHECK( tipo_direccion IN ('habitacion','trabajo') ) NOT NULL,
  FOREIGN KEY (id_ubicacion) REFERENCES ubicacion (id_ubicacion)
);

CREATE TABLE discapacidad (
  id_discapacidad INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_discapacidad VARCHAR(70) NOT NULL
);

CREATE TABLE discapacidad_estudiante (
  ci_escolar INTEGER NOT NULL,
  id_discapacidad INTEGER NOT NULL,
  PRIMARY KEY (ci_escolar, id_discapacidad),
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar),
  FOREIGN KEY (id_discapacidad) REFERENCES discapacidad (id_discapacidad)
);

CREATE TABLE docente (
  id_docente INTEGER PRIMARY KEY AUTOINCREMENT,
  cedula INTEGER NOT NULL,
  nombres VARCHAR(30) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  estado TEXT CHECK( estado IN ('activo','inactivo') ) DEFAULT 'activo' NOT NULL
);

CREATE TABLE docente_aula (
  id_docente INTEGER NOT NULL,
  id_aula INTEGER NOT NULL,
  PRIMARY KEY (id_docente, id_aula),
  FOREIGN KEY (id_docente) REFERENCES docente (id_docente),
  FOREIGN KEY (id_aula) REFERENCES aulas (id_aula)
);

CREATE TABLE docente_nivel (
  id_docente INTEGER NOT NULL,
  id_nivel INTEGER NOT NULL,
  PRIMARY KEY (id_docente, id_nivel),
  FOREIGN KEY (id_docente) REFERENCES docente (id_docente),
  FOREIGN KEY (id_nivel) REFERENCES niveles (id_nivel)
);

CREATE TABLE docente_seccion (
  id_docente INTEGER NOT NULL,
  id_seccion INTEGER NOT NULL,
  PRIMARY KEY (id_docente, id_seccion),
  FOREIGN KEY (id_docente) REFERENCES docente (id_docente),
  FOREIGN KEY (id_seccion) REFERENCES secciones (id_seccion)
);

CREATE TABLE documentos_inscripcion (
  id_documento INTEGER PRIMARY KEY AUTOINCREMENT,
  ci_escolar INTEGER NOT NULL,
  id_tipo_documento INTEGER NOT NULL,
  estado TEXT CHECK( estado IN ('entregado','pendiente') ) DEFAULT 'pendiente' NOT NULL,
  observaciones TEXT,
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar),
  FOREIGN KEY (id_tipo_documento) REFERENCES tipo_documento (id_tipo_documento)
);

CREATE TABLE estado (
  id_estado INTEGER PRIMARY KEY AUTOINCREMENT,
  id_pais INTEGER NOT NULL,
  nombre_estado VARCHAR(45) NOT NULL,
  FOREIGN KEY (id_pais) REFERENCES pais (id_pais)
);

CREATE TABLE estado_nutricional (
  id_estado_nutricional INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_estado_nutricional VARCHAR(50) NOT NULL
);

CREATE TABLE estado_nutricional_estudiante (
  ci_escolar INTEGER NOT NULL,
  id_estado_nutricional INTEGER NOT NULL,
  PRIMARY KEY (ci_escolar, id_estado_nutricional),
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar),
  FOREIGN KEY (id_estado_nutricional) REFERENCES estado_nutricional (id_estado_nutricional)
);

CREATE TABLE estudiante (
  ci_escolar INTEGER PRIMARY KEY NOT NULL,
  nombres VARCHAR(30) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  id_lugar_nacimiento INTEGER NOT NULL,
  id_nacionalidad INTEGER NOT NULL,
  edad_ano INTEGER NOT NULL,
  edad_meses INTEGER NOT NULL,
  sexo TEXT CHECK( sexo IN ('masculino','femenino') ) NOT NULL,
  id_ubicacion INTEGER NOT NULL,
  id_procedencia INTEGER NOT NULL,
  id_condicion_medica INTEGER NOT NULL,
  id_discapacidad INTEGER NOT NULL,
  id_estado_nutricional INTEGER NOT NULL,
  FOREIGN KEY (id_lugar_nacimiento) REFERENCES lugar_nacimiento (id_lugar_nacimiento),
  FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad (id_nacionalidad),
  FOREIGN KEY (id_ubicacion) REFERENCES ubicacion (id_ubicacion),
  FOREIGN KEY (id_procedencia) REFERENCES procedencia (id_procedencia),
  FOREIGN KEY (id_condicion_medica) REFERENCES condicion_medica (id_condicion_medica),
  FOREIGN KEY (id_discapacidad) REFERENCES discapacidad (id_discapacidad),
  FOREIGN KEY (id_estado_nutricional) REFERENCES estado_nutricional (id_estado_nutricional)
);

CREATE TABLE eventos (
  id_evento INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_evento VARCHAR(100) NOT NULL,
  fecha_evento DATE NOT NULL,
  descripcion TEXT
);

CREATE TABLE horarios (
  id_horario INTEGER PRIMARY KEY AUTOINCREMENT,
  id_aula INTEGER NOT NULL,
  dia_semana TEXT CHECK( dia_semana IN ('lunes','martes','miércoles','jueves','viernes','sábado','domingo') ) NOT NULL,
  hora_inicio TIME NOT NULL,
  hora_fin TIME NOT NULL,
  actividad VARCHAR(100) NOT NULL,
  FOREIGN KEY (id_aula) REFERENCES aulas (id_aula)
);

CREATE TABLE incidentes (
  id_incidente INTEGER PRIMARY KEY AUTOINCREMENT,
  ci_escolar INTEGER NOT NULL,
  fecha_incidente DATE NOT NULL,
  descripcion TEXT NOT NULL,
  acciones_tomadas TEXT,
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar)
);

CREATE TABLE inscripciones (
  id_inscripcion INTEGER PRIMARY KEY AUTOINCREMENT,
  ci_escolar INTEGER NOT NULL,
  fecha_inscripcion DATE NOT NULL,
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar)
);

CREATE TABLE inscripciones_estudiante (
  ci_escolar INTEGER NOT NULL,
  id_inscripcion INTEGER NOT NULL,
  PRIMARY KEY (ci_escolar, id_inscripcion),
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar),
  FOREIGN KEY (id_inscripcion) REFERENCES inscripciones (id_inscripcion)
);

CREATE TABLE lugar_nacimiento (
  id_lugar_nacimiento INTEGER PRIMARY KEY AUTOINCREMENT,
  id_estado INTEGER NOT NULL,
  id_municipio INTEGER NOT NULL,
  id_parroquia INTEGER NOT NULL,
  FOREIGN KEY (id_estado) REFERENCES estado (id_estado),
  FOREIGN KEY (id_municipio) REFERENCES municipio (id_municipio),
  FOREIGN KEY (id_parroquia) REFERENCES parroquia (id_parroquia)
);

CREATE TABLE municipio (
  id_municipio INTEGER PRIMARY KEY AUTOINCREMENT,
  id_estado INTEGER NOT NULL,
  nombre_municipio VARCHAR(45) NOT NULL,
  FOREIGN KEY (id_estado) REFERENCES estado (id_estado)
);

CREATE TABLE nacionalidad (
  id_nacionalidad INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_nacionalidad VARCHAR(50) NOT NULL
);

CREATE TABLE nivel_instruccion (
  id_nivel_instruccion INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_nivel_instruccion VARCHAR(30) NOT NULL
);

CREATE TABLE niveles (
  id_nivel INTEGER PRIMARY KEY AUTOINCREMENT,
  id_tipo_nivel INTEGER NOT NULL,
  FOREIGN KEY (id_tipo_nivel) REFERENCES tipo_nivel (id_tipo_nivel)
);

CREATE TABLE notificaciones (
  id_notificacion INTEGER PRIMARY KEY AUTOINCREMENT,
  id_representante INTEGER NOT NULL,
  mensaje TEXT NOT NULL,
  fecha_envio DATETIME NOT NULL,
  estado TEXT CHECK( estado IN ('enviada','leida') ) DEFAULT 'enviada' NOT NULL,
  FOREIGN KEY (id_representante) REFERENCES representantes (id_representante)
);

CREATE TABLE ocupacion (
  id_ocupacion INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_ocupacion VARCHAR(30) NOT NULL
);

CREATE TABLE pagos (
  id_pago INTEGER PRIMARY KEY AUTOINCREMENT,
  ci_escolar INTEGER NOT NULL,
  id_concepto_pago INTEGER NOT NULL,
  monto DECIMAL(10,2) NOT NULL,
  fecha_pago DATE NOT NULL,
  estado TEXT CHECK( estado IN ('pendiente','pagado') ) DEFAULT 'pendiente' NOT NULL,
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar),
  FOREIGN KEY (id_concepto_pago) REFERENCES conceptos_pago (id_concepto_pago)
);

CREATE TABLE pais (
  id_pais INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_pais VARCHAR(45) NOT NULL
);

CREATE TABLE parroquia (
  id_parroquia INTEGER PRIMARY KEY AUTOINCREMENT,
  id_municipio INTEGER NOT NULL,
  nombre_parroquia VARCHAR(45) NOT NULL,
  FOREIGN KEY (id_municipio) REFERENCES municipio (id_municipio)
);

CREATE TABLE periodo_escolar (
  id_periodo_escolar INTEGER PRIMARY KEY AUTOINCREMENT,
  periodo VARCHAR(10) NOT NULL
);

CREATE TABLE peso (
  id_peso INTEGER PRIMARY KEY AUTOINCREMENT,
  ci_escolar INTEGER NOT NULL,
  peso INTEGER NOT NULL,
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar)
);

CREATE TABLE prendas (
  id_prenda INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_prenda VARCHAR(35) NOT NULL
);

CREATE TABLE procedencia (
  id_procedencia INTEGER PRIMARY KEY AUTOINCREMENT,
  id_tipo_procedencia INTEGER NOT NULL,
  nombre_procedencia VARCHAR(40) NOT NULL,
  FOREIGN KEY (id_tipo_procedencia) REFERENCES tipo_procedencia (id_tipo_procedencia)
);

CREATE TABLE representantes (
  id_representante INTEGER PRIMARY KEY AUTOINCREMENT,
  cedula INTEGER NOT NULL,
  nombres VARCHAR(45) NOT NULL,
  apellidos VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  edad INTEGER NOT NULL,
  id_nacionalidad INTEGER NOT NULL,
  id_nivel_instruccion INTEGER NOT NULL,
  id_ocupacion INTEGER NOT NULL,
  id_direccion_habitacion INTEGER NOT NULL,
  id_direccion_trabajo INTEGER NOT NULL,
  FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad (id_nacionalidad),
  FOREIGN KEY (id_nivel_instruccion) REFERENCES nivel_instruccion (id_nivel_instruccion),
  FOREIGN KEY (id_ocupacion) REFERENCES ocupacion (id_ocupacion),
  FOREIGN KEY (id_direccion_habitacion) REFERENCES direccion (id_direccion),
  FOREIGN KEY (id_direccion_trabajo) REFERENCES direccion (id_direccion)
);

CREATE TABLE roles (
  id_rol INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_rol VARCHAR(30) NOT NULL
);

CREATE TABLE salud_estudiante (
  id_salud INTEGER PRIMARY KEY AUTOINCREMENT,
  ci_escolar INTEGER NOT NULL,
  alergias TEXT,
  medicamentos TEXT,
  observaciones TEXT,
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar)
);

CREATE TABLE secciones (
  id_seccion INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_seccion VARCHAR(20) NOT NULL,
  id_nivel INTEGER NOT NULL,
  FOREIGN KEY (id_nivel) REFERENCES niveles (id_nivel)
);

CREATE TABLE sector (
  id_sector INTEGER PRIMARY KEY AUTOINCREMENT,
  id_parroquia INTEGER NOT NULL,
  nombre_sector VARCHAR(45) NOT NULL,
  FOREIGN KEY (id_parroquia) REFERENCES parroquia (id_parroquia)
);

CREATE TABLE tallas (
  id_talla INTEGER PRIMARY KEY AUTOINCREMENT,
  ci_escolar INTEGER NOT NULL,
  id_prenda INTEGER NOT NULL,
  talla VARCHAR(10) NOT NULL,
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar),
  FOREIGN KEY (id_prenda) REFERENCES prendas (id_prenda)
);

CREATE TABLE telefonos (
  id_telefono INTEGER PRIMARY KEY AUTOINCREMENT,
  ci_escolar INTEGER,
  id_representante INTEGER,
  id_docente INTEGER,
  tipo_telefono TEXT CHECK( tipo_telefono IN ('fijo','celular') ) NOT NULL,
  codigo_area INTEGER,
  operadora VARCHAR(10),
  numero_telefono VARCHAR(15) NOT NULL,
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar),
  FOREIGN KEY (id_representante) REFERENCES representantes (id_representante),
  FOREIGN KEY (id_docente) REFERENCES docente (id_docente)
);

CREATE TABLE tipo_documento (
  id_tipo_documento INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_documento VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_nivel (
  id_tipo_nivel INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_nivel VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_parentesco (
  id_tipo_parentesco INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(30) NOT NULL
);

CREATE TABLE tipo_procedencia (
  id_tipo_procedencia INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_procedencia VARCHAR(50) NOT NULL
);

CREATE TABLE tratamiento (
  id_tratamiento INTEGER PRIMARY KEY AUTOINCREMENT,
  id_condicion_medica INTEGER NOT NULL,
  nombre_tratamiento VARCHAR(100) NOT NULL,
  FOREIGN KEY (id_condicion_medica) REFERENCES condicion_medica (id_condicion_medica)
);

CREATE TABLE ubicacion (
  id_ubicacion INTEGER PRIMARY KEY AUTOINCREMENT,
  id_sector INTEGER NOT NULL,
  nro_vivienda VARCHAR(45) NOT NULL,
  calle_vereda_avenida VARCHAR(45) NOT NULL,
  FOREIGN KEY (id_sector) REFERENCES sector (id_sector)
);

CREATE TABLE usuario (
  id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
  cedula INTEGER NOT NULL,
  nombres VARCHAR(30) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  id_rol INTEGER NOT NULL,
  usuario VARCHAR(30) NOT NULL,
  id_correo INTEGER NOT NULL,
  contrasena VARCHAR(166) NOT NULL,
  estado TEXT CHECK( estado IN ('activo','inactivo') ) DEFAULT 'activo' NOT NULL,
  FOREIGN KEY (id_rol) REFERENCES roles (id_rol),
  FOREIGN KEY (id_correo) REFERENCES correo (id_correo)
);


CREATE TABLE parentesco (
  id_tipo_parentesco INTEGER NOT NULL,
  cedula INTEGER NOT NULL,
  ci_escolar INTEGER NOT NULL,
  PRIMARY KEY (id_tipo_parentesco, cedula, ci_escolar),
  FOREIGN KEY (id_tipo_parentesco) REFERENCES tipo_parentesco (id_tipo_parentesco),
  FOREIGN KEY (cedula) REFERENCES representantes (cedula),
  FOREIGN KEY (ci_escolar) REFERENCES estudiante (ci_escolar)
) ;

