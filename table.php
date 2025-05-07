<?php
include "./Codigo_php/includer.php";
$conn = new ConsultasBD;    

$tablas = $conn->consultarRegistro2('select * from `'.$_GET['tabla'].'`');

echo "<table>";
echo "<tr>";
foreach ($tablas[0] as $key => $nombre) {
  echo "<td>".$key."</td>";
}
echo "</tr>";


foreach ($tablas as $key => $campos) {
  echo "<tr>";
  foreach($campos as $campo){ 
    echo "<td>".$campo."</td>";
  }
  echo "</tr>";
}
echo "</table>";
