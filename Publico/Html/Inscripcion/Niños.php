        <form 
        hx-post="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="submit"
hx-target="#InicioInscripcion"
        >
        <h3 class="legend text-primary">Datos del niño o niña:</h3>
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

  <label class="control-label m-1 p-1 "
    >lugar de nacimiento:

    <select
      name="id_lugar_nacimiento"
      class="form-control m-1"
      id="procedencia"
      id="lugar"
      >
      <option value=""></option>
    </select>
  </label>

  <label class="m-1 p-1 "
    >procedencia:
    <select
      name="id_procedencia"
      class="form-control m-1"
      id="procedencia"
      >
      <option value=""></option>
    </select>
  </label>

  <label class="control-label m-1 p-1 "
    >municipio:
    <select
      
      class="form-control m-1"
      id="municipio"
      >
      <option value=""></option>
    </select>
  </label>

  <label class="control-label m-1 p-1 "
    >estado:
    <select
      
      class="form-control m-1"
      id="estado"
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
     hx-trigger="click"
      >
      
    </select>
  </label>


<h4 class="text-primary">direccion</h4>

<label class="control-label col-md-4 themed-grid-col"
>calle
<select

class="form-control m-1"
>
</select>
</label>

<label class="control-label col-md-4 themed-grid-col"
>sector
<select

class="form-control m-1"
>
<option value=""></option>
</select>
</label>

<label class="control-label col-md-4 themed-grid-col"
>parroquia
<select

class="form-control m-1"
>
<option value=""></option>
</select>
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
name="id_condicion_medica"
class="form-control m-1"
>
<option value=""></option>
</select>
</label>

<label class="control-label"
>discapacidad
<select
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