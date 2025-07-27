
<div class="container-fluid">
  <div class="row">
    <div class="col-12">
    
    
    
      <h3 class="text-primary mt-3">
        Si el representante está registrado, oprima para registrar al estudiante
      </h3>
      <button
        class="btn btn-primary mb-4"
        hx-post="/frontend/Html/Inscripcion/Niños.php"
        hx-trigger="click"
        hx-target="#InicioInscripcion"
      >
        Registrar estudiante
      </button>
     
    <hr />
      <form hx-post="/reprecentante/registrar" hx-trigger="submit" hx-target="#InicioInscripcion">
        <h3 class="text-primary mb-3">Ingrese los Datos del Representante</h3>

        <div class="row g-3">
          <div class="col-md-6">
            <label for="apellidos" class="form-label">Apellidos:</label>
            <input
              type="text"
              name="apellidos"
              id="apellidos"
              class="form-control"
              placeholder="Apellidos"
              required
            >
          </div>
          <div class="col-md-6">
            <label for="nombres" class="form-label">Nombres del representante:</label>
            <input
              type="text"
              name="nombres"
              id="nombres"
              class="form-control"
              placeholder="Nombres"
              required
            >
          </div>
          <div class="col-md-4">
            <label for="cedula" class="form-label">Cédula:</label>
            <input
              type="number"
              name="cedula"
              id="cedula"
              class="form-control"
              placeholder="Cedula"
              required
            >
          </div>
          <div class="col-md-3">
            <label for="fecha_nacimiento" class="form-label">Fecha de Nacimiento:</label>
            <input
              type="date"
              name="fecha_nacimiento"
              id="fecha_nacimiento"
              class="form-control"
              required
            >
          </div>
          <div class="col-md-5">
            <label for="nacionalidad" class="form-label">Nacionalidad:</label>
            <select
              hx-get="/estudiante/nacionalidad"
              hx-trigger="load"
              hx-target="#nacionalidad"
              id="nacionalidad"
              name="id_nacionalidad"
              placeholder="Nacionalidad"
              class="form-control"
              required
            >
              <option value=""></option>
            </select>
          </div>
          <div class="col-md-6">
            <label for="Nivel_Instruccion" class="form-label">Nivel de Instrucción:</label>
            <select
              hx-get="/estudiante/nivel_instruccion"
              hx-trigger="load"
              hx-target="#Nivel_Instruccion"
              id="Nivel_Instruccion"
              name="id_nivel_instruccion"
              class="form-control"
              placeholder="Nivel de Instrucción"
              required
            >
              <option value=""></option>
            </select>
          </div>
          <div class="col-md-6">
            <label for="ocupacion" class="form-label">Ocupación:</label>
            <select
              hx-get="/estudiante/ocupacion"
              hx-trigger="load"
              hx-target="#ocupacion"
              id="ocupacion"
              name="id_ocupacion"
              class="form-control"
              placeholder="Ocupación"
              required
            >
              <option value=""></option>
            </select>
          </div>
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
    hx-get="/direccion/municipio?id_estado=1"
    hx-target="#municipio1"
    hx-trigger="change"
    
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
    hx-get="/direccion/parroquia2?id_municipio=1"
    hx-trigger="change"
    hx-target="#parroquia1"
    class="form-control"
    
    id="municipio1"
    required
  >
    <option value=""></option>
  </select>
</div>

<div

hx-get="/direccion/parroquia2?id_municipio=1"
hx-trigger="load"
hx-target="#parroquia1"
></div>
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
              class="form-control"
              name="id_direccion_habitacion"
              required
            >
              <option value=""></option>
            </select>
          </div>
          <div class="col-md-6">
            <label for="nro_vivienda2" class="form-label">Número de Vivienda:</label>
            <input
              type="text"
              name="nro_vivienda2"
              id="nro_vivienda2"
              class="form-control"
              value="ninguno"
              placeholder="Si tiene número de vivienda"
            >
          </div>
          <div class="col-md-6">
            <label for="descripcion_direccion_habitacion" class="form-label">Ubicación:</label>
            <input
              type="text"
                  
              name="descripcion_direccion_habitacion"
              id="descripcion_direccion_habitacion"
              class="form-control"
              placeholder=""
            >
          </div>
        </div>
        
       <div class="mb-3">
         <h5>¿Actualmente Trabaja?</h5>
         <div class="form-check form-check-inline">
           <input
             class="form-check-input"
             type="radio"
             name="trabaja"
             id="trabajaNo"
             value="no"
            onchange="visibleOff('direccion-trabajo')"
             checked
           >
           <label class="form-check-label" for="trabajaNo">No</label>
         </div>
         <div class="form-check form-check-inline">
           <input
             class="form-check-input"
             type="radio"
             name="trabaja"
             id="trabajaSi"
             value="si"
            onchange="visibleOn('direccion-trabajo')"
           >
           <label class="form-check-label" for="trabajaSi">Sí</label>
         </div>
       </div> 
        
        <div class="row g-3 mb-4 " id='direccion-trabajo' hidden>
        <h4
          class="text-primary mt-4 mb-3"
          hx-get="/direccion/estado?pais=1"
          hx-target="#estado2"
          hx-trigger="load"
        >
          Dirección de trabajo
        </h4>
        
        
        
        
        
        <div class="col-md-4">
          <label for="estado" class="form-label">Estado:</label>
          <select
            hx-get="/direccion/municipio?id_estado=1"
            hx-target="#municipio2"
            hx-trigger="change"
            
            class="form-control"
            id="estado2"
            required
          >
            <option value=""></option>
          </select>
        </div>
        
        <div  hx-get="/direccion/municipio?id_estado=1"
        hx-target="#municipio2"
        hx-trigger="load"></div>
        
        <div class="col-md-4">
          <label for="municipio2" class="form-label">Municipio:</label>
          <select
            hx-get="/direccion/parroquia2?id_municipio=1"
            hx-trigger="change"
            hx-target="#parroquia2"
            class="form-control"
            
            id="municipio2"
            required
          >
            <option value=""></option>
          </select>
        </div>
        
        
         <div  hx-get="/direccion/parroquia2?id_municipio=1"
         hx-target="#parroquia2"
         hx-trigger="load"></div>
        
        
          <div class="col-md-6"  >
            <label for="parroquia2" class="form-label"  >Parroquia:</label>
            <select
              id="parroquia2"
              hx-get="/direccion/sector"
              name="parroquia2"
              hx-target="#sector2"
              hx-trigger="change"
              class="form-control"
              required
            >
              <option value=""></option>
            </select>
          </div>
        
          <div  hx-get="/direccion/sector?parroquia2=1"
          hx-target="#sector2"
          hx-trigger="load"></div>
        
          <div class="col-md-6">
            <label for="sector2" class="form-label">Sector:</label>
            <select
              name="id_direccion_trabajo"
              id="sector2"
              class="form-control"
              required
            >
              <option value=""></option>
            </select>
          </div>
          <div class="col-md-6">
            <label for="nro_vivienda1" class="form-label">Número de Vivienda:</label>
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
            <label for="descripcion_direccion_trabajo" class="form-label">Ubicación:</label>
            <input
              type="text"
              name="descripcion_direccion_trabajo"
              id="descripcion_direccion_trabajo"
              class="form-control"
              placeholder=""
              value="ninguna"
            >
          </div>
        </div>

        <button type="submit" class="btn btn-primary">Registrar</button>
      </form>
    </div>
  </div>
</div>


