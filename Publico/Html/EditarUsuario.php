        <form method="post">
          <fieldset class="thumbnail container mt-5">
            <label class="form-label">
              cedula
              <input type="number" name="ci" class="form-control w-75" 
              value="<?= $cedula ?>"
              disabled>
            </label>
            <label class="form-label">
              nombre
              <input type="text" name="nombre" class="form-control w-75"
              value="<?= $nombres ?>"
              >
              </label>
              <label class="form-label">
              apellido
              <input type="text" name="apellido" class= "form-control w-75"
              value="<?= $apellidos ?>"
              >
            </label>

            <label class="form-label">
              contraseña
              <input type="password" name="contraseña"
              placeholder="este campo no es obligatorio"
              class="form-control w-75 ">
            </label>
       <?php  if($_SESSION['rol'] < 2): ?>
              <label>id_rol

                <select name="rol" class="form-control w-75 "
                hx-get="/Codigo_php/Modulos/Gestion_Usuario.php"
                hx-trigger="load"
                >
                  


                </select>
              <?php else: ?>
              <input type="number" name="rol" hidden value="2">
              <?php endif ?>
              </label>
            <button type="button" data-bs-dismiss="modal" class="btn btn-primary" name="EditarUsuario" value="1" onclick="editarUsuario(1)">cambiar</button>

          </fieldset>
        </form>