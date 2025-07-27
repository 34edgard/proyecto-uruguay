
<div class="container mt-5">
  <div class="card shadow-lg p-4 mb-5  rounded">
    <div class="card-body">
      <h2 class="card-title text-center text-primary mb-4">
        <i class="fas fa-chart-bar me-2"></i> Generador de Estadísticas
      </h2>
      <p class="text-center text-muted mb-4">
        Seleccione los filtros para obtener datos estadísticos detallados.
      </p>

      <form
        id="estadisticaForm"
        class="row g-3 needs-validation"
        novalidate
        hx-post="/estadistica/generar"
        hx-target="#estadisticaResults"
        hx-trigger="submit"
        hx-indicator="#estadisticaLoadingIndicator"
      >
        <div class="col-md-4">
          <label for="periodoEstadistica" class="form-label">Periodo Académico</label>
          <select 
             hx-get="/plantel/periodo/escolar?periodo_escolar"
               hx-trigger="load"
            hx-target="#periodoEstadistica"
        id="periodoEstadistica" name="periodo" class="form-select" required>
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
        <div class="col-md-4">
          <label for="edadEstadistica" class="form-label">Edad</label>
          <select id="edadEstadistica" name="edad" class="form-select" required>
            <option value="" disabled selected>Seleccione la edad</option>
            <option value="2">2 años</option>
            <option value="3">3 años</option>
            <option value="4">4 años</option>
            <option value="5">5 años</option>
            <option value="6">6 años</option>
          </select>
          <div class="invalid-feedback">Por favor, seleccione una edad.</div>
        </div>
        <div class="col-md-4">
          <label for="sexoEstadistica" class="form-label">Sexo</label>
          <select id="sexoEstadistica" name="sexo" class="form-select" required>
            <option value="" disabled selected>Seleccione el sexo</option>
            <option value="masculino">Masculino</option>
            <option value="femenino">Femenino</option>
            <option value="todos">Todos</option>
          </select>
          <div class="invalid-feedback">Por favor, seleccione el sexo.</div>
        </div>

        <div class="col-md-6">
          <label for="tipoEstadistica" class="form-label">Tipo de Estadística</label>
          <select id="tipoEstadistica" name="tipoEstadistica" class="form-select" required>
            <option value="" disabled selected>Seleccione tipo</option>
            <option value="inscritos">Inscritos</option>
            <option value="promovidos">Promovidos</option>
            <option value="ambos">Ambos (Inscritos y Promovidos)</option>
          </select>
          <div class="invalid-feedback">Por favor, seleccione un tipo de estadística.</div>
        </div>
        <div class="col-md-6">
          <label for="planteles" class="form-label">Tipo de Plantel</label>
          <select id="planteles" name="planteles" class="form-select" required>
            <option value="" disabled selected>Seleccione tipo de plantel</option>
            <option value="publico">Público</option>
            <option value="privado">Privado</option>
            <option value="todos">Todos</option>
          </select>
          <div class="invalid-feedback">Por favor, seleccione un tipo de plantel.</div>
        </div>

        <div class="col-12 mt-4 d-grid">
          <button type="submit" id="generarEstadistica" class="btn btn-success btn-lg">
            <i class="fas fa-chart-pie me-2"></i> Generar Estadística
          </button>
        </div>
      </form>
    </div>
  </div>

  <h3 class="text-center mt-5 mb-3 text-secondary">
    <i class="fas fa-calculator me-2"></i> Resultados Estadísticos
  </h3>

  <!-- HTMX Loading Indicator -->
  <div id="estadisticaLoadingIndicator" class="text-center htmx-indicator mb-3">
    <div class="spinner-border text-primary" role="status">
      <span class="visually-hidden">Cargando...</span>
    </div>
    <p class="mt-2 text-muted">Generando estadísticas...</p>
  </div>

  <!-- HTMX Target for all Statistical Results -->
  <div

hx-get="/estadistica/general"
hx-target="#estadisticaResults"
hx-trigger="load"

 id="estadisticaResults" class="p-4 border rounded shadow-sm ">
    <p class="text-center text-muted mb-4">
      Los resultados de las estadísticas aparecerán aquí.
    </p>
    <div 
    
    class="row row-cols-1 row-cols-md-2 g-4">
      <!-- Card for Niños/ñas Inscritos -->
        
    
    </div>
  </div>
</div>












<script>
  // JavaScript for Bootstrap form validation
  (function () {
    'use strict';
    var form = document.getElementById('estadisticaForm');
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