<?php
(function (){
  global $registrarDocente;

  $registrarDocente = function () {
   $extras = func_get_args();
    extract($_POST);
    $DOCENTE = new Docente();
  /*  $id_telefono = $extras[1][0]($telefono);*/
    
    $DOCENTE->registrar_datos([
      "campos" => ["cedula", "nombres", "apellidos", "fecha_nacimiento"],
      "valores" => [
        $cedula,
        $nombre,
        $apellido,
        $fecha_nacimiento
      ]
    ]);
    $id_docente = (new Docente)->consultar_datos(['campos'=>['cedula','id_docente'],
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',"valor"=>$cedula     ]
      ]
    ])[0]['id_docente'];
    
  $extras[1][0]($telefono,$formulario,$tipo_telefono,$id_docente);
  plantilla('MensajeExito',["mensajeExito"=>'el docente se a creado correctamente']);
  };
})();
