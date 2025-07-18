<div class="container mt-5">
  <!-- Section for Adding New Classrooms (Aulas) -->
  <div class="card shadow-lg p-4 mb-5  rounded">
    <div class="card-body">
      <h2 class="card-title text-center text-primary mb-4">
        <i class="fas fa-chalkboard-teacher me-2"></i> Gestión de Aulas
      </h2>
      <p class="text-center text-muted mb-4">
        Cree y asigne nuevas aulas a las secciones existentes.
      </p>

      <form
        id="addAulaForm"
        class="needs-validation"
        novalidate
        hx-post="/plantel/aula/crear"
        hx-target="#aulasListContainer"
        hx-trigger="submit"
        hx-indicator="#aulaLoadingIndicator"
        hx-swap="outerHTML"
        hx-on="htmx:afterRequest: if (event.detail.successful) { this.reset(); htmx.trigger('#aulasListContainer', 'load'); }"
      >
        <div class="mb-3">
          <label for="nombre_aula" class="form-label">Nombre del Aula</label>
          <input
            type="text"
            id="nombre_aula"
            name="nombre_aula"
            class="form-control"
            placeholder="Ej. Aula 101, Laboratorio de Ciencias"
            required
          >
          <div class="invalid-feedback">Por favor, ingrese el nombre del aula.</div>
        </div>

        <div class="mb-4">
          <label for="id_seccion_aula" class="form-label">Sección del Aula</label>
          <select
            name="id_seccion"
            class="form-select"
            id="id_seccion_aula"
            hx-get="/plantel/seccion?id_seccion"
            hx-trigger="load"
            hx-target="this"
            hx-swap="innerHTML"
            required
          >
            <option value="" disabled selected>Cargando secciones...</option>
            <!-- Options will be loaded by HTMX -->
          </select>
          <div class="invalid-feedback">Por favor, seleccione una sección.</div>
        </div>

        <div class="d-grid mt-4">
          <button type="submit" class="btn btn-primary btn-lg">
            <i class="fas fa-plus-circle me-2"></i> Agregar Aula
          </button>
        </div>
      </form>
    </div>
  </div>

  <!-- Section for Listing Classrooms (Aulas) -->
  <h3 class="text-center mt-5 mb-3 text-secondary">
    <i class="fas fa-list-ul me-2"></i> Listado de Aulas Existentes
  </h3>

  <!-- HTMX Loading Indicator for the list -->
  <div id="aulaLoadingIndicator" class="text-center htmx-indicator mb-3">
    <div class="spinner-border text-primary" role="status">
      <span class="visually-hidden">Cargando aulas...</span>
    </div>
    <p class="mt-2 text-muted">Cargando listado de aulas...</p>
  </div>

  <div
    id="aulasListContainer"
    class="table-responsive p-4 border rounded shadow-sm "
    hx-get="/plantel/aula?id_aula"
    hx-trigger="load, refreshAulas from:body"
    hx-target="this"
    hx-swap="innerHTML"
  >
    <p class="text-center text-muted">
      El listado de aulas aparecerá aquí.
    </p>
    <!-- Content will be loaded by HTMX here -->
  </div>
</div>

<script>
  // JavaScript for Bootstrap form validation
  (function () {
    'use strict';
    var form = document.getElementById('addAulaForm');
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