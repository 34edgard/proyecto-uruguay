<h2 class="text-center text-danger m-2">
desea eliminar a: <?= $nombres.' '.$apellidos ?>

</h2>
<p class="text-center text-danger m-2">cedula escolar: <?= $ci_escolar ?> </p>

<button
class="btn btn-danger"
name="ci_escolar"
value="<?= $ci_escolar ?>"
hx-get="/estudiante/eliminar"
data-bs-dismiss="modal"
hx-target="#matriculaResults"
>
SI
</button>