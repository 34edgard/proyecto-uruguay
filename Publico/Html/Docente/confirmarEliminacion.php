<h2 class="text-center text-danger m-2">Seguro que deseas eliminar al docente <?= $ConfirmarEliminacion ?></h2>
<button
class="btn btn-danger"
name="eliminar"
value="<?= $ConfirmarEliminacion ?>"
hx-get="/docente/eliminar"
data-bs-dismiss="modal"
hx-target="#tablaDeDocentes"
>
SI
</button>