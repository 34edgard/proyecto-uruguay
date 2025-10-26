<?php

namespace Funciones\ManejoUsuarios;

class ConfirmarEliminacion{
  
  public static function confirmarEliminacion(){
  $Extras = func_get_args();
  extract($Extras[0]);

echo "<h2>Realmente desea eliminar al usuario  {$confimarEliminacion}</h2>";
  echo "<button class='btn btn-danger' 
        data-bs-toggle='modal' data-bs-target='#firefoxModal'
        name=\"ci\"
      value=\"{$confimarEliminacion}\"
      hx-get=\"/usuario/eliminar?eliminarUsuario\"
      hx-trigger=\"click\"
      hx-target=\"#usuarios\"
        >Si</button>";
}
}
