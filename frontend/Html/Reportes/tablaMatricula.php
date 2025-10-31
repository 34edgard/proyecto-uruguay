
<?php
use Funciones\Edad;
?>

 <tr>
 


   <td><?= $ci_escolar ?></td>
   <td><?= $nombres.' '.$apellidos ?></td>
   <td><?= $sexo ?></td>
   <td><?= $fecha_nacimiento ?></td>
   <td><?= Edad::Edad($fecha_nacimiento) ?></td>
   <th><?= $lugar_nacimiento ?></th>
   <th>Plantel</th>
   <th>Cédula Representante</th>
   <th>Nombres y Apellidos Representante</th>
   <th>Teléfono Representante</th>
   <th>Dirección Representante</th>
 </tr>