<?php

function Fecha ($fecha){
  $año = 0 ;
 $mes =0;
$dia = 0;
  $u = 1000;

  for($i = 0 ; $i < 4 ; $i++){
    
    $año += $fecha[$i] * $u ;
    $u = $u / 10;
  }
$u = 10;
 for($i = 5 ; $i < 7 ; $i++){
    
    $mes += $fecha[$i] * $u ;
    $u = $u / 10;
  }
$u = 10;
 for($i = 8 ; $i < 10 ; $i++){
    $dia += $fecha[$i] * $u ;
    $u = $u / 10;
  }
$Nfecha[0] = $año;
$Nfecha[1] =$mes;
$Nfecha[2] = $dia;
return $Nfecha;
}

function Edad($fecha,$fecha_actual = false){

$Nfecha = Fecha($fecha);
$año = $Nfecha[0];
$mes = $Nfecha[1];
$dia = $Nfecha[2];

if(!$fecha_actual){

$añoa = date("Y");
$mesa =date("m");
$diasa =date("d");
}else{

  $fecha_a = Fecha($fecha_actual);
  $añoa = $fecha_a[0];
  $mesa = $fecha_a[1];
  $diasa = $fecha_a[2];
}

$edad = $añoa - $año;
$edad =$edad -1;

If($mesa >= $mes  && $diasa
>= $dia ){
$edad ++;

}
return $edad;
}

function Fecha_invertida($fecha){
  
$Fecha =  Fecha($fecha);
$Fecha_invertida = "$Fecha[2]-$Fecha[1]-$Fecha[0]";
return $Fecha_invertida;
}
?>
