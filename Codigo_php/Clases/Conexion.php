<?php

interface Conexiones_Base_Datos{
  public function crear_conexio();
  public function validar_conexio();
  public function cerrar_conexio();
}

class Conexiones_BD{
  public $puerto = "0.0.0.0:3306";
  public $usuario = "root";
  public $contrasena = "root";
  public $baseDeDatos = "Proyecto_v7";
  /*
  public $puerto = "sql210.infinityfree.com";
  public $usuario = "if0_37533972";
  public $contrasena = "PoRkldd3vL";
  public $baseDeDatos = "if0_37533972_Proyecto_v6";
  */
  
  public function crear_conexio(){
  return $this->validar_conexio (mysqli_connect($this->puerto, $this->usuario, $this->contrasena));
  }
  public function validar_conexio($conexion){
    if (!$conexion) {
      echo "Error conectando a la base de datos.<br>";
      $this->cerrar_conexio($conexion);
      
    }
    if(!mysqli_select_db($conexion, $this->baseDeDatos)) {
      echo "Error seleccionando la base de datos.<br>";
      $this->cerrar_conexio($conexion);
    } else {
      return $conexion;
    }
    
    
    
  }
  public function cerrar_conexio($conexion){
    mysql_close($conexion);
  }
}



class Consultas_BD extends Conexiones_BD
{
  public  function ejecutar_consulta($sql)
  {
    $enlace = $this->crear_conexio();
  /*  if(sizeof($enlace) == 0){
      echo 'error con la conexiones_BD';
      return;
    }*/
    $consulta = mysqli_query($enlace, $sql);

    if (!$consulta) {
      echo "fallo el reguistrado " . $enlace->error;
    }
  }

  public function consultar_registro($clave, $logitud = 1)
  {
    $enlace = $this->crear_conexio();
    
$arreglo = [];

    $result = mysqli_query($enlace, $clave);
    $a = 0;
if ($result) {
    while ($row = mysqli_fetch_array($result)) {
      for ($i = 0; $i <= $logitud; $i++) {
        $arreglo[$a][$i] = $row[$i];
      }
      $a++;
    }
    
      mysqli_free_result($result);
    }
    mysqli_close($enlace);

    return $arreglo;
  }
}