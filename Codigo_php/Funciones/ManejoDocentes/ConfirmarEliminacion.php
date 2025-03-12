<?php
(function (){
  global $ConfirmarEliminacion;
  $ConfirmarEliminacion = function (){
    //  extract($_GET);
 //   print_r($_GET);
      echo "<h2>deseas eliminar al docente {$_GET['ConfirmarEliminacion']}</h2>";
   echo "<button
   class=\"btn btn-danger\"
   name=\"eliminar\"
   value=\"{$_GET['ConfirmarEliminacion']}\"
   hx-get=\"/Codigo_php/Modulos/Gestionar_Docente.php\"
   data-bs-dismiss=\"modal\"
   hx-target=\"#tablaDeDocentes\"
   >";
   echo "SI";
   echo "</button>";
   
    };
})();