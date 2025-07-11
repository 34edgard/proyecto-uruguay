<?php
function cambiarPagina(string $pagina)
{
  echo "<script>
  navigation.navigate('/$pagina');
  </script>";
}

function scriptAlert(string $mensage){
 echo "<script >alert('{$mensage}')</script>";
        
}