<?php
function plantilla(string $nombre ,array $datos =[]){
  extract($datos);
  include "./Publico/Html/{$nombre}.php";

}
