<?php
(function (){
  global $confirmarEliminacion;
  $confirmarEliminacion = function (){
  echo "<h2>desea eliminar al usuario  {$_GET['confimarEliminacion']}</h2>";
  echo "<button class='btn btn-danger' 
        data-bs-toggle='modal' data-bs-target='#firefoxModal'
        name=\"ci\"
      value=\"{$_GET['confimarEliminacion']}\"
      hx-get=\"/Gestion_Usuario?eliminarUsuario\"
      hx-trigger=\"click\"
      hx-target=\"#usuarios\"
        >Si</button>";
};
})();
