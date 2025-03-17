        <form class=" d-grid">
        <h3 class="legend text-primary">Datos del niño o niña:</h3>
        <label class="control-label col-md-6 themed-grid-col"
          >apellidos:

          <input require
          tipe="text"
          name="Datos_Niño_Apellidos"
          placeholder="apellidos"
          class="form-control m-1"
          id="apellidos"
          />
      </label>

      <label class="control-label col-md-6 themed-grid-col"
        >nombres:

        <input require
        type="text"
        name="Datos_Niño_Nombres"
        placeholder="nombres"
        class="form-control m-1"
        id="nombres"
        />
    </label>

    <label class="control-label m-1 col-md-3 themed-grid-col"
      >fecha de nacimiento:

      <input require
      type="date"
      name="Datos_Niño_Fecha"
      placeholder="fecha de nacimiento"
      class="form-control m-1"
      id="fecha"
      />
  </label>

  <label class="control-label m-1 p-1 col-md-4 themed-grid-col"
    >lugar de nacimiento:

    <select
      name="Datos_Niño_Lugar_Nacimiento"
      class="form-control m-1"
      id="procedencia"
      id="lugar"
      >
      <?php ?>
    </select>
  </label>

  <label class="m-1 p-1 col-md-3 themed-grid-col"
    >procedencia:
    <select
      name="Datos_Niño_Procedencia"
      class="form-control m-1"
      id="procedencia"
      >
      <?php ?>
    </select>
  </label>

  <label class="control-label m-1 p-1 col-md-3 themed-grid-col"
    >municipio:
    <select
      name="Datos_Niño_Municipio"
      class="form-control m-1"
      id="municipio"
      >
      <?php ?>
    </select>
  </label>

  <label class="control-label m-1 p-1 col-md-3 themed-grid-col"
    >estado:
    <select
      name="Datos_Niño_Estado"
      class="form-control m-1"
      id="estado"
      >
      <?php ?>
    </select>
  </label>

  <label class="control-label m-1 p-1 col-md-3 themed-grid-col"
    >nacionalidad:
    <select
      name="Datos_Niño_Nacionalidad"
      placeholder="nacionalidad"
      class="form-control m-1"
      id="nacionalidad"
      >
      <?php ?>
    </select>
  </label>

  <label class="control-label col-md-2 themed-grid-col">sexo:
    <select
      name="Datos_Niño_Sexo"
      id="sexo"
      class="form-control m-1"
      hx-get="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
     hx-trigger="click"
      >
      
    </select>
  </label>


<label class="control-label m-1 p-1 col-md-3 themed-grid-col">
  Talla de camisa
  <input require
  type="text"
  name="Datos_Niño_Talla_Camisa"
  class="form-control m-1"
  id="Talla_camisa"
  />
</label>
<label class="control-label m-1 p-1 col-md-3 themed-grid-col">
pantalón
<input require
type="text"
name="Datos_Niño_Talla_PadrendaPantalon"
class="form-control m-1"
id="pantalon"
/>
</label>
<label class="control-label m-1 p-1 col-md-3 themed-grid-col">
zapato
<input require
type="text"
name="Datos_Niño_Talla_Zapato"
id="zapato"
class="form-control m-1"
/>
</label>

<label class="control-label m-1 p-1 col-md-3 themed-grid-col">
peso

<input require
type="text"
name="Datos_Niño_Talla_Peso"
class="form-control m-1"
id="peso"
/>
</label>

<label class="control-label m-1 p-1 col-md-3 themed-grid-col">
talla
<input require
type="text"
name="Datos_Niño_Talla"
class="form-control m-1"
id="talla"
/>
</label>

<label class="control-label m-1 p-1 col-md-3 themed-grid-col">
circunferencia braquial

<input require
type="text"
name="Datos_Niño_Talla_Circunferencia_Braquial"
class="form-control m-1"
id="cb"
/>
</label>

<h4 class="text-primary">direccion</h4>

<label class="control-label col-md-4 themed-grid-col"
>calle
<select
name="Datos_Niño_Calle"
class="form-control m-1"
>
</select>
</label>

<label class="control-label col-md-4 themed-grid-col"
>sector
<select
name="Datos_Niño_Sector"
class="form-control m-1"
>
<?php ?>
</select>
</label>

<label class="control-label col-md-4 themed-grid-col"
>parroquia
<select
name="Datos_Niño_Padrerroquia"
class="form-control m-1"
>
<?php ?>
</select>
</label>

<h4 class="text-primary">datos medicos</h4>

<label class="control-label col-md-4 themed-grid-col"
>estado nutricional
<select
name="Datos_Niño_Estado_Nutricional"
class="form-control m-1"
>

</select>
</label>

<label class="control-label col-md-4 themed-grid-col"
>condicion medica
<select
name="Datos_Niño_Condicion_medica"
class="form-control m-1"
>
<?php ?>
</select>
</label>

<label class="control-label col-md-4 themed-grid-col"
>discapacidad
<select
name="Datos_Niño_Discapacidad"
class="form-control m-1"
>
<?php ?>
</select>
</label>






</form>