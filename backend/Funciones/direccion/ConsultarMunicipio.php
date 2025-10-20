<?php




(function (){
    

  global $consultarMunicipio;
  

//print_r($_GET);
//id_estado
  $consultarMunicipio = function (){
    $Extras = func_get_args();
    extract($Extras[0]);
    $id = $estado1 ?? $estado2 ?? $id_estado;
    
    $datos = (new municipio)->consultar(["campos"=>['id_estado','id_municipio','nombre_municipio'],
      "where"=>[
   ["campo"=>'id_estado', "operador"=>'=', "valor"=>$id ]
      ]
    ]);
  // print_r($datos);

    foreach ($datos as $dato){
        
        echo "<script>
        document.getElementById('chatbox').innerHTML += ".$dato['id_municipio']."__".$dato['nombre_municipio']."
        </script>";
        
      plantilla("componentes/option",[
          "value"=>$dato['id_municipio'],
          "contenido"=>$dato['nombre_municipio']
      ]);
      
    }
  };
  })();
