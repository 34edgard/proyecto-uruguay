<style>
/* Basic reset for better consistency */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #282c34; /* Dark background for code editor feel */
    color: #abb2bf; /* Light text color */
}

/* Dropdown container */
.dropdown {
  position: relative;
  display: block; /* Make dropdowns stack vertically */
  margin-bottom: 2px; /* Small space between items */
}

/* Dropdown button (for directories) */
.dropbtn {
  background-color: #3e4451; /* Darker background for buttons */
  color: white;
  padding: 8px 12px; /* Smaller padding */
  font-size: 14px; /* Smaller font size */
  border: none;
  cursor: pointer;
  width: 100%; /* Make button take full width */
  text-align: left; /* Align text to the left */
  display: flex; /* Use flexbox for alignment */
  justify-content: space-between; /* Push indicator to the right */
  align-items: center;
  border-radius: 3px; /* Slightly rounded corners */
}

.dropbtn:hover {
  background-color: #4a505b; /* Slightly lighter on hover */
}

/* Indicator for directories */
.indicator {
    transition: transform 0.2s ease-in-out; /* Smooth rotation */
}

/* Rotate indicator when dropdown content is shown */
.dropdown:hover .indicator {
    transform: rotate(90deg);
}

/* Dropdown content (files/subdirectories) */
.dropdown-content {
  display: none;
  position: relative; /* Change to relative for natural flow */
  background-color: #21252b; /* Even darker background for content */
  min-width: 100%; /* Take full width of parent */
  box-shadow: 0px 4px 8px 0px rgba(0,0,0,0.3); /* Softer shadow */
  z-index: 1;
  padding-left: 15px; /* Indent for nested items */
  border-left: 1px solid #3e4451; /* Visual indicator for nesting */
}

/* Show the dropdown content when the parent dropdown is hovered */
.dropdown:hover > .dropdown-content {
  display: block;
}

/* Links within dropdown content (files) */
.dropdown-content a {
  color: #abb2bf; /* Light text color for files */
  padding: 8px 12px; /* Smaller padding */
  text-decoration: none;
  display: block;
  font-size: 14px; /* Smaller font size */
}

.dropdown-content a:hover {
  background-color: #3e4451; /* Highlight on hover */
  color: #61afef; /* Change text color on hover for better visibility */
}
</style>



<?php

// Assuming 'backend/includer.php' contains the listarArchivosEnDirectorio function.
// It's good practice to ensure this file exists and handles file listing securely.
include "backend/includer.php"; 

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
            
            $html .= '<a href="#" data-filepath="' . $finalFilePath . '" hx-get="file.php?f=' . $finalFilePath . '" hx-target="#file-content">' . $content . '</a>';
        }
    }
    
    return $html;
}

echo buildFileExplorerMenu($app, '/'); // Start with an empty current path for the root

?>

<div id="file-content" style="color:white">
    Select a file to view its content.
</div>

<script src="/frontend/js/htmx.js"></script>
 