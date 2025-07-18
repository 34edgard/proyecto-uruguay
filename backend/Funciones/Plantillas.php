<?php
function plantilla(string $nombre ,array $datos =[]){
  extract($datos);
  $nombre = str_replace('—','/',$nombre);
//echo $nombre;
  include "./frontend/Html/{$nombre}.php";

}


