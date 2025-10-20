<?php
function filesGet(){
    
$Extras = func_get_args();
extract($Extras[0]);
echo $f;
$file =  file_get_contents('.'.$f);

echo "<textarea>$file</textarea>";

}