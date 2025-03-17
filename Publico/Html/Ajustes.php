<div class="container mt-5">
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link active" data-bs-toggle="tab" data-bs-target="#tablaUsuarios" role="tab">usuarios</button>
    </li>
    <?php if ($_SESSION['rol'] < 2):
      ?>
      <li class="nav-item" role="presentation">
        <button type="button" class="nav-link " data-bs-toggle="tab" data-bs-target="#general" role="tab" aria-selected="true">reguistro de usuarios</button>
      </li>
      <?php endif ?>

  </ul>

  <div class="tab-content" role="tablist">
    <?php if ($_SESSION['rol'] < 2):
      ?>
      <div class="tab-pane  table-responsive" id="general" role="tabpanel">
        <form 
        hx-post="/Codigo_php/Modulos/Gestion_Usuario.php"
        hx-trigger="submit"
        hx-target="#usuarios"
        >
          <fieldset class="thumbnail container mt-5">
            <label class="form-label">
              cedula
              <input type="number" name="cedula" class="form-control ">
            </label>
            <label class="form-label">
              nombre
              <input type="text" name="nombre" class="form-control ">
            </label>
            <label class="form-label">
              apellido
              <input type="text" name="apellido" class="form-control ">
            </label>
            
                          <label class="form-label">
              nombre de usuario 
              <input type="text" name="usuario" class= "form-control ">
            </label>
              <label class="form-label">
              correo 
              <input type="email" name="correo" class= "form-control ">
            </label>
            
   <?php if ($_SESSION["rol"] < 2) :    ?>
              <label class="form-label">

                rol
                <select name="rol" class="form-control"
                hx-target="#crear_user_rol"
                id="crear_user_rol"
                hx-get="/Codigo_php/Modulos/Gestion_Usuario.php"
                hx-trigger="load"
                >


                </select>
             <?php else:  ?>
                <input type="number" name="rol" value="2" hidden>

                <?php endif ?>
            </label>
            <label class="form-label">
              contraseña
              <input type="password" name="contraseña" class="form-control " >
            </label>
            <button type="submit" class="btn btn-primary" name="Crear_usuario" value="crear" id="formulario-crearUsuario">Registrar</button>
            <button type="reset" class="btn btn-danger">borrar</button>
          </fieldset>
        </form>

      </div>
      <?php endif ?>
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

      <div class="modal-body " id="modal-form">



      </div>

    </div>
  </div>
</div>




<div class="container" id="mesajesDelServidor"></div>
<!--<script src="/Codigo_js/Funciones/ConsultarUsuario.js"></script>-->
<!--<script src="/Codigo_js/Funciones/CrearUsuario.js"></script>
<script src="/Codigo_js/Funciones/EditarUsuario.js"></script>
<script src="/Codigo_js/Funciones/eliminarUsuario.js"></script>

<script src="/Codigo_js/Funciones/estadoUsuario.js"></script>-->