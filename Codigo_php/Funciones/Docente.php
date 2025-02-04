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
      "campos" => ["ci", "nombre", "apellido", "f_nacimiento", "id_telefono"],
      "valores" => [
        $cedula,
        $nombre,
        $apellido,
        $fecha_nacimiento,
        $id_telefono,
      ],
    ]);
  };

  $consultarDocente = function () {
    $DOCENTE = new Docente();
    $res = $DOCENTE->consultar_datos([
      "campos" => ["ci", "nombre", "apellido", "f_nacimiento", "id_telefono"],
      "longitud" => 10,
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

      echo "<td>".$user['ci']."</td>";
      echo "<td>".$user['nombre']."</td>";
      echo "<td>".$user['apellido']."</td>";
      echo "<td>".$user['f_nacimiento']."</td>";
      echo "<td>".Edad($user['f_nacimiento']) . "</td>";
      echo "<td>".$tl[$user['id_telefono']-1]['numero_telefono']."</td>";

      echo "</tr>";
      $i++;
    }

    //print_r( $res);
  };
})();
