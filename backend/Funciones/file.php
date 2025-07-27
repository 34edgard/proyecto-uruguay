<?php
function filesGet(){
extract($_GET);
echo $f;
$file =  file_get_contents('.'.$f);

echo "<textarea>$file</textarea>";

}