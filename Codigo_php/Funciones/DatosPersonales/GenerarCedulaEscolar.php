<?php
(function (){
  global $generarCedulaEscolar;
  $generarCedulaEscolar = function ($cedula,$fecha){
    $fh = "".(Fecha($fecha)[0]-2000);
 //   $fh .= Fecha($fecha)[0];
    $ci_escolar = $fh.$cedula;

  $estudiantes = (new Estudiante)->consultar([
    "campos"=>['ci_escolar'],
    "where"=>[
["campo"=>'ci_escolar', "operador"=>'LIKE', "valor"=>'_'.$ci_escolar] ],
     "orderBy"=>["campo"=>'ci_escolar',"direccion"=>'DESC'],
     "limit"=>1
    
 ]);
//$estudiantes = $estudiantes[0]['ci_escolar'];
  if(isset($estudiantes[0]['ci_escolar'])){
    
    $nuevaCiEscolar = (intval($estudiantes[0]['ci_escolar'][0]) + 1).$ci_escolar;
  }else{
    $nuevaCiEscolar = "1".$ci_escolar;
  }

    return $nuevaCiEscolar;
  };
  })();
