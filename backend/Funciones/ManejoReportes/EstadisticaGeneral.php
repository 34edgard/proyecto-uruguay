<?php
namespace Funciones\ManejoReportes;
use App\Personas\Estudiante;

use Liki\Plantillas\Plantilla;
use Funciones\ManejoReportes\NiñosPorEdad;
use Funciones\CalcularPorcentaje;

class EstadisticaGeneral{
    public static function estadisticaGeneral(){
       
    
    $data = [             
        "campos"=>['COUNT(id_procedencia) as p']
    ];
    $estudiantes = new Estudiante();
    
    
    //calcularPorcentaje
    
    $totalNiños = $estudiantes->consultar([
        "campos"=>['sexo']
    ]);
    $nNiños = 0;
    $nNiñas = 0;
    
    foreach($totalNiños as $niño){
       if($niño['sexo'] =='femenino') $nNiñas++;
       if($niño['sexo'] =='masculino') $nNiños++;
    }
    $nTotalNiños = count($totalNiños);
 // echo round(calcularPorcentaje($nTotalNiños,$nNiños));
$porcentajeNinas = round(CalcularPorcentaje::calcularPorcentaje($nTotalNiños,$nNiñas));
$porcentajeNinos = round(CalcularPorcentaje::calcularPorcentaje($nTotalNiños,$nNiños));
    
    
    $data['where'] = [['campo'=>'id_procedencia',
   "operador"=>'=',"valor"=>3 ]];
   $pro = $estudiantes->consultar($data)[0];
    
    
    
    
      $data['where'] =[ ['campo'=>'id_procedencia',
       "operador"=>'!=',"valor"=>3 ]];
          $pub = $estudiantes->consultar($data)[0];
       
    
   // print_r($pro);
 //   print_r($pub);

    
    


$niñosEdad[] = NiñosPorEdad::niñosPorEdad(3);
 
$niñosEdad[] = NiñosPorEdad::niñosPorEdad(4);
 
$niñosEdad[] = NiñosPorEdad::niñosPorEdad(5);
 
$niñosEdad[] = NiñosPorEdad::niñosPorEdad(6);
 







     Plantilla::HTML('Reportes/tablasGraficos',[
          "porcentajeNinos"=>$porcentajeNinos,
          "porcentajeNinas"=>$porcentajeNinas,
          "nPrivados"=>$pro['p'],
          "nPublicos"=>$pub['p'],
        
        "niñosEdad"=>$niñosEdad
                      
        ]);
    }
}