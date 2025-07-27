<?php

// Define the name of the downloaded ZIP file
$zipFileName = 'app-uruguay.zip';

// Define the URL of your GitHub repository's master branch ZIP
$githubZipUrl = 'https://github.com/34edgard/proyecto-uruguay/archive/refs/heads/master.zip';

// --- Download the ZIP file ---
$res = file_get_contents($githubZipUrl);

if ($res === false) {
    die('Error: No se pudo descargar el archivo ZIP desde GitHub.');
}

$file = fopen($zipFileName, 'w');
if ($file === false) {
    die('Error: No se pudo crear el archivo local app-uruguay.zip.');
}

fwrite($file, $res);
fclose($file);
echo 'Archivo ZIP descargado exitosamente.<br>';

// --- Unzip the file ---
$zip = new ZipArchive;
if ($zip->open($zipFileName) === TRUE) {
    $zip->extractTo('./'); // Extract to the current directory
    $zip->close();
    echo '¡Descompresión exitosa!<br>';

    // --- Move contents to root ---
    // The extracted folder typically has the format "repository-name-branch"
    // In your case, it should be "proyecto-uruguay-master"
    $extractedFolderName = 'proyecto-uruguay-master'; 

    // Check if the extracted folder exists
    if (is_dir($extractedFolderName)) {
        $filesAndDirs = scandir($extractedFolderName);
        
        // Remove . and .. from the list
        $filesAndDirs = array_diff($filesAndDirs, array('.', '..'));

        foreach ($filesAndDirs as $item) {
            $sourcePath = $extractedFolderName . '/' . $item;
            $destinationPath = './' . $item;

            // Move each item
            if (rename($sourcePath, $destinationPath)) {
                echo "Movido: $item<br>";
            } else {
                echo "Falló al mover: $item<br>";
            }
        }
        
        // After moving, remove the now empty extracted folder
        if (rmdir($extractedFolderName)) {
            echo "Carpeta '$extractedFolderName' eliminada.<br>";
        } else {
            echo "Falló al eliminar la carpeta '$extractedFolderName'.<br>";
        }

    } else {
        echo "Advertencia: La carpeta '$extractedFolderName' no se encontró después de la descompresión.<br>";
    }

    // Optionally, delete the original ZIP file after extraction and moving
    if (file_exists($zipFileName)) {
        unlink($zipFileName);
        echo 'Archivo ZIP original eliminado.<br>';
    }

} else {
    echo '¡Falló la descompresión!';
}
?>