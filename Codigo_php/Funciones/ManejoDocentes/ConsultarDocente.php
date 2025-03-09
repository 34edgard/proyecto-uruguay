<?php
(function (){
  global $consultarDocente;
  
  $consultarDocente = function () {
    $DOCENTE = new Docente();
    $res = $DOCENTE->consultar_datos([
      "campos" => ["id_docente","cedula", "nombres", "apellidos", "fecha_nacimiento"]
    ]);
   
   
    foreach ($res as $user) {
    $numero_telefono= (new Telefono())->consultarDato([    "campos" => ["id_docente","numero_telefono"],
    "valor"=>$user["id_docente"]
    ])[0]["numero_telefono"]; 
      echo "<tr>";
      echo "<td>".$user['id_docente']."</td>";
      echo "<td>".$user['cedula']."</td>";
      echo "<td>".$user['nombres']."</td>";
      echo "<td>".$user['apellidos']."</td>";
      echo "<td>".$user['fecha_nacimiento']."</td>";
      echo "<td>".Edad($user['fecha_nacimiento']) . "</td>";
     echo "<td>".$numero_telefono."</td>";
     echo "<td>
     <button type='button'
     class='btn btn-danger'
     hx-get='/Codigo_php/Modulos/Gestionar_Docente.php'
     hx-trigger='click'
     name='eliminar'
     value='".$user['cedula']."'
     >
     eliminar
     </button>
     </td>";
      echo "</tr>";
    }
  };
})();