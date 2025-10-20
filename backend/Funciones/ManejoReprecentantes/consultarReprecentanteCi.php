<?php
(function (){
  global $consultarReprecentanteBuscarCi;
  $consultarReprecentanteBuscarCi  = function() {
    $extras = func_get_args();
    extract( $extras[0]);
 $r   = (new Reprecentante)->consultar([
      "campos"=>['cedula'],
    "where"=>[
        ["campo"=>'cedula',"operador"=>'LIKE',
        "valor"=>$buscar_ci.'%']
    ]
    ]);

    
      foreach ($r as $key => $dato) {
        plantilla("componentes/option",[
            "value"=>$dato['cedula'],
            "contenido"=>$dato['cedula']
        ]);
      }
    
  };
})();
