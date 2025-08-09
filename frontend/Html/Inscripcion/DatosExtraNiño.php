

<div class="container-fluid">
  <div class="row">
    <div class="col-12">
      <form hx-post="/estudiante/extra" hx-trigger="submit" hx-target="#InicioInscripcion">
        <h2 class="text-center mb-4">Prendas</h2>

        <div class="row g-3 mb-4">
          <div class="col-md-4">
            <label for="talla_camisa" class="form-label">Talla de camisa:</label>
            <input
              type="text"
              name="talla_camisa"
              class="form-control"
              id="talla_camisa"
              required
            >
          </div>
          <div class="col-md-4">
            <label for="pantalon" class="form-label">Talla de pantalón:</label>
            <input
              type="text"
              name="talla_pantalon"
              class="form-control"
              id="pantalon"
              required
            >
          </div>
          <div class="col-md-4">
            <label for="zapato" class="form-label">Talla de zapato:</label>
            <input
              type="text"
              name="talla_zapato"
              id="zapato"
              class="form-control"
              required
            >
          </div>
          <div class="col-md-6">
            <label for="peso" class="form-label">Peso:</label>
            <input
              type="text"
              name="peso"
              class="form-control"
              id="peso"
              required
            >
          </div>
          <div class="col-md-6">
            <label for="cb" class="form-label">Circunferencia braquial:</label>
            <input
              type="text"
              name="circunferencia_braquial"
              class="form-control"
              id="cb"
              required
            >
          </div>
        </div>

        <h3 class="text-primary text-center mb-3">Documentos Presentados</h3>

        <div class="mb-3">
          <h5>1. Partida de nacimiento</h5>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="partida_nacimiento"
              id="partidaEntregado"
              value="entregado"
            >
            <label class="form-check-label" for="partidaEntregado">Entregado</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="partida_nacimiento"
              id="partidaPendiente"
              value="pendiente"
            >
            <label class="form-check-label" for="partidaPendiente">Pendiente</label>
          </div>
        </div>

        <div class="mb-3">
          <h5>2. Copia de la cédula de la madre</h5>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="copia_cedula_madre"
              id="cedulaMadreEntregado"
              value="entregado"
            >
            <label class="form-check-label" for="cedulaMadreEntregado">Entregado</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="copia_cedula_madre"
              id="cedulaMadrePendiente"
              value="pendiente"
            >
            <label class="form-check-label" for="cedulaMadrePendiente">Pendiente</label>
          </div>
        </div>

        <div class="mb-3">
          <h5>3. Copia de la cédula del padre</h5>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="copia_cedula_padre"
              id="cedulaPadreEntregado"
              value="entregado"
            >
            <label class="form-check-label" for="cedulaPadreEntregado">Entregado</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="copia_cedula_padre"
              id="cedulaPadrePendiente"
              value="pendiente"
            >
            <label class="form-check-label" for="cedulaPadrePendiente">Pendiente</label>
          </div>
        </div>

        <div class="mb-3">
          <h5>4. 4 fotos tipo carnet</h5>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="fotos_tipo_carnet"
              id="fotosEntregado"
              value="entregado"
            >
            <label class="form-check-label" for="fotosEntregado">Entregado</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="fotos_tipo_carnet"
              id="fotosPendiente"
              value="pendiente"
            >
            <label class="form-check-label" for="fotosPendiente">Pendiente</label>
          </div>
        </div>

        <div class="mb-4">
          <h5>5. Copia del certificado de vacuna</h5>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="copia_certificado_vacuna"
              id="vacunaEntregado"
              value="entregado"
            >
            <label class="form-check-label" for="vacunaEntregado">Entregado</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="copia_certificado_vacuna"
              id="vacunaPendiente"
              value="pendiente"
            >
            <label class="form-check-label" for="vacunaPendiente">Pendiente</label>
          </div>
        </div>

        <button type="submit" class="btn btn-primary" name="cedula_escolar" value="<?= $cedula_escolar ?>">
          Guardar
        </button>
      </form>
    </div>
  </div>
</div>