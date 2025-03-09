<div class="container mt-5">
<button hx-get='/Codigo_php/Modulos/Gestion_Usuario.php?cambiarEstadoUsuario&ci=309309'
hx-trigger='click'
hx-target='#mesajesDelServidor'
  >
  cssssd
</button>
  <ul class="nav nav-tabs" role="tablist">

    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link active" data-bs-toggle="tab" data-bs-target="#tablaUsuarios" role="tab">usuarios</button>
    </li>
    <?php if ($_SESSION['rol'] < 3) {
      ?>
      <li class="nav-item" role="presentation">
        <button type="button" class="nav-link " data-bs-toggle="tab" data-bs-target="#general" role="tab" aria-selected="true">reguistro de usuarios</button>
      </li>
      <?php
    } ?>

  </ul>

  <div class="tab-content" role="tablist">
    <?php if ($_SESSION['rol'] < 3) {
      ?>
      <div class="tab-pane  table-responsive" id="general" role="tabpanel">
        <form action="Pag_.php" method="post">
          <fieldset class="thumbnail container mt-5">
            <label class="form-label">
              cedula
              <input type="number" name="cedula" class="form-control w-75">
            </label>
            <label class="form-label">
              nombre
              <input type="text" name="nombre" class="form-control w-75">
            </label>
            <label class="form-label">
              apellido
              <input type="text" name="apellido" class="form-control w-75">
            </label>
            
                          <label class="form-label">
              nombre de usuario 
              <input type="text" name="usuario" class= "form-control w-75">
            </label>
              <label class="form-label">
              correo 
              <input type="email" name="correo" class= "form-control w-75">
            </label>
            
            <?php if ($_SESSION["rol"] < 3) {
              ?>
              <label class="form-label">

                rol
                <select name="rol" class="form-control w-75 ">
                  <option value="1">DIRECTORA</option>
                  <option value="2">SECRETARIA</option>
                  <option value="3">docente</option>



                </select>
                <?php
              } else {
                ?>
                <input type="number" name="rol" value="2" hidden>

                <?php
              } ?>
            </label>
            <label class="form-label">
              contraseña
              <input type="password" name="contraseña" class="form-control w-75" maxlength="8">
            </label>
            <button type="button" class="btn btn-primary" name="Crear_usuario" value="crear" id="formulario-crearUsuario">Crear Usuarion</button>
            <button type="reset" class="btn btn-danger">borrar</button>
          </fieldset>
        </form>

      </div>
      <?php
    } ?>
    <div class="tab-pane active table-responsive"  role="tabpanel" id="tablaUsuarios">
      <table class="table table-bordered">
        <tr>
          <td>cedula</td>
          <td>nombres</td>
          <td>apellidos</td>
          
          <td>correo</td>
          <td>estado</td>
          <td colspan="2"></td>
        </tr>
<tbody id="usuarios"
hx-get="/Codigo_php/Modulos/Gestion_Usuario.php"
hx-trigger="load" 
hx-target="#usuarios" 

  >
  
</tbody>
      </table>


    </div>

  </div>
</div>



<div class="modal fade" id="firefoxModal" tabindex="-1" aria-labelledby="firefoxModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="firefoxModalLabel">editar datos del usuario <?php echo $_SESSION['ci']; ?></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body ">

        <form method="post">
          <fieldset class="thumbnail container mt-5">
            <label class="form-label">
              cedula
              <input type="number" name="ci" class="form-control w-75"  disabled>
            </label>
            <label class="form-label">
              nombre
              <input type="text" name="nombre" class="form-control w-75">
              </label>
              <label class="form-label">
              apellido
              <input type="text" name="apellido" class= "form-control w-75">
            </label>

            <label class="form-label">
              contraseña
              <input type="password" name="contraseña" class="form-control w-75 ">
            </label>
            <?php
            if ($_SESSION['rol'] < 3) {
              ?>
              <label>id_rol

                <select name="rol" class="form-control w-75 ">
                  <option value="1">DIRECTORA</option>
                  <option value="2">SECRETARIA</option>
                  <option value="3">docente</option>



                </select>
              <?php
            } else {
              ?>
              <input type="number" name="rol" hidden value="2">
              <?php
            } ?>
              </label>
            <button type="button" data-bs-dismiss="modal" class="btn btn-primary" name="EditarUsuario" value="1" onclick="editarUsuario(1)">cambiar</button>

          </fieldset>
        </form>

      </div>

    </div>
  </div>
</div>




<div class="container" id="mesajesDelServidor">vvvvvvhh</div>
<!--<script src="/Codigo_js/Funciones/ConsultarUsuario.js"></script>-->
<script src="/Codigo_js/Funciones/CrearUsuario.js"></script>
<script src="/Codigo_js/Funciones/EditarUsuario.js"></script>
<script src="/Codigo_js/Funciones/eliminarUsuario.js"></script>
<script src="/Codigo_js/Funciones/estadoUsuario.js"></script>