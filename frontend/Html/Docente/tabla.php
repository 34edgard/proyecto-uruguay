<?php
use Funciones\Edad;
?>

<tr>
<td><?= $i ?></td>
<td><?= $cedula ?></td>
<td><?= $nombres ?></td>
<td><?= $apellidos ?></td>
<td><?= $fecha_nacimiento ?></td>
<td><?= Edad::Edad($fecha_nacimiento) ?></td>
<td><?= $numero_telefono ?></td>
<td><?= $aula_asignada ?></td>
<td>
     <button type='button'
     class='btn btn-warning'
     data-bs-toggle='modal'
     data-bs-target='#firefoxModal'
     hx-get='/docente/formulario'
     hx-trigger='click'
     hx-target="#modal-form"
     name='formularioEdicion'
     value="<?= $cedula ?>"
     >
    <h6>📝</h6>
     
     </button>
     </td>

     <td>
     <button type='button'
     class='btn btn-danger'
     data-bs-toggle='modal'
     data-bs-target='#firefoxModal'
     hx-get='/docente/confirmar/eliminacion'
     hx-trigger='click'
     hx-target="#modal-form"
     name='ConfirmarEliminacion'
     value="<?= $cedula ?>"
     >
     <h6>🗑</h6>
     </button>
     </td>
 </tr>