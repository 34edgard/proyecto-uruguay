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