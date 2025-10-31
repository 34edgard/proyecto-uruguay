<?php

namespace Funciones\ManejoAnioEscolar;
use Liki\Plantillas\Plantilla;
use App\Plantel\AnioEscolar;
use App\Personas\Estudiante;

class ConsultoAnioEscolar{
  public static function consultarAnioEscolar(){
    $anioEscolar = (new AnioEscolar)->consultar([
      "campos"=>['ci_escolar']
    ]);
    echo "<table class='table'>";
    echo "<tr>";
    echo "<th>cedula escolar</th>";
    echo "<th>nombres</th>";
    echo "<th>apellidos</th>";
    echo "<th>sexo</th>";
    echo "<th>fecha nacimiento</th>";
    echo "</tr>";
   foreach ($anioEscolar as $key => $anio) {
     $estudiantes = (new Estudiante)->consultar([
       "campos"=>['ci_escolar','nombres','apellidos','sexo','fecha_nacimiento'],
       
    "where"=>[
        [
        "campo"=>'ci_escolar' ,"operador"=>'=',   "valor"=>$anio['ci_escolar']
        ]
    ]
    
     ])[0];
     echo "<tr>";
    
  //  print_r($estudiantes);
     foreach ($estudiantes as $campo => $estudiante) {
      echo "<td>".$estudiante."</td>";
     }
     echo "</tr>";
   }

   echo "</table>";
  }
}
