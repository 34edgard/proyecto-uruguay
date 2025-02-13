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