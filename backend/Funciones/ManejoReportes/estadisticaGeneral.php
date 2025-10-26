<?php
(function(){
    global $estadisticaGeneral;
    $estadisticaGeneral=function(){
       
    
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
$porcentajeNinas = round(calcularPorcentaje($nTotalNiños,$nNiñas));
$porcentajeNinos = round(calcularPorcentaje($nTotalNiños,$nNiños));
    
    
    $data['where'] = [['campo'=>'id_procedencia',
   "operador"=>'=',"valor"=>3 ]];
   $pro = $estudiantes->consultar($data)[0];
    
    
    
    
      $data['where'] =[ ['campo'=>'id_procedencia',
       "operador"=>'!=',"valor"=>3 ]];
          $pub = $estudiantes->consultar($data)[0];
       
    
   // print_r($pro);
 //   print_r($pub);

    
    


$niñosEdad[] = niñosPorEdad(3);
 
$niñosEdad[] = niñosPorEdad(4);
 
$niñosEdad[] = niñosPorEdad(5);
 
$niñosEdad[] = niñosPorEdad(6);
 







     plantilla('Reportes/tablasGraficos',[
          "porcentajeNinos"=>$porcentajeNinos,
          "porcentajeNinas"=>$porcentajeNinas,
          "nPrivados"=>$pro['p'],
          "nPublicos"=>$pub['p'],
        
        "niñosEdad"=>$niñosEdad
                      
        ]);
    };
})();