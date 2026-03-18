<h2 class="text-center text-danger m-2">Seguro que deseas eliminar a <?= $nombre ?></h2>
<button
class="btn btn-danger"
name="eliminarSeccion"
value="<?= $ConfirmarEliminacion ?>"
hx-get="plantel/seccion/eliminar"
data-bs-dismiss="modal"
hx-target="#seccionesListContainer"
>
SI
</button>