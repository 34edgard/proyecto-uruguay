<?php
(function (){
  global $validar_datosDB;
  $validar_datosDB = function ($correo, $contraseña) {
    $PA = new Personal_Administrativo();
    $correoElectronico = new correo();
 
 $id_correo = $correoElectronico->consultar(  [
        "campos" => ["email","id_correo"],
          "where"=>[
    ["campo"=>'email',"operador"=>'=',"valor"=>$correo]
    ]
    ]);
    //print_r($id_correo);
    
    if (!isset($id_correo[0]['id_correo'])) {
        plantilla('sesiones/alert',[
            'mensaje'=>'el usuario no existe'
        ]);
        return [false];
    }
    $id_correo = $id_correo[0]['id_correo'];
    $arreglo = $PA->consultar([
      "campos" => ["cedula", "contrasena", "id_rol", "nombres","id_correo"],
      "where"=>[
        ["campo"=>'id_correo',"operador"=>'=',"valor"=>$id_correo]
      ]
    ]);

    if (
     !password_verify($contraseña, $arreglo[0]['contrasena']) 
    ) {
      plantilla('sesiones/alert',[
          'mensaje'=>'el usuario o la contraseña son incorrectos'
      ]);
     return [false];
    }
    
    
    
    cambiarPagina("inicio");
    
    return [true, $arreglo];
  };
  
  })();
