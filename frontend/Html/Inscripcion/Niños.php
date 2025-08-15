
<div class="container-fluid">
  <div class="row">
    <div class="col-12">
      <form hx-post="/estudiante/registrar" hx-trigger="submit" hx-target="#InicioInscripcion">
        <h3 class="legend text-primary mb-3">Datos del niño/a:</h3>

        <div class="row g-3">
          <div class="col-md-6">
            <label for="cedula_representante" class="form-label">Cédula del representante:</label>
            <input
              type="text"
              name="ci_escolar"
              placeholder="Cédula del representante"
              class="form-control"
              id="cedula_representante"
              required
            >
          </div>
         <div class="row g-3">
         <div class="col-md-6">
           <label for="cedula_madre" class="form-label">Cédula de la madre:</label>
           <input
             type="text"
             name="ci_madre"
             placeholder="Cédula de la madre"
             class="form-control"
             id="cedula_madre"
             required
           >
         </div>
         <div class="row g-3">
         <div class="col-md-6">
           <label for="cedula_padre" class="form-label">Cédula del padre:</label>
           <input
             type="text"
             name="ci_padre"
             placeholder="Cédula del padre"
             class="form-control"
             id="cedula_padre"
             required
           >
         </div>
         <div class="col-md-6">
           <label for="buscar_cedula" class="form-label">buscar Cédula:</label>
           <input
         hx-post='/reprecentantes/buscar/ci'
         hx-trigger='change'
         hx-target='#cedulas_representante'
         
        
             type="text"
             name="buscar_ci"
             placeholder="buscar cédula"
             class="form-control"
             id="buscar_cedula"
             required
           >
         </div>
        
         <div class="col-md-6">
           <label
        
         for="cedulas_representante" class="form-label">escoja el reprecentante:</label>
          
        
         
                   
           <select
        hx-get='/reprecentantes/ci'
        hx-trigger='load'
        hx-target='#cedulas_representante'
        id='cedulas_representante'
        class="form-control"
        onchange="inserValue('cedulas_representante','cedula_')"
        >
        </select>
         </div>
        <div class="col-md-6">
          <label
                
        for="cedulas_representante" class="form-label">escoja el reprecentante:</label>
         
                
        
                  
          <select
               id='parentesco'
                class="form-control"
                onchange="cambiarFuncion('cedulas_representante','parentesco')"
                >
                
                <option value='representante'>representante</option>
                <option value='madre'>madre</option>
                <option value='padre'>padre</option>
                </select>
        </div>
        
        
        
        
          <div class="col-12">
            <div class="container text-center" id="cedula_escolar">
              </div>
          </div>
          <div class="col-md-6">
            <label for="apellidos" class="form-label">Apellidos:</label>
            <input
              type="text"
              name="apellidos"
              placeholder="Apellidos"
              class="form-control"
              id="apellidos"
              required
            >
          </div>
          <div class="col-md-6">
            <label for="nombres" class="form-label">Nombres:</label>
            <input
              type="text"
              name="nombres"
              placeholder="Nombres"
              class="form-control"
              id="nombres"
              required
            >
          </div>
          <div class="col-md-4">
            <label for="fecha" class="form-label">Fecha de nacimiento:</label>
            <input
              type="date"
              name="fecha_nacimiento"
              placeholder="Fecha de nacimiento"
              class="form-control"
              id="fecha"
              required
            >
          </div>
          <div class="col-md-4">
            <label for="procedencia" class="form-label">Procedencia:</label>
            <select
              hx-get="/estudiante/procedencia"
              hx-trigger="load"
              hx-target="#procedencia"
              id="procedencia"
              name="id_procedencia"
              class="form-control"
              required
            >
              <option value=""></option>
            </select>
          </div>
          <div class="col-md-4">
            <label for="nacionalidad" class="form-label">Nacionalidad:</label>
            <select
              hx-get="/estudiante/nacionalidad"
              hx-trigger="load"
              hx-target="#nacionalidad"
              id="nacionalidad"
              name="id_nacionalidad"
              placeholder="nacionalidad"
              class="form-control"
              required
            >
              <option value=""></option>
            </select>
          </div>
          <div class="col-md-4">
            <label for="sexo" class="form-label">Sexo:</label>
            <select
              name="sexo"
              id="sexo"
              class="form-control"
              hx-get="/estudiante/sexo"
              hx-target="#sexo"
              hx-trigger="load"
              required
            >
              <option value=""></option>
            </select>
          </div>
        </div>

        <h2
          class="text-center mt-4 mb-3"
          hx-get="/direccion/estado?pais=1"
          hx-target="#estado"
          hx-trigger="load"
        >
          Lugar de nacimiento
        </h2>
        <div class="row g-3">
          <div class="col-md-4">
            <label for="estado" class="form-label">Estado:</label>
            <select
              hx-get="/direccion/municipio"
              hx-target="#municipio"
              hx-trigger="change"
              name="id_estado"
              class="form-control"
              id="estado"
              required
            >
              <option value=""></option>
            </select>
          </div>
        <div
        hx-get="/direccion/municipio?id_estado=1"
        hx-target="#municipio"
        hx-trigger="load"
        ></div>
          <div class="col-md-4">
            <label for="municipio" class="form-label">Municipio:</label>
            <select
              hx-get="/direccion/parroquia2"
              hx-trigger="change"
              hx-target="#lugar"
              class="form-control"
              name="id_municipio"
              id="municipio"
              required
            >
              <option value=""></option>
            </select>
          </div>
        
        <div
          hx-get="/direccion/parroquia2?id_municipio=1"
          hx-trigger="load"
          hx-target="#lugar"
        ></div>
        
          <div class="col-md-4">
            <label for="lugar" class="form-label">Parroquia:</label>
            <select
              name="id_parroquia"
              class="form-control"
              id="lugar"
              required
            >
              <option value=""></option>
            </select>
          </div>
        </div>

        <div
          class="text-primary mt-4 mb-3"
          hx-get="/direccion/parroquia?estado=1"
          hx-target="#parroquia1"
          hx-trigger="load"
        >
      </div>
        
        
        
        
                <h4
                          class="text-primary mt-4 mb-3"
                          hx-get="/direccion/estado?pais=1"
                          hx-target="#estado1"
                          hx-trigger="load"
                        >
                          Dirección de Habitación
                        </h4>
                        
                
                <div class="col-md-4">
                  <label for="estado" class="form-label">Estado:</label>
                  <select
                    hx-get="/direccion/municipio1"
                    hx-target="#municipio1"
                    hx-trigger="change"
                    name='estado1'
                    class="form-control"
                    id="estado1"
                    required
                  >
                    <option value=""></option>
                  </select>
                </div>
                
                
                <div
                hx-get="/direccion/municipio?id_estado=1"
                hx-target="#municipio1"
                hx-trigger="load"
                
                ></div>
                <div class="col-md-4">
                  <label for="municipio" class="form-label">Municipio:</label>
                  <select
                    hx-get="/direccion/parroquia_1"
                    name='Municipio1'
                    hx-trigger="change"
                    hx-target="#parroquia1"
                    class="form-control"
                    
                    id="municipio1"
                    required
                  >
                    <option value=""></option>
                  </select>
                </div>
                
        
        
        <div class="row g-3">
          <div class="col-md-6">
            <label for="parroquia1" class="form-label">Parroquia:</label>
            <select
              id="parroquia1"
              hx-get="/direccion/sector1"
              name="parroquia1"
              hx-target="#sector1"
              hx-trigger="change"
              class="form-control"
              required
            >
              <option value=""></option>
            </select>
          </div>
        
        <div
        hx-get="/direccion/sector1?parroquia1=1"
         
         hx-target="#sector1"
         hx-trigger="load"
        
        ></div>
          <div class="col-md-6">
            <label for="sector1" class="form-label">Sector:</label>
            <select
              id="sector1"
              hx-target="#calle1"
              hx-trigger="change"
              class="form-control"
              name="id_direccion"
              required
            >
              <option value=""></option>
            </select>
          </div>
          <div class="col-md-6">
            <label for="nro_vivienda1" class="form-label">Número de vivienda:</label>
            <input
              type="text"
              name="nro_vivienda1"
              id="nro_vivienda1"
              class="form-control"
              value="ninguno"
              placeholder="Si tiene número de vivienda"
            >
          </div>
          <div class="col-md-6">
            <label for="descripcion_direccion" class="form-label">Ubicación:</label>
            <input
              type="text"
              name="descripcion_direccion"
              id="descripcion_direccion"
              class="form-control"
              placeholder=""
            >
          </div>
        </div>

        <h4 class="text-primary mt-4 mb-3">Datos médicos</h4>
        <div class="row g-3 mb-4">
          <div class="col-md-4">
            <label for="estado_nutricional" class="form-label">Estado nutricional:</label>
            <select
              hx-get="/estudiante/estado_nutricional"
              hx-trigger="load"
              hx-target="#estado_nutricional"
              id="estado_nutricional"
              name="id_estado_nutricional"
              class="form-control"
              required
            >
              <option value=""></option>
            </select>
          </div>
          <div class="col-md-4">
            <label for="condicion_medica" class="form-label">Condición médica:</label>
            <select
              hx-get="/estudiante/condicion_medica"
              hx-trigger="load"
              hx-target="#condicion_medica"
              id="condicion_medica"
              name="id_condicion_medica"
              class="form-control"
              required
            >
              <option value=""></option>
            </select>
          </div>
          <div class="col-md-4">
            <label for="discapacidad" class="form-label">Discapacidad:</label>
            <select
              hx-get="/estudiante/discapacidad"
              hx-trigger="load"
              hx-target="#discapacidad"
              id="discapacidad"
              name="id_discapacidad"
              class="form-control"
              required
            >
              <option value=""></option>
            </select>
          </div>
        </div>

        <button type="submit" class="btn btn-primary">Guardar</button>
      </form>
    </div>
  </div>
</div>
