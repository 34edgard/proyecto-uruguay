<div class="container mt-5">
  <!-- Section for Adding New Sections -->
  <div class="card shadow-lg p-4 mb-5  rounded">
    <div class="card-body">
      <h2 class="card-title text-center text-primary mb-4">
        <i class="fas fa-cubes me-2"></i> Gestión de Secciones
      </h2>
      <p class="text-center text-muted mb-4">
        Cree y asigne nuevas secciones a los niveles educativos.
      </p>

      <form
        id="addSeccionForm"
        class="needs-validation"
        novalidate
        hx-post="/plantel/seccion/crear"
        hx-target="#seccionesListContainer"
        hx-trigger="submit"
        hx-indicator="#seccionLoadingIndicator"
        hx-swap="outerHTML"
        hx-on="htmx:afterRequest: if (event.detail.successful) { this.reset(); htmx.trigger('#seccionesListContainer', 'load'); }"
      >
        <div class="mb-3">
          <label for="nombre_seccion" class="form-label">Nombre de la Sección</label>
          <input
            type="text"
            id="nombre_seccion"
            name="nombre_seccion"
            class="form-control"
            placeholder="Ej. Sección A, Sección B, Única"
            required
          >
          <div class="invalid-feedback">Por favor, ingrese el nombre de la sección.</div>
        </div>

        <div class="mb-4">
          <label for="id_nivel" class="form-label">Nivel de la Sección</label>
          <select
            name="id_nivel"
            class="form-select"
            id="id_nivel"
            hx-get="/plantel/niveles?id_niveles"
            hx-trigger="load"
            hx-target="this"
            hx-swap="innerHTML"
            required
          >
            <option value="" disabled selected>Cargando niveles...</option>
            <!-- Options will be loaded by HTMX -->
          </select>
          <div class="invalid-feedback">Por favor, seleccione un nivel.</div>
        </div>

        <div class="d-grid mt-4">
          <button type="submit" class="btn btn-primary btn-lg">
            <i class="fas fa-plus-circle me-2"></i> Agregar Sección
          </button>
        </div>
      </form>
    </div>
  </div>

  <!-- Section for Listing Sections -->
  <h3 class="text-center mt-5 mb-3 text-secondary">
    <i class="fas fa-th-list me-2"></i> Listado de Secciones Existentes
  </h3>

  <!-- HTMX Loading Indicator for the list -->
  <div id="seccionLoadingIndicator" class="text-center htmx-indicator mb-3">
    <div class="spinner-border text-primary" role="status">
      <span class="visually-hidden">Cargando secciones...</span>
    </div>
    <p class="mt-2 text-muted">Cargando listado de secciones...</p>
  </div>

  <div
    id="seccionesListContainer"
    class="table-responsive p-4 border rounded shadow-sm "
    hx-get="/plantel/secciones?id_secciones"
    hx-trigger="load, refreshSecciones from:body"
    hx-target="this"
    hx-swap="innerHTML"
  >
    <p class="text-center text-muted">
      El listado de secciones aparecerá aquí.
    </p>
    <!-- Content will be loaded by HTMX here -->
  </div>
</div>

<script>
  // JavaScript for Bootstrap form validation
  (function () {
    'use strict';
    var form = document.getElementById('addSeccionForm');
    if (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    }
  })();
</script>