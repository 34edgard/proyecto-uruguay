<?php

use Liki\Plantillas\Plantilla;
use App\Personas\Docente;
use App\DatosExtra\Telefono;

return new class {
  public static function run($p) {
    $DOCENTE = new Docente();
    
    extract($p);
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
    Plantilla::HTML("Docente/tabla",$user);
    
    
    }
  }
};
