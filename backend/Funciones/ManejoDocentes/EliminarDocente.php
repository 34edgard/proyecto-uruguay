<?php
(function (){
  global $eliminarDocente;
  $eliminarDocente = function (){
    $EXTRAS = func_get_args();
    extract( $EXTRAS[0]);
    $id_docente = (new Docente)->consultar([
      "campos"=>['cedula','id_docente'],
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',"valor"=>$eliminar]
      ]
      ])[0]['id_docente'];
   // print_r($id_docente);
    
   (new Telefono)->eliminar([
     "campos"=>['id_docente'],
     "where"=>[
       [ "campo"=>'id_docente',"operador"=>'=',"valor"=>$id_docente]
     ]
      ]);
    
    $datos =["campos"=>['cedula'],
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',"valor"=>$eliminar]
      ]
    ];
    (new Docente)->eliminar($datos);
    $EXTRAS[1][0]();
  };
})();
