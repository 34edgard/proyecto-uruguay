<?php

use App\Controladores\Personas\Estudiante;

use App\Controladores\Plantel\AnioEscolar;
use App\Controladores\Plantel\AnioEscolarEstudiante;

use App\Controladores\Administracion\Archivos;
use App\Controladores\Administracion\Asistencia;

use App\Controladores\DatosMedicos\CondicionMedicaEstudiante;
use App\Controladores\DatosMedicos\DiscapacidadEstudiante;

use App\Controladores\Inscripcion\DocumentosInscripcion;
use App\Controladores\DatosMedicos\EstadoNutricionalEstudiante;
use App\Controladores\Administracion\Incidentes;

use App\Controladores\Inscripcion\Inscripciones;
use App\Controladores\Inscripcion\InscripcionesEstudiante;

use App\Controladores\Administracion\Pagos;

use App\Controladores\Inscripcion\Peso;

use App\Controladores\DatosMedicos\SaludEstudiante;
use App\Controladores\DatosExtra\Tallas;
use App\Controladores\DatosExtra\Telefono;
use App\Controladores\Inscripcion\Parentesco;


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