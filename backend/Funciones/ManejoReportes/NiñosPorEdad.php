<?php
namespace Funciones\ManejoReportes;
use App\Personas\Estudiante;
use Funciones\Edad;


class NiñosPorEdad{
public static function niñosPorEdad($edad){
    $estudiantes = new Estudiante();
    $niñoEdad = $estudiantes->consultar([
       "campos"=>['fecha_nacimiento','sexo']   
    ]);
    $nF = 0;
    $nM = 0;
    $total = 0;
    //print_r($niñoEdad);
    foreach($niñoEdad as $campo){
    if(Edad::Edad($campo['fecha_nacimiento']) != $edad) continue;
    if($campo['sexo'] == 'femenino') $nF++;
    if($campo['sexo'] == 'masculino') $nM++;
        $total++;
    }
    
    
    return    [
        "edad"=>$edad,
        "total"=>$total,
        "nM"=>$nM,
        "nF"=>$nF
    ];
}

}
