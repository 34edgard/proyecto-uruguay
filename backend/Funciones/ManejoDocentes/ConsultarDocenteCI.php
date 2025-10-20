<?php
(function (){
  global $consultarDocenteCI;
  
  $consultarDocenteCI = function () {
    $DOCENTE = new Docente();
    $Extras = func_get_args();
    extract($Extras[0]);
    $res = $DOCENTE->consultar([
      "campos" => ["cedula","id_docente", "nombres", "apellidos", "fecha_nacimiento"],
      "where"=>[
        ["campo"=>'cedula',"operador"=>'LIKE',"valor"=>$ci.'%']
      ]
      
    ]);
   
   $i=0;
    foreach ($res as $user) {
      $i++;
      $numero_telefono= (new Telefono())->consultar([    "campos" => ["id_docente","numero_telefono"],
        "where"=>[
          ["campo"=>'id_docente',"operador"=>'=',"valor"=>$user['id_docente']]
        ]
    
    ])[0]["numero_telefono"]; 
    
    
    
    
    $aula_asignada = "ningina";
    $user['i'] = $i;
    $user['numero_telefono'] = $numero_telefono;
    $user['aula_asignada'] = $aula_asignada;
    plantilla("Docente/tabla",$user);
    
    
    }
  };
})();
