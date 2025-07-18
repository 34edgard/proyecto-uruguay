<div class="container">
  <h1 class="text-center text-primary">Reportes</h1>
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link active" data-bs-toggle="tab" data-bs-target="#matricula" role="tab" aria-selected="true">Matricula</button>
    </li>
    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link " data-bs-toggle="tab" data-bs-target="#planilla" role="tab" aria-selected="true">Planilla</button>
    </li>
    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link " data-bs-toggle="tab" data-bs-target="#diploma" role="tab" aria-selected="true">Diploma</button>
    </li>
    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link " data-bs-toggle="tab" data-bs-target="#estadistica" role="tab" aria-selected="true">Estadistica</button>
    </li>
  </ul>

  <div class="tab-content" role="tablist">
            <div class="tab-pane fade show active table-responsive p-3" id="matricula" role="tabpanel" aria-labelledby="matricula-tab">
                <h2 class="text-primary text-center mb-3">Matrícula</h2>
                <form class="row g-3">
                    <div class="col-md-4">
                        <label for="periodoMatricula" class="form-label">Periodo</label>
                        <select id="periodoMatricula" name="periodo" class="form-select">
                            <option value="2">2019-2020</option>
                            <option value="1">2018-2019</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label for="edadMatricula" class="form-label">Edad</label>
                        <select id="edadMatricula" name="edad" class="form-select">
                            <option value="0"></option>
                            <option value="6">6</option>
                            <option value="5">5</option>
                            <option value="3">3</option>
                            <option value="2">2</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label for="sexoMatricula" class="form-label">Sexo</label>
                        <select id="sexoMatricula" name="sexo" class="form-select">
                            <option value="1">Niños</option>
                            <option value="2">Niñas</option>
                        </select>
                    </div>

                    <div class="col-12">
                        <button type="button" name="generarMatricula" class="btn btn-success">Generar Matrícula</button>
                    </div>
                </form>

                 <!-- Tabla Matrícula (vacía inicialmente, se llenará con JS) -->
                <div class="table-responsive mt-3">
                    <table class="table table-bordered" id="tablaMatricula">
                       <thead>
                        <tr>
                            <td colspan='11'>matricula general</td>
                        </tr>
                        <tr>
                            <td>cedula</td>
                            <td>nombres y apellidos</td>
                            <td>sexo</td>
                            <td>fecha de nacimiemto</td>
                            <td>edad</td>
                            <td>lugar de nacimiemto</td>
                            <td>plantel</td>
                            <td>cedula</td>
                            <td>nombres y apellidos</td>
                            <td>telefono</td>
                            <td>direccion</td>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Aquí se agregarán las filas dinámicamente -->
                    </tbody>
                    </table>
                    <button type="button" class="btn btn-secondary mt-2" id="imprimirMatricula">Imprimir</button>
                </div>
            </div>
    

<div class="tab-pane table-responsive" id="diploma" role="tabpanel">
  <h2 class="text-center text-primary">Diploma</h2>
  <form class="p-2">
    <div class="form-group">
      <label for="periodoDiploma">Periodo</label>
      <select id="periodoDiploma" name="periodo" class="form-control">
        <option value="2">2019-2020</option>
        <option value="1">2018-2019</option>
      </select>
    </div>
    <div class="form-group">
      <label for="edadDiploma">Edad</label>
      <input type="number" id="edadDiploma" name="edad" class="form-control">
    </div>
    <div class="form-group">
      <label for="sexoDiploma">Sexo</label>
      <select id="sexoDiploma" name="sexo" class="form-control">
        <option value="1">Masculino</option>
        <option value="2">Femenino</option>
      </select>
    </div>
    <div class="form-group">
      <label for="numeroEstudiantesDiploma">Número de Estudiantes</label>
      <select id="numeroEstudiantesDiploma" name="numeroEstudiantes" class="form-control">
        <option value="1">1</option>
        <option value="10">10</option>
        <option value="25">25</option>
        <option value="50">50</option>
        <option value="100">100</option>
      </select>
    </div>
    <button type="button" id="generarDiploma" class="btn btn-success">Generar Diplomas</button>
  </form>
  <div id="diplomaTable" class="table-responsive"></div>
</div>
<div class="tab-pane table-responsive" id="estadistica" role="tabpanel">
  <h2 class="text-primary text-center">Estadistica</h2>
  <form>
    <label for="periodo" class="label-control">Periodo:</label>
    <select id="periodo" name="periodo" class="form-control">
      <option value="2">2019-2020</option>
      <option value="1">2018-2019</option>
    </select>

    <label for="edad" class="label-control">Edad:</label>
    <input type="number" id="edad" name="edad" class="form-control">

    <label for="sexo" class="label-control">Sexo:</label>
    <select id="sexo" name="sexo" class="form-control">
      <option value="1">Masculino</option>
      <option value="2">Femenino</option>
    </select>

    <label for="tipoEstadistica" class="label-control">Tipo de Estadística:</label>
    <select id="tipoEstadistica" name="tipoEstadistica" class="form-control">
      <option value="inscritos">Inscritos</option>
      <option value="promovidos">Promovidos</option>
    </select>

    <label for="planteles" class="label-control">Planteles:</label>
    <select id="planteles" name="planteles" class="form-control">
      <option value="publico">Público</option>
      <option value="privado">Privado</option>
    </select>

    <button type="button" id="generarEstadistica" class="btn btn-success">
      Generar Estadistica
    </button>
  </form>

  <div class="row">
    <div class="col-md-12">
      <div class="row row-cols-1 row-cols-md-2 g-4 m-4">

        <div class="col">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Niños/ñas Inscritos</h5>
              <table class="table table-bordered border-4" id="tablaInscritos">
                <thead>
                  <tr>
                    <th>Inscritos</th>
                    <th>Cantidad</th>
                  </tr>
                </thead>
                <tbody></tbody> <!-- Data will be added here dynamically -->
              </table>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Promovidos</h5>
              <table class="table table-bordered border-5" id="tablaPromovidos">
                <thead>
                  <tr>
                    <th>Promovidos</th>
                    <th>Cantidad</th> 
                    <th>Hombres</th>
                    <th>Mujeres</th>
                  </tr>
                </thead>
                 <tbody></tbody> <!-- Data will be added here dynamically -->
              </table>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Niños por edad</h5>
              <table class="table table-bordered border-5" id="tablaEdad">
                <thead>
                  <tr>
                    <th>Edad</th>
                    <th>Total</th>
                    <th>Hombres</th>
                    <th>Mujeres</th>
                  </tr>
                </thead>
                 <tbody></tbody> <!-- Data will be added here dynamically -->
              </table>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Planteles</h5>
              <table class="table table-bordered border-5" id="tablaPlanteles">
                <thead>
                    <tr>
                        <th>Plantel</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody></tbody> <!-- Data will be added here dynamically -->
              </table>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

  </div>

</div>
