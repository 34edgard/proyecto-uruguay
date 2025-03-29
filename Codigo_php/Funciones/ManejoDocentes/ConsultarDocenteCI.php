<?php
(function (){
  global $consultarDocenteCI;
  
  $consultarDocenteCI = function () {
    $DOCENTE = new Docente();
    extract($_GET);
    $res = $DOCENTE->consultar_datos([
      "campos" => ["cedula","id_docente", "nombres", "apellidos", "fecha_nacimiento"],
      "like"=>"$ci%"
      
    ]);
   
   $i=0;
    foreach ($res as $user) {
      $i++;
    $numero_telefono= (new Telefono())->consultarDato([    "campos" => ["id_docente","numero_telefono"],
    "valor"=>$user["id_docente"]
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
     hx-get='/Codigo_php/Modulos/Gestionar_Docente.php'
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
     hx-get='/Codigo_php/Modulos/Gestionar_Docente.php'
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