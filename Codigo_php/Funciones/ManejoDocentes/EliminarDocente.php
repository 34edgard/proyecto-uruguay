<?php
(function (){
  global $eliminarDocente;
  $eliminarDocente = function (){
    $EXTRAS = func_get_args();
    
    $id_docente = (new Docente)->consultar_datos([
      "campos"=>['cedula','id_docente'],
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',"valor"=>$_GET['eliminar']]
      ]
      ])[0]['id_docente'];
   // print_r($id_docente);
    
   (new Telefono)->eliminarDato([
     "campos"=>['id_docente'],
     "where"=>[
        "campo"=>'id_docente',"operador"=>'=',"valor"=>$id_docente]
     ]
      ]);
    
    $datos =["campos"=>['cedula'],
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',"valor"=>$_GET['eliminar']]
      ]
    ];
    (new Docente)->eliminar_datos($datos);
    $EXTRAS[1][0]();
  };
})();
