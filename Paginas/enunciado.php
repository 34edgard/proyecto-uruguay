
<?php


function Enunciado($op){
switch ($op) {
case '0':
    $En = ' 
Desarrollo de un sistema informático para la gestión de inscripción del jardín de infancia "República del Uruguay".
 ';
    break;
case '1':
  $En ="Por favor ingrese la contraseña";
    break;
  case '2':
  $En = "Le damos la bienvenida al sistema ". $_SESSION['usuario'];
    break;
    case '3':
   $En = "Inscripciónes";
    break;
      
    case '4':
    $En = "Matrícula escolar";
    break;
    
    case '5':
      //se refiere a los profesores por los momentos 
    $En = "Docentes";
    break;
    case '6':
    $En =  "Aulas";
    break;
      case '7':
    $En =  "........";
    break;
    case '8':
      // se cambiara a documentos 
    $En = " Planilla de inscripción";
    break;
    
    case '9':
    $En = "Ajustes";
    break;
    
  
}
echo $En;
}
