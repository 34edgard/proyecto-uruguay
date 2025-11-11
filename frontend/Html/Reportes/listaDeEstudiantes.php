<?php
use Funciones\Edad;


?>

<tr>



  <td><?= $ci_escolar ?></td>
  <td><?= $nombres.' '.$apellidos ?></td>
  <td><?= $sexo ?></td>
  <td><?= $fecha_nacimiento ?></td>
  <td><?= Edad::Edad($fecha_nacimiento) ?></td>
  <td><?= $lugar_nacimiento ?></td>
  <td>
<select class='form-control'>
<option disamble>......</option>
<?php foreach($reprecentantes as $reprecentante): ?>
<option value="<?= $reprecentante['cedula'] ?>"><?= $reprecentante['tipo'].' : '.$reprecentante['nombre']  ?></option>
<?php endforeach; ?>
</select>
  </td>



 <td><button class='btn btn-warning'
  data-bs-toggle='modal' data-bs-target='#firefoxModal'
   name="formularioEdicion"
   value="<?= $ci_escolar ?>"
   hx-get="/estudiante/form/edicion"
   hx-trigger="click"
   hx-target="#modal-form"
   >editar</button></td>
 
 <?php 

//print_r($_SESSION);

 if ($_SESSION["id_rol"] == 1): ?>
 <td><button class='btn btn-danger' 
     data-bs-toggle='modal' data-bs-target='#firefoxModal'
     name="ci_escolar"
   value="<?= $ci_escolar ?>"
   hx-get="/estudiante/eliminar_confir"
   hx-trigger="click"
   hx-target="#modal-form"
     >eliminar</button></td>
   
 <?php endif; ?>


</tr>