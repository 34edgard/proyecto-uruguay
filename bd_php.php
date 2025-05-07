<?php
$op = '7';
include "./Publico/Paginas/enunciado.php";
include "./Publico/Html/Head.php";
include "./Codigo_php/includer.php";
$conn = new ConsultasBD;
$tablas = $conn->consultarRegistro2('show tables');
echo "<ol>";
foreach ($tablas as $key => $tabla) {
  # code...
  echo "<li
    hx-get=\"/table.php?tabla={$tabla['Tables_in_proyecto-uruguay']}\"
    hx-trigger=\"click\"
    hx-target=\"#tabla\"
   >".$tabla['Tables_in_proyecto-uruguay']."</li>";
}
echo "</ol>";
echo "<div id=\"tabla\"></div> ";
