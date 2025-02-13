            <h2>Planilla</h2>
            <form id="planillaForm">
                <div class="form-group">
                    <label for="periodo">Periodo</label>
                    <select id="periodo" name="periodo" class="form-control">
                        <option value="2019-2020">2019-2020</option>
                        <option value="2018-2019">2018-2019</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="edad">Edad</label>
                    <input type="number" id="edad" name="edad" class="form-control" min="0">
                </div>
                <div class="form-group">
                    <label for="sexo">Sexo</label>
                    <select id="sexo" name="sexo" class="form-control">
                        <option value="masculino">Masculino</option>
                        <option value="femenino">Femenino</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="numeroEstudiantes">Número de Estudiantes</label>
                    <select id="numeroEstudiantes" name="numeroEstudiantes" class="form-control">
                        <option value="1">1</option>
                        <option value="10">10</option>
                        <option value="25">25</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                </div>
                <button type="button" id="generarPlanilla" class="btn btn-success">Generar Planilla</button>
            </form>
            <div id="planillaTable" class="table-responsive"></div>
        </div>
        