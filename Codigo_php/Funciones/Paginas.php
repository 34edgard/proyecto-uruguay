<?php

function paginas(string $nombre ,array $datos =[]){
  extract($datos);
  include "./Publico/Paginas/{$nombre}.php";

}