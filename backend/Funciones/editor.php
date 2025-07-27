<?php
function webEditor(){
    
echo '<link rel="stylesheet" href="/frontend/css/editor.css">';
// Assuming 'backend/includer.php' contains the listarArchivosEnDirectorio function.
// It's good practice to ensure this file exists and handles file listing securely.
//include "backend/includer.php"; 

// Get the list of files and directories from the current directory.
// It's crucial that listarArchivosEnDirectorio provides a structured array
// that distinguishes between files and directories for proper rendering.
// Example of how $app should ideally look (from listarArchivosEnDirectorio):
// [
//     'src' => [
//         'components' => [
//             'Button.js' => 'src/components/Button.js',
//             'Input.js' => 'src/components/Input.js',
//         ],
//         'index.html' => 'src/index.html',
//     ],
//     'README.md' => 'README.md',
//     'package.json' => 'package.json',
// ]
$app = listarArchivosEnDirectorio(__DIR__.'/');

/**
 * Generates an HTML dropdown menu for a file explorer.
 *
 * @param array $items An associative array where keys are file/directory names
 * and values are either arrays (for directories) or strings (for files).
 * @param string $currentPath The path of the current parent directory.
 * @return string The generated HTML.
 */
function buildFileExplorerMenu(array $items, string $currentPath = ''): string {
    $html = '';

    foreach ($items as $name => $content) {
        $is_directory = is_array($content);
        $display_name = htmlspecialchars($name); // Sanitize display name

        // Calculate the full path for the current item
      $dir ='';
     if(is_string($name)) {
        $dir = $name;
       }
      $itemFullPath = $currentPath . $dir;
        
        
        if ($is_directory) {
            // For directories, create a dropdown button.
            $html .= '<div class="dropdown">';
            $html .= '<button class="dropbtn">' . $display_name . ' <span class="indicator">&#9658;</span></button>'; 
            $html .= '<div class="dropdown-content">';
            // Recursively call the function, passing the new path for the subdirectory
            $html .= buildFileExplorerMenu($content, $itemFullPath . '/'); // Append '/' for directories
            $html .= '</div>'; // Close dropdown-content
            $html .= '</div>'; // Close dropdown
        } else {
            // For files, create a clickable link.
            // $content here should ideally be just the filename, not the full path again,
            // as the full path is built by $itemFullPath.
            // If listarArchivosEnDirectorio already returns full paths in $content,
            // then use $content directly. Assuming for now it's just the filename.
            
         // $itemFullPath = $itemFullPath ?? $currentPath.$content;
            $finalFilePath = htmlspecialchars($itemFullPath.'/'.$content) ; 
            
            $html .= '<a href="#" data-filepath="' . $finalFilePath . '" hx-get="/file?f=' . $finalFilePath . '" hx-target="#file-content">' . $content . '</a>';
        }
    }
    
    return $html;
}

echo buildFileExplorerMenu($app, '/'); // Start with an empty current path for the root





echo ' 
<div id="file-content" style="color:white">
    Select a file to view its content.
</div>

<script src="/frontend/js/htmx.js"></script>
 
';

}
