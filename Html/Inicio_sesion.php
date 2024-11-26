<form action="Inicio_secion.php" method="post" class=" container ">
	<center>
		<fieldset class="thumbnail m-5 " style="width:200px; ">

			<label class="label-control m-2 " style="width:180px">cedula
				<input type="number" id="cedula" name="cedula" class="form-control " required ></label><br>
			<label class="label-control m-2 " style="width:180px">contraseña
				<input type="password" id="contraseña" name="contraseña" class="form-control  " required="ingrese la contraseña" value="12345678"></label><br>
			<button type="button" class="btn btn-primary w-75" name="Inicio_secion" value="1bjj" id="enviar">enviar</button><br>
			
		</fieldset>
		<div id="caja"></div>
	</center>
</form>
<div class="h-75" id="caja"></div>
<script src="./Codigo_js/Funciones/validar_formulario.js"></script>
<script src="./Codigo_js/Funciones/Iniciar_Sesion.js"></script>

