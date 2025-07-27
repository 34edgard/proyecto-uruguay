    <?php
    $zip = new ZipArchive;
    if ($zip->open('app-uruguay.zip') === TRUE) {
      $zip->extractTo('./');
      $zip->close();
      echo '¡Descompresión exitosa!';
    } else {
      echo '¡Falló la descompresión!';
    }
    ?>