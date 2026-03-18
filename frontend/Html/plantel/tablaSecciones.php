<table class="table">

<?php
foreach ($niveles as $key => $nivel):
  $num_docentes =  0;
  $num_niños =0;

?>
   <tr><th colspan="2"><?= $nivel['nombre_seccion'] ?></th>
   <th> 

<button type='button'
class='btn btn-danger'
data-bs-toggle='modal'
data-bs-target='#firefoxModal'
hx-get='/plantel/seccion/confirm_eliminar'
hx-trigger='click'
hx-target="#modal-form"
name='ConfirmarEliminacion'
value="<?= $nivel['id_seccion'] ?>"
>
<h6>🗑</h6>
</button>

</th>
  </tr>
  <tr><td>n° docentes</td> <td><?= $num_docentes ?></td></tr>
   <tr><td>n° niños</td> <td><?= $num_niños ?></td></tr>
 
 <?php endforeach; ?>
</table>