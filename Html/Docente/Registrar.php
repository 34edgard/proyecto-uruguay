    <form method="post" action="Pag_5.php">
      <input type="text" placeholder="Nombre" name="nombre" class="form-control w-75" >
      <input type="text" placeholder="Apellidos" name="apellido" class="form-control w-75" >
      <input type="number" placeholder="cedula" name="cedula" class="form-control w-75" >
      <input type="date" placeholder="fecha de nacimiento" name="fecha_nacimiento" class="form-control w-75" >
      
      
      <input type="tel" placeholder="telefono" name="telefono" class="form-control w-75" >
      <select name="aula" class="form-control w-75">
        <option value="1">aula 1</option>
        <option value="2">aula 2</option>
        <option value="3">aula 3</option>
      </select>
    <button type="button" class="btn btn-primary" id="crearDocente" name="formulario" value="crear">registrar</button>

    </form>
    <div id="mensaje"></div>
    <script src="../Codigo_js/Funciones_js/CrearDocente.js"></script>