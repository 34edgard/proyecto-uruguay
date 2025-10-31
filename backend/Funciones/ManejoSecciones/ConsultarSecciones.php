<?php
namespace Funciones\ManejoSecciones;
use App\Plantel\Secciones;

class ConsultarSecciones{
  public static function consultarSecciones() {

    $niveles = (new Secciones)->consultar([
      "campos"=>['nombre_seccion']
    ]);

    echo "<table class=\"table\">";
    foreach ($niveles as $key => $nivel) {
      $num_docentes = 0;
      $num_niños =0;
       echo "<tr><th colspan=\"2\">".$nivel['nombre_seccion']."</th></tr>";
      echo "<tr><td>n° docentes</td> <td>{$num_docentes}</td></tr>";
   echo "<tr><td>n° niños</td> <td>{$num_niños}</td></tr>";
     
     }
    echo "</table>";
  }
}
