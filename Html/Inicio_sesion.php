<form action="Inicio_secion.php" method="post">

  <fieldset class="thumbnail container d-flex flex-column justify-content-center flex-wrap align-items-center p-3">
    <h1 class="text-center text-primary">iniciar sesion</h1>
    <label class="label-control  w-50   p-3">Usuario
      <input type="number" id="cedula" name="cedula" class="form-control " required placeholder="ingrese su usuario"></label>
    <label class="label-control  w-50   p-3">contraseña
      <input type="password" id="contraseña" name="contraseña" class="form-control  " required placeholder="Ingrese la Contraseña" value="12345678"></label>
    <button type="button" class="btn btn-primary w-50 m-auto" name="Inicio_secion" value="1bjj" id="enviar">enviar</button>

    <div id="caja"></div>
  </fieldset>

</form>

<script src="/Codigo_js/Funciones/validar_formulario.js"></script>
<script src="/Codigo_js/Funciones/Iniciar_Sesion.js"></script>