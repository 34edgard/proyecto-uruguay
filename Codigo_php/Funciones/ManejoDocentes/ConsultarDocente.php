<?php
(function (){
  global $consultarDocente;
  
  $consultarDocente = function () {
    $DOCENTE = new Docente();
    $res = $DOCENTE->consultar_datos([
      "campos" => ["id_docente","cedula", "nombres", "apellidos", "fecha_nacimiento"]
    ]);
   
   $i=0;
    foreach ($res as $user) {
      $i++;
      $numero_telefono = consultarNumeroTelefonoDocente($user['id_docente']);
$aula_asignada = "ningina";





      echo "<tr>";
      echo "<td>".$i."</td>";
      echo "<td>".$user['cedula']."</td>";
      echo "<td>".$user['nombres']."</td>";
      echo "<td>".$user['apellidos']."</td>";
      echo "<td>".$user['fecha_nacimiento']."</td>";
      echo "<td>".Edad($user['fecha_nacimiento']) . "</td>";
      echo "<td>".$numero_telefono."</td>";
      echo "<td>".$aula_asignada."</td>";
     echo "<td>
     <button type='button'
     class='btn btn-warning'
     data-bs-toggle='modal'
     data-bs-target='#firefoxModal'
     hx-get='/Gestion_Docente'
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
     hx-get='/Gestion_Docente'
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
