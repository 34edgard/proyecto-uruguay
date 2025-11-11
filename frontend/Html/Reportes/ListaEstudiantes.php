<?php session_start(); ?>

<div class="container mt-5">
  <div class="card shadow-lg p-4 mb-5  rounded">
    <div class="card-body">
      <h2 class="card-title text-center text-primary mb-4">
        <i class="fas fa-user-graduate me-2"></i> Gestión lista de estudiantes
      </h2>
      <p class="text-center text-muted mb-4">
        Seleccione los filtros para buscar estudiantes.
      </p>

      <form
        id="matriculaForm"
        class="row g-3 needs-validation"
        novalidate
        hx-post="/reportes/ListaEstudiantes/generar"
        hx-target="#matriculaResults"
        hx-trigger="submit"
        hx-indicator="#matriculaLoadingIndicator"
      >
        <div class="col-md-4">
          <label for="periodoMatricula" class="form-label">Periodo Académico</label>
          <select
        hx-get="/plantel/periodo/escolar?periodo_escolar"
        hx-trigger="load"
        hx-target="#periodoMatricula"
         id="periodoMatricula" name="periodo" class="form-select" required>
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
          <label for="edadMatricula" class="form-label">Edad</label>
          <select id="edadMatricula" name="edad" class="form-select" required>
            <option value="" disabled selected>Seleccione la edad</option>
            <option value="" >...</option>
            
            <option value="2">2 años</option>
            <option value="3">3 años</option>
            <option value="4">4 años</option>
            <option value="5">5 años</option>
            <option value="6">6 años</option>
             </select>
          <div class="invalid-feedback">Por favor, seleccione una edad.</div>
        </div>
        
        <div class="col-md-4">
          <label for="sexoMatricula" class="form-label">Sexo</label>
          <select id="sexoMatricula" name="sexo" class="form-select" required>
            <option value="" disabled selected>Seleccione el sexo</option>
            <option value="todos">todos</option>
            <option value="masculino">Masculino</option>
            <option value="femenino">Femenino</option>
           </select>
          <div class="invalid-feedback">Por favor, seleccione el sexo.</div>
        </div>
        <div class="col-12 mt-4 d-grid">
          <button type="submit" name="generarMatricula" class="btn btn-success btn-lg">
            <i class="fas fa-filter me-2"></i> Generar lista de estudiantes
          </button>
        </div>
      </form>
    </div>
  </div>

  <h3 class="text-center mt-5 mb-3 text-secondary">
    <i class="fas fa-clipboard-list me-2"></i> Detalle de la lista de estudiantes
  </h3>

  <!-- HTMX Loading Indicator -->
  <div id="matriculaLoadingIndicator" class="text-center htmx-indicator mb-3">
    <div class="spinner-border text-primary" role="status">
      <span class="visually-hidden">Cargando...</span>
    </div>
    <p class="mt-2 text-muted">Generando lista ...</p>
  </div>

  <!-- HTMX Target for Table Results -->
  <div id="" class="table-responsive p-4 border rounded shadow-sm ">
    <p class="text-center text-muted">
      La lista de todos los estudiantes generada aparecerá aquí.
    </p>
    <!-- Initial table structure will be replaced by HTMX response -->
    <table class="table table-striped table-hover table-bordered" id="tablaMatricula">
      <thead class="table-primary">
        <tr>
          <th colspan="10" class="text-center">Lista de todos los estudiantes</th>
        </tr>
        <tr>
        <th colspan="10" class="text-center">Datos del Estudiante</th>
        
        </tr>
        <tr>
          <th class="text-center">Cédula </th>
          <th class="text-center">Nombres y Apellidos </th>
          <th class="text-center">Sexo Estudiante</th>
          <th class="text-center">Fecha de Nacimiento</th>
          <th class="text-center">Edad</th>
          <th class="text-center">Lugar de Nacimiento</th>
          <th class="text-center">Representantes</th>
          <th class="text-center">Editar </th>
         
         <?php  if ($_SESSION["id_rol"] == 1): ?>
          <th class="text-center">Eliminar </th>
          
        <?php endif; ?>
           </tr>
      </thead>
      <tbody  
    
    id="matriculaResults"
      hx-get="/reportes/ListaEstudiantes"
     hx-trigger="load"
      >
        <!-- Aquí se agregarán las filas dinámicamente por HTMX -->
      </tbody>
    </table>
    <div class="text-center mt-3">
      <button type="button" class="btn btn-secondary btn-lg" id="imprimirMatricula">
        <i class="fas fa-print me-2"></i> Imprimir Matrícula
      </button>
    </div>
  </div>
</div>


<script
src="/frontend/js/NiñosPorSexo.php"

></script>

<script src="/frontend/js/validarFormulario.js">

</script>

<script>

  // You might still want some JS for the print button,
  // though printing usually involves server-side rendering or a dedicated print stylesheet.
  document.getElementById('imprimirMatricula').addEventListener('click', function() {
    // Example: Trigger browser print dialog for the content of #matriculaResults
    // This is a basic example and might need more sophisticated handling for complex layouts.
    const printContents = document.getElementById('matriculaResults').innerHTML;
    const originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
    // Reload the page or re-render content if necessary after printing
    // window.location.reload(); // Or use HTMX to re-fetch if needed
  });
</script>




<div class="modal fade" id="firefoxModal" tabindex="-1" aria-labelledby="firefoxModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-body " id="modal-form">



      </div>

    </div>
  </div>
</div>







