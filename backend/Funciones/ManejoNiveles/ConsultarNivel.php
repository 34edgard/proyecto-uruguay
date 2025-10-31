<?php


namespace Funciones\ManejoNiveles;

use App\Plantel\TipoNivel;

 class ConsultarNivel{
  public static function consultarNivel() {

    $niveles = (new TipoNivel)->consultar([
      "campos"=>['nombre_nivel']
    ]);

    echo "<table class=\"table\">";
    foreach ($niveles as $key => $nivel) {
      $num_docentes = 0;
      $num_niños =0;
       echo "<tr><th colspan=\"2\">".$nivel['nombre_nivel']."</th></tr>";
      echo "<tr><td>n° docentes</td> <td>{$num_docentes}</td></tr>";
   echo "<tr><td>n° niños</td> <td>{$num_niños}</td></tr>";
     
     }
    echo "</table>";
  }
}
