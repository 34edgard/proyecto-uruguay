<?php
(function (){
  global $consultarDocenteCI;
  
  $consultarDocenteCI = function () {
    $DOCENTE = new Docente();
    extract($_GET);
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
      echo "<tr>";
      echo "<td>".$i."</td>";
      echo "<td>".$user['cedula']."</td>";
      echo "<td>".$user['nombres']."</td>";
      echo "<td>".$user['apellidos']."</td>";
      echo "<td>".$user['fecha_nacimiento']."</td>";
      echo "<td>".Edad($user['fecha_nacimiento']) . "</td>";
     echo "<td>".$numero_telefono."</td>";
     echo "<td>
     <button type='button'
     class='btn btn-warning'
     data-bs-toggle='modal'
     data-bs-target='#firefoxModal'
     hx-get='/Gestionar_Docente/formulario'
     hx-trigger='click'
     hx-target=\"#modal-form\"
     name='formularioEdicion'
     value='".$user['cedula']."'
     >
     editar
     </button>
     </td>";
      
     echo "<td>
     <button type='button'
     class='btn btn-danger'
     data-bs-toggle='modal'
     data-bs-target='#firefoxModal'
     hx-get='/Gestionar_Docente'
     hx-trigger='click'
     hx-target=\"#modal-form\"
     name='ConfirmarEliminacion'
     value='".$user['cedula']."'
     >
     eliminar
     </button>
     </td>";
      echo "</tr>";
    }
  };
})();
