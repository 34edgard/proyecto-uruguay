<?php

function paginas(string $nombre ,array $datos =[]){
  extract($datos);
  include "./frontend/Paginas/{$nombre}.php";

}