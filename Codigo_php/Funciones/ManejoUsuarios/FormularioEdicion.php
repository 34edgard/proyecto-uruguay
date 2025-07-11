<?php
(function (){
  global $editar_usuario_form;
  $editar_usuario_form =function (){
if(!isset($_GET['formularioEdicion'])) return;
   extract($_GET);
   session_start();
   //formularioEdicion
   $campos =["campos"=>['cedula','nombres','apellidos','id_rol','usuario','id_correo'],
     "where"=>[
       ["campo"=>'cedula',"operador"=>'=',
   "valor"=>$formularioEdicion]
     ]
   ];
   $datos = (new Personal_Administrativo)->consultar($campos)[0];
   $datos['correo'] = (new correo)->consultar([
    "campos"=>['email'],
    "where"=>[
        ['campo'=>'id_correo','operador'=>'=','valor'=>$datos['id_correo']]
    ]
])[0]['email'];
  // print_r($datos);
   plantilla("EditarUsuario",$datos);
  };

  
})();
