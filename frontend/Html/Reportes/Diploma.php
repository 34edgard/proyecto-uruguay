<div class="container mt-5">
  <div class="card shadow-lg p-4 mb-5  rounded">
    <div class="card-body">
      <h2 class="card-title text-center text-primary mb-4">
        <i class="fas fa-award me-2"></i> Generador de Diplomas
      </h2>
      <p class="text-center text-muted mb-4">
        Configure los criterios para generar los diplomas de los estudiantes.
      </p>

      <form
        id="diplomaForm"
        class="needs-validation"
        novalidate
        hx-post="/diploma/generar"
        hx-target="#diplomaTable"
        hx-trigger="submit"
        hx-indicator="#loadingIndicator"
      >
        <div class="row mb-3">
          <div class="col-md-6">
            <label for="periodoDiploma" class="form-label">Periodo Académico</label>
            <select 
            hx-get="/plantel/periodo/escolar?periodo_escolar"
               hx-trigger="load"
               hx-target="#periodoDiploma"
            
            
            id="periodoDiploma" name="periodo" class="form-select" required>
              <option value="" disabled selected>Seleccione un periodo</option>
              <option value="2024-2025">2024-2025</option>
              <option value="2023-2024">2023-2024</option>
              <option value="2022-2023">2022-2023</option>
              <option value="2021-2022">2021-2022</option>
              <option value="2020-2021">2020-2021</option>
              <option value="2019-2020">2019-2020</option>
              <option value="2018-2019">2018-2019</option>
            </select>
            <div class="invalid-feedback">Por favor, seleccione un periodo.</div>
          </div>
          <div class="col-md-6">
            <label for="edadDiploma" class="form-label">Edad (años)</label>
            
            
            <select id="edadDiploma" name="edad" class="form-select" required>
                  <option value="" disabled selected>Seleccione la edad</option>
                  <option value="" >todas</option>
                  
                  <option value="2">2 años</option>
                  <option value="3">3 años</option>
                  <option value="4">4 años</option>
                  <option value="5">5 años</option>
                  <option value="6">6 años</option>
                   </select>
            
            
            
            
            <div class="invalid-feedback">Por favor, ingrese una edad válida (mínimo 0).</div>
          </div>
        </div>

        <div class="row mb-4">
          <div class="col-md-6">
            <label for="sexoDiploma" class="form-label">Sexo</label>
            <select id="sexoDiploma" name="sexo" class="form-select" required>
              <option value="" disabled selected>Seleccione el sexo</option>
              <option value="masculino">Masculino</option>
              <option value="femenino">Femenino</option>
              <option value="todo">Todos</option>
            </select>
            <div class="invalid-feedback">Por favor, seleccione el sexo.</div>
          </div>
          <div class="col-md-6">
            <label for="numeroEstudiantesDiploma" class="form-label">Número de Diplomas a Generar</label>
            <select id="numeroEstudiantesDiploma" name="numeroEstudiantes" class="form-select" required>
              <option value="" disabled selected>Seleccione cantidad</option>
              <option value="1">1</option>
              <option value="10">10</option>
              <option value="25">25</option>
              <option value="50">50</option>
              <option value="100">100</option>
              <option value="250">250</option>
              <option value="500">500</option>
            </select>
            <div class="invalid-feedback">Por favor, seleccione el número de diplomas.</div>
          </div>
        </div>

        <div class="d-grid gap-2">
          <button type="submit" id="generarDiploma" class="btn btn-success btn-lg">
            <i class="fas fa-print me-2"></i> Generar Diplomas
          </button>
        </div>
      </form>
    </div>
  </div>

  <h3 class="text-center mt-5 mb-3 text-secondary">
    <i class="fas fa-list-alt me-2"></i> Lista de Diplomas Generados
  </h3>
  <div id="loadingIndicator" class="text-center htmx-indicator mb-3">
    <div class="spinner-border text-primary" role="status">
      <span class="visually-hidden">Cargando...</span>
    </div>
    <p class="mt-2 text-muted">Generando diplomas...</p>
  </div>
  <div id="diplomaTable" class="table-responsive p-4 border rounded shadow-sm ">
    <p class="text-center text-muted">
      Los diplomas generados aparecerán aquí en formato de tabla.
    </p>
    <!-- Server-generated table content will be loaded here by HTMX -->
  </div>
</div>

<script>
  // JavaScript for Bootstrap form validation (still useful for immediate visual feedback)
  (function () {
    'use strict';
    var form = document.getElementById('diplomaForm');
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