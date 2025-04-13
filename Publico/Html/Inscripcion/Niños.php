        <form 
        hx-post="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="submit"
hx-target="#InicioInscripcion"
        >
        <h3 class="legend text-primary">Datos del niño/a:</h3>
        <label >cedula del reprecentante:

<input require


tipe="text"
name="ci_escolar"
placeholder="cedula escolar"
class="form-control m-1"
id="cedula_reprecentante"
/>
</label>
       <div class="container m-2 text-center" id="cedula_escolar">

       </div>


        <label >apellidos:

          <input require
          tipe="text"
          name="apellidos"
          placeholder="apellidos"
          class="form-control m-1"
          id="apellidos"
          />
      </label>

      <label class="control-label "
        >nombres:

        <input require
        type="text"
        name="nombres"
        placeholder="nombres"
        class="form-control m-1"
        id="nombres"
        />
    </label>

    <label class="control-label m-1 "
      >fecha de nacimiento:

      <input require
      type="date"
      name="fecha_nacimiento"
      placeholder="fecha de nacimiento"
      class="form-control m-1"
      id="fecha"
      />
  </label>

  
  <label class="m-1 p-1 "
    >procedencia:
    <select
    hx-get="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="load"
hx-target="#procedencia"
id="procedencia"
      name="id_procedencia"
      class="form-control m-1"
      id="procedencia"
      >
      <option value=""></option>
    </select>
  </label>

 
  <label class="control-label m-1 p-1 "
    >nacionalidad:
    <select
    hx-get="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="load"
hx-target="#nacionalidad"
      name="id_nacionalidad"
      placeholder="nacionalidad"
      class="form-control m-1"
      id="nacionalidad"
      >
      <option value=""></option>
    </select>
  </label>

  <label class="control-label col-md-2 themed-grid-col">sexo:
    <select
      name="sexo"
      id="sexo"
      class="form-control m-1"
      
      hx-get="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
      hx-target="#sexo"
     hx-trigger="load"
      >
      
    </select>
  </label>


<div class="contatiner">
  <h2 class="text-center"
  hx-get="/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php?pais"
      hx-target="#estado"
     hx-trigger="load"
  
  >lugar de nacimiento</h2>


  <label class="control-label m-1 p-1 "
    >estado:
    <select
    hx-get="/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php"
      hx-target="#municipio"
     hx-trigger="change"
     name="id_estado"

      
      class="form-control m-1"
      id="estado"
      >
      <option value=""></option>
    </select>
  </label>

  <label class="control-label m-1 p-1 "
    >municipio:
    <select
       hx-get="/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php"
      hx-trigger="change"
      hx-target="#lugar"
      class="form-control m-1"
       name="id_municipio"
      id="municipio"
      >
      <option value=""></option>
    </select>
  </label>

  <label class="control-label m-1 p-1  "
    >parroquia:

    <select
      name="id_parroquia"
      class="form-control m-1"
      
      id="lugar"
      >
      <option value=""></option>
    </select>
  </label>




</div>









  <h4 class="text-primary"
hx-get="/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php?estado"
id="fo"
hx-target="#parroquia1"
hx-trigger="load"
  >direccion</h4>     

<label class="col-md-4 themed-grid-col">parroquia
<select
id="parroquia1"
hx-get="/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php"
name="parroquia1"
hx-target="#sector1"
hx-trigger="change"

class="form-control m-1"
>

</select>
</label>

<label class="col-md-4 themed-grid-col"
>sector
<select
id="sector1"


hx-target="#calle1"
hx-trigger="change"

class="form-control m-1"
name="id_direccion"
>

</select>
</label>
<label>
  numero de vivienda
  <input type="text"
  name="nro_vivienda1"
  class="form-control"
  value="ninguno"
  placeholder="si tiene numero de vivienda"
  >
</label>
<label>
  ubicación 
  <input type="text"
  name="descripcion_direccion"
  class="form-control"
  placeholder=""
  >
</label>

<h4 class="text-primary">datos medicos</h4>

<label class="control-label col-md-4 themed-grid-col"
>estado nutricional
<select
hx-get="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="load"
hx-target="#estado_nutricional"
id="estado_nutricional"
name="id_estado_nutricional"
class="form-control m-1"
>

</select>
</label>

<label class="control-label col-md-4 themed-grid-col"
>condicion medica
<select
hx-get="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="load"
hx-target="#condicion_medica"
id="condicion_medica"
name="id_condicion_medica"
class="form-control m-1"
>
<option value=""></option>
</select>
</label>

<label class="control-label"
>discapacidad
<select
hx-get="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="load"
hx-target="#discapacidad"
id="discapacidad"
name="id_discapacidad"
class="form-control m-1"
>
<option value=""></option>
</select>
</label>

<button type="submit"
class="btn btn-primary"
  >
  guarda 
</button>
</form>
