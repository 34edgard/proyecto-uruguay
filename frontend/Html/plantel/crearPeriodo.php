











<div class="container mt-5">
  <!-- Section for Adding New Periods -->
  <div class="card shadow-lg p-4 mb-5  rounded">
    <div class="card-body">
      <h2 class="card-title text-center text-primary mb-4">
        <i class="fas fa-calendar-alt me-2"></i> Gestión de Periodos Académicos
      </h2>
      <p class="text-center text-muted mb-4">
        Registre nuevos periodos de inicio y fin para el año escolar.
      </p>

      <form
        id="addPeriodoForm"
        class="needs-validation"
        novalidate
        hx-post="/plantel/periodo/crear"
        hx-target="#periodosListContainer"
        hx-trigger="submit"
        hx-indicator="#periodoLoadingIndicator"
        hx-swap="outerHTML"
        hx-on="htmx:afterRequest: if (event.detail.successful) { this.reset(); htmx.trigger('#periodosListContainer', 'load'); }"
      >
        <div class="mb-3">
          <label for="inicio_periodo" class="form-label">Inicio del Periodo</label>
          <input
            type="date"
            id="inicio_periodo"
            name="inicio_periodo"
            class="form-control"
            required
          >
          <div class="invalid-feedback">Por favor, seleccione la fecha de inicio del periodo.</div>
        </div>

        <div class="mb-4">
          <label for="fin_periodo" class="form-label">Fin del Periodo</label>
          <input
            type="date"
            id="fin_periodo"
            name="fin_periodo"
            class="form-control"
            required
          >
          <div class="invalid-feedback">Por favor, seleccione la fecha de fin del periodo.</div>
        </div>

        <div class="d-grid mt-4">
          <button type="submit" class="btn btn-primary btn-lg">
            <i class="fas fa-plus-circle me-2"></i> Agregar Periodo
          </button>
        </div>
      </form>
    </div>
  </div>

  <!-- Section for Listing Periods -->
  <h3 class="text-center mt-5 mb-3 text-secondary">
    <i class="fas fa-list-alt me-2"></i> Listado de Periodos Existentes
  </h3>

  <!-- HTMX Loading Indicator for the list -->
  <div id="periodoLoadingIndicator" class="text-center htmx-indicator mb-3">
    <div class="spinner-border text-primary" role="status">
      <span class="visually-hidden">Cargando periodos...</span>
    </div>
    <p class="mt-2 text-muted">Cargando listado de periodos académicos...</p>
  </div>

  <div
    id="periodosListContainer"
    class="table-responsive p-4 border rounded shadow-sm "
    hx-post="/plantel/periodo/consultar"
    hx-trigger="load, refreshPeriodos from:body"
    hx-target="this"
    hx-swap="innerHTML"
  >
    <p class="text-center text-muted">
      El listado de periodos académicos aparecerá aquí.
    </p>
    <!-- Content will be loaded by HTMX here -->
  </div>
</div>

<script>
  // JavaScript for Bootstrap form validation
  (function () {
    'use strict';
    var form = document.getElementById('addPeriodoForm');
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


