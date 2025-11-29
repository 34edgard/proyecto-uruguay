<?php

use App\Personas\Estudiante;

use App\Plantel\AnioEscolar;
use App\Plantel\AnioEscolarEstudiante;

use App\Administracion\Archivos;
use App\Administracion\Asistencia;

use App\DatosMedicos\CondicionMedicaEstudiante;
use App\DatosMedicos\DiscapacidadEstudiante;

use App\Inscripcion\DocumentosInscripcion;
use App\DatosMedicos\EstadoNutricionalEstudiante;
use App\Administracion\Incidentes;

use App\Inscripcion\Inscripciones;
use App\Inscripcion\InscripcionesEstudiante;

use App\Administracion\Pagos;

use App\Inscripcion\Peso;

use App\DatosMedicos\SaludEstudiante;
use App\DatosExtra\Tallas;
use App\DatosExtra\Telefono;
use App\Inscripcion\Parentesco;


return new class {
    public static function run($p,$f){
        extract($p);
$datos['where'] =[
    [ "campo"=>'ci_escolar',"operador"=>'=',"valor"=>$ci_escolar ]
            ];
        
(new AnioEscolar)->eliminar($datos);
(new AnioEscolarEstudiante)->eliminar($datos);
(new Archivos)->eliminar($datos);
(new Asistencia)->eliminar($datos);
(new CondicionMedicaEstudiante)->eliminar($datos);

(new DiscapacidadEstudiante)->eliminar($datos);
(new DocumentosInscripcion)->eliminar($datos);
(new EstadoNutricionalEstudiante)->eliminar($datos);
(new Incidentes)->eliminar($datos);
(new Inscripciones)->eliminar($datos);

(new InscripcionesEstudiante)->eliminar($datos);
(new Pagos)->eliminar($datos);
(new Peso)->eliminar($datos);
(new SaludEstudiante)->eliminar($datos);
(new Tallas)->eliminar($datos);

(new Telefono)->eliminar($datos);
(new Parentesco)->eliminar($datos);
(new Estudiante)->eliminar($datos);
        
        $f[0]();
    }
};