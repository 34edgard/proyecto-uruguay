<?php

extract($_GET);

$file =  file_get_contents('.'.$f);

echo "<code>$file</code>";