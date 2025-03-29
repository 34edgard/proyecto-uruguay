
<form 
hx-post="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="submit"
hx-target="#InicioInscripcion"
  >
<h3 class="text-primary">Datos del representante </h3>
<label class="col-md-6 themed-grid-col"
>Apellidos:
<input require
type="text"
name="apellidos"
class="form-control m-1"
/>
</label>
<label class="col-md-6 themed-grid-col"
>nombres del representante:
<input require
type="text"
name="nombres"
class="form-control m-1"
/>
</label>
<label class="col-md-4 themed-grid-col"
>Cedula:
<input require
type="number"
name="cedula"
class="form-control m-1"
/>
</label>

<label class="col-md-3 themed-grid-col"
>fecha de nacimiento
<input require
type="date"
name="fecha_nacimiento"
class="form-control m-1"
/>
</label>

<label class=""
>nacionalidad
<select
hx-get="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="load"
hx-target="#nacionalidad"
id="nacionalidad"
name="id_nacionalidad"
class="form-control m-1"
>
<option value="1"></option>
</select>
</label>

<label class="col-md-4 themed-grid-col"
>nivel de instruccion:

<select
hx-get="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="load"
hx-target="#Nivel_Instruccion"
id="Nivel_Instruccion"
name="id_nivel_instruccion"
class="form-control m-1"
>
<?php ?>
</select>
</label>

<label class="col-md-4 themed-grid-col"
>ocupación
<select require
hx-get="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="load"
hx-target="#ocupacion"
id="ocupacion"
name="id_ocupacion"
class="form-control m-1"
>
  </select>
</label>


<h4 class="text-primary"
hx-get="/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php?estado"
id="fo"
hx-target="#parroquia1"
hx-trigger="load"
  >direccion de habitación</h4>

<label class="col-md-4 themed-grid-col">parroquia
<select
id="parroquia1"
hx-get="/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php"

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
hx-get="/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php?calle"

hx-target="#calle1"
hx-trigger="change"

class="form-control m-1"
>

</select>
</label>
<label class="col-md-4 themed-grid-col">calle
<select
name="id_direccion_trabajo"
id="calle1"

class="form-control m-1"
>
<option value="1"></option>
</select>
</label>
<label>
  ubicación 
  <input type="text"
  name="descripcion_direccion_trabajo"
  class="form-control"
  placeholder=""
  >
</label>
<h4 class="text-primary"

  >direccion de trabajo</h4>

<label class="col-md-4 themed-grid-col"
>calle
<select

class="form-control m-1"
>

</select>
</label>

<label class="col-md-4 themed-grid-col"
>sector
<select

class="form-control m-1"
>

</select>
</label>

<label class="col-md-4 themed-grid-col"
>parroquia
<select
name="id_direccion_habitacion"
class="form-control m-1"
>
<option value="1"></option>
</select>
</label>

<label>
  ubicación 
  <input type="text"
  name="descripcion_direccion_habitacion"
  class="form-control"
  placeholder=""
  >
</label>
<button type="submit" class="btn btn-primary">
  registrar 
</button>

</form>

