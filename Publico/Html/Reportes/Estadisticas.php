 
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