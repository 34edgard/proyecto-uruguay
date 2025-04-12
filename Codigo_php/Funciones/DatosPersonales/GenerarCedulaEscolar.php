<?php
(function (){
  global $generarCedulaEscolar;
  $generarCedulaEscolar = function (){
    $datos = (new Reprecentante)->consultar_datos([
        "campos"=>["cedula","nombres"],
        "valor"=>$_GET["cedula"]
    ]);
    

  $estudiantes = (new Estudiante)->consultar_datos([
       "campos"=>['ci_escolar','fecha_nacimiento'],
       "like"=> " '___".$_GET['cedula']."' ORDER BY `ci_escolar` DESC LIMIT 1"  
 ]);



   if (isset($datos[0]["cedula"]) && !isset($estudiantes[0]['ci_escolar'])) {
     echo "el reprecentante ".$datos[0]["nombres"]." existe ";
     $fh =  $estudiantes[0]['fecha_nacimiento'][8];
     $fh .=  $estudiantes[0]['fecha_nacimiento'][9];
           $cedulaEscolar = "1".$fh.$estudiantes[0]['ci_escolar'];
    echo "la cedula escolar seria ".$cedulaEscolar;
   }else if(isset($datos[0]["cedula"]) && isset($estudiantes[0]['ci_escolar'])){

     $nuevaCedulaEscolar = $estudiantes[0]['ci_escolar'][0] + 1;

    echo  $nuevaCedulaEscolar;


   }else{
    echo "el usuario no existe";
   }
  };
  })();
