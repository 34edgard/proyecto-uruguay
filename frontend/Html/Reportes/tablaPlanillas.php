 <tr>
 


   <td><?= $ci_escolar ?></td>
   <td><?= $nombres.' '.$apellidos ?></td>
   <td><?= $sexo ?></td>
   <td><?= $fecha_nacimiento ?></td>
   <td><?= Edad($fecha_nacimiento) ?></td>
   <td><a class="btn btn-success" href="/planilla/imprimir?ci_escolar=<?= $ci_escolar ?>">imprimir</a></td>
  
 </tr>