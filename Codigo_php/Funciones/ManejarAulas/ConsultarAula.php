<?php
(function (){
  global $consultarAula;
  $consultarAula  = function() {
    $extras = func_get_args();
    extract($_POST);
 $aulas   = (new aulas)->consultar([
      "campos"=>['id_aula','nombre_aula']
    ]);

    
      echo "<table class=\"table\">";
    foreach ($aulas as $key => $aula) {
      $num_docentes = 0;
      $num_niños =0;
       echo "<tr><th colspan=\"2\">".$aula['nombre_aula']."</th></tr>";
      echo "<tr><td>n° docentes</td> <td>{$num_docentes}</td></tr>";
   echo "<tr><td>n° niños</td> <td>{$num_niños}</td></tr>";
     
     }
    echo "</table>";
    };
})();
