<div class="container mt-5">
  <div class="card shadow-lg p-4 mb-5  rounded">
    <div class="card-body">
      <h2 class="card-title text-center text-primary mb-4">
        <i class="fas fa-file-alt me-2"></i> Generador de Planilla
      </h2>
      <p class="text-center text-muted mb-4">
        Seleccione los criterios para generar la planilla de estudiantes.
      </p>

      <form
    
    hx-post="/planillas/tablas"
           hx-trigger="submit"
           hx-target="#planillaTable"
        
    
     id="planillaForm" class="needs-validation" novalidate>
        <div class="row mb-3">
          <div class="col-md-6">
            <label for="periodo" class="form-label">Periodo Académico</label>
            <select 
            
            hx-get="/plantel/periodo/escolar?periodo_escolar"
               hx-trigger="load"
               hx-target="#periodo"
            
            
            id="periodo" name="periodo" class="form-select" required>
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
            <label for="edad" class="form-label">Edad (años)</label>
           
        
            
            <select id="edad" name="edad" class="form-select" required>
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
            <label for="sexo" class="form-label">Sexo</label>
            <select id="sexo" name="sexo" class="form-select" required>
              <option value="" disabled selected>Seleccione el sexo</option>
              <option value="masculino">Masculino</option>
              <option value="femenino">Femenino</option>
              <option value="todo">Todos</option>
            </select>
            <div class="invalid-feedback">Por favor, seleccione el sexo.</div>
          </div>
          <div class="col-md-6">
       <label for="numeroEstudiantes" class="form-label">Número de Estudiantes a Mostrar</label>
            <select id="numeroEstudiantes" name="numeroEstudiantes" class="form-select" required>
              <option value="" disabled selected>Seleccione cantidad</option>
              <option value="1">1</option>
              <option value="10">10</option>
              <option value="25">25</option>
              <option value="50">50</option>
              <option value="100">100</option>
              <option value="250">250</option>
              <option value="500">500</option>
            </select>
            <div class="invalid-feedback">Por favor, seleccione el número de estudiantes.</div>
          </div>
        </div>

        <div class="d-grid gap-2">
          <button type="submit" id="generarPlanilla" class="btn btn-success btn-lg">
            <i class="fas fa-cogs me-2"></i> Generar Planilla
          </button>
        </div>
      </form>
    </div>
  </div>

  <h3 class="text-center mt-5 mb-3 text-secondary">
    <i class="fas fa-table me-2"></i> Resultados de la Planilla
  </h3>
  <div
hx-get="/planillas"
hx-target="#planillaTable"
hx-trigger="load"

  class="table-responsive p-4 border rounded shadow-sm ">
    <table class="table table-striped table-hover table-bordered" id="tablaMatricula">
    <thead class="table-primary">
      <tr>
        <th colspan="6" class="text-center"> Estudiantes</th>
      </tr>
        <tr>
        <th class="text-center">Cédula </th>
        <th class="text-center">Nombres y Apellidos </th>
        <th class="text-center">Sexo Estudiante</th>
        <th class="text-center">Fecha de Nacimiento</th>
        <th class="text-center">Edad</th>
        <th class="text-center"></th>
            
           </tr>
    </thead>
    <tbody id="planillaTable" >
    
    
    
    </tbody>
    
    </table>
    
    
    
    
    
    <p class="text-center text-muted">
      La tabla de estudiantes generada aparecerá aquí.
    </p>
    <!-- Dynamic table content will be loaded here -->
  </div>
</div>

