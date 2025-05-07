<?php


function Enunciado($op) {
  switch ($op) {
    case '0':
      return "\"República del Uruguay\" ";
      break;
    case '9':
      return "";
      break;
    case '1':
      return "Inicio";
      break;
    case '2':
      return "Inscripciónes";
      break;
    case '3':
      return "Docentes";
      break;

    case '4':
      return "Reportes";
      break;

    case '5':
      return "Aulas";
      break;
    case '6':
      return "Administración";
    case '7':
      return "mini php db";
      break;
  }
}
