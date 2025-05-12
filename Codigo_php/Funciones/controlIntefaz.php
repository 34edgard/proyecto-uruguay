<?php
function cambiarPagina(string $pagina)
{
  echo "<script>
  navigation.navigate('/$pagina');
  </script>";
}
