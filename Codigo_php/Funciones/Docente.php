<?php

// Ejemplos de uso:

(function () {
  global $registrarDocente;
  global $consultarDocente;

  $registrarDocente = function () {
    $extras = func_get_args();
    extract($_POST);
    $DOCENTE = new Docente();
    $id_telefono = $extras[1][0]($telefono);
    if (!$id_telefono) {
      return;
    }
    $DOCENTE->registrar_datos([
      "campos" => ["cedula", "nombres", "apellidos", "fecha_nacimiento"],
      "valores" => [
        $cedula,
        $nombre,
        $apellido,
        $fecha_nacimiento
      ]
    ]);
  };

  $consultarDocente = function () {
    $DOCENTE = new Docente();
    $res = $DOCENTE->consultar_datos([
      "campos" => ["cedula", "nombres", "apellidos", "fecha_nacimiento"]
    ]);
    $i = 1;
    $tl = (new Telefono())->consultarDato([
      "campos" => ["numero_telefono"]
    ]); 
   // print_r($tl);
   // print_r($res);
    foreach ($res as $user) {
      echo "<tr>";
      echo "<td>{$i}</td>";

      echo "<td>".$user['cedula']."</td>";
      echo "<td>".$user['nombres']."</td>";
      echo "<td>".$user['apellidos']."</td>";
      echo "<td>".$user['fecha_nacimiento']."</td>";
      echo "<td>".Edad($user['fecha_nacimiento']) . "</td>";
      echo "<td>".$tl['numero_telefono']."</td>";

      echo "</tr>";
      $i++;
    }

    //print_r( $res);
  };
})();
