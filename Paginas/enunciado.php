<?php


function Enunciado($op) {
  switch ($op) {
    case '0':
      $En = ' "República del Uruguay" ';
      break;
    case '9':
      $En = "Inicio de  Sesión";
      break;
    case '1':
      $En = "inicio";
      break;
    case '2':
      $En = "Inscripciónes ";
      break;
    case '3':
      $En = "Docentes";
      break;

    case '4':
      $En = "Reportes";
      break;

    case '5':
      $En = "Aulas";
      break;
    case '6':
      $En = "cambiar contraseña";
      break;



  }
  
  echo $En;
}