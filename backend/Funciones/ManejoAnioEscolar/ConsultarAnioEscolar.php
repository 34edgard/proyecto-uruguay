<?php
(function(){
  global $consultarAnioEscolar;
  $consultarAnioEscolar = function(){
    $anioEscolar = (new año_escolar)->consultar([
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
  };
})();
