<?php
(function (){
  global $generarCedulaEscolar;
  $generarCedulaEscolar = function ($cedula,$fecha){
    $fh = "".(Fecha($fecha)[0]-2000);
 //   $fh .= Fecha($fecha)[0];
    $ci_escolar = $fh.$cedula;

  $estudiantes = (new Estudiante)->consultar_datos([
       "campos"=>['ci_escolar'],
       "like"=> "_".$ci_escolar."' ORDER BY `ci_escolar` DESC LIMIT 1 --  "
 ]);
$estudiantes = $estudiantes[0]['ci_escolar'];
  if(isset($estudiantes)){
    
    $nuevaCiEscolar = (intval($estudiantes[0]) + 1).$ci_escolar;
  }else{
    $nuevaCiEscolar = "1".$ci_escolar;
  }

    return $nuevaCiEscolar;
  };
  })();
