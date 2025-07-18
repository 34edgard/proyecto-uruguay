<div class="container mt-5">
  <!-- Section for Adding New Levels -->
  <div class="card shadow-lg p-4 mb-5  rounded">
    <div class="card-body">
      <h2 class="card-title text-center text-primary mb-4">
        <i class="fas fa-layer-group me-2"></i> Gestión de Niveles
      </h2>
      <p class="text-center text-muted mb-4">
        Agregue nuevos niveles educativos al sistema.
      </p>

      <form
        id="addNivelForm"
        class="needs-validation"
        novalidate
        hx-post="/plantel/nivel/crear"
        hx-target="#nivelesListContainer"
        hx-trigger="submit"
        hx-indicator="#nivelLoadingIndicator"
        hx-swap="outerHTML"
        hx-on="htmx:afterRequest: if (event.detail.successful) { this.reset(); htmx.trigger('#nivelesListContainer', 'load'); }"
      >
        <div class="mb-3">
          <label for="nombre_nivel" class="form-label">Nombre del Nivel</label>
          <input
            type="text"
            id="nombre_nivel"
            name="nombre_nivel"
            class="form-control"
            placeholder="Ej. Nivel "
            required
          >
          <div class="invalid-feedback">Por favor, ingrese el nombre del nivel.</div>
        </div>
        <div class="d-grid mt-4">
          <button type="submit" class="btn btn-primary btn-lg">
            <i class="fas fa-plus-circle me-2"></i> Agregar Nivel
          </button>
        </div>
      </form>
    </div>
  </div>

  <!-- Section for Listing Levels -->
  <h3 class="text-center mt-5 mb-3 text-secondary">
    <i class="fas fa-list-alt me-2"></i> Listado de Niveles Existentes
  </h3>

  <!-- HTMX Loading Indicator for the list -->
  <div id="nivelLoadingIndicator" class="text-center htmx-indicator mb-3">
    <div class="spinner-border text-primary" role="status">
      <span class="visually-hidden">Cargando niveles...</span>
    </div>
    <p class="mt-2 text-muted">Cargando listado de niveles...</p>
  </div>

  <div
    id="nivelesListContainer"
    class="table-responsive p-4 border rounded shadow-sm "
    hx-get="/plantel/nivele?id_nivel"
    hx-trigger="load"
    hx-target="#nivelesListContainer"
    hx-swap="innerHTML"
  >
    <p class="text-center text-muted">
      El listado de niveles aparecerá aquí.
    </p>
    <!-- Content will be loaded by HTMX here -->
  </div>
</div>

<script>
  // JavaScript for Bootstrap form validation
  (function () {
    'use strict';
    var form = document.getElementById('addNivelForm');
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