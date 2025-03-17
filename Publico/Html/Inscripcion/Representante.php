<form class=" d-grid">
<h3 class="text-primary">datos del representante </h3>
<label class="col-md-6 themed-grid-col"
>Apellidos del representante:
<input require
type="text"
name="Datos_familiares_Reprecentante_Apellidos"
class="form-control m-1"
/>
</label>
<label class="col-md-6 themed-grid-col"
>nombres del representante:
<input require
type="text"
name="Datos_familiares_Reprecentante_Nombres"
class="form-control m-1"
/>
</label>
<label class="col-md-4 themed-grid-col"
>C.I:
<input require
type="text"
name="Datos_familiares_Reprecentante_Cedula"
class="form-control m-1"
/>
</label>

<label class="col-md-3 themed-grid-col"
>fecha de nacimiento
<input require
type="date"
name="Datos_familiares_Reprecentante_Fecha_Nacimiento"
class="form-control m-1"
/>
</label>

<label class="col-md-4 themed-grid-col"
>nacionalidad
<select
name="Datos_familiares_Reprecentante_Nacionalidad"
class="form-control m-1"
>
<?php ?>
</select>
</label>

<label class="col-md-4 themed-grid-col"
>nivel de instruccion:

<select
name="Datos_familiares_Reprecentante_Nivel_Instruccion"
class="form-control m-1"
>
<?php ?>
</select>
</label>

<label class="col-md-4 themed-grid-col"
>ocupación
<input require
type="text"
name="Datos_familiares_Reprecentante_Ocpacion"
class="form-control m-1"
/>
</label>
<label class="col-md-4 themed-grid-col"
>teléfono
<input require
type="number"
name="Datos_familiares_Reprecentante_Telefono"
class="form-control m-1"
/>
</label>

<h4 class="text-primary"
hx-get="/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php?estado"
id="fo"
hx-target="#parroquia1"
hx-trigger="click"
  >direccion de habitación</h4>

<label class="col-md-4 themed-grid-col">parroquia
<select
id="parroquia1"
hx-get="/Codigo_php/Modulos/Gestion_Inscripcion_Estudiante.php"
name="parroquia"
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
name="calle"
id="calle1"

class="form-control m-1"
>
<?php ?>
</select>
</label>

<h4 class="text-primary"

  >direccion de trabajo</h4>

<label class="col-md-4 themed-grid-col"
>calle
<select
name="Datos_familiares_Direccion_Trabajo_Reprecentante_Calle"
class="form-control m-1"
>

</select>
</label>

<label class="col-md-4 themed-grid-col"
>sector
<select
name="Datos_familiares_Direccion_Trabajo_Reprecentante_Sector"
class="form-control m-1"
>

</select>
</label>

<label class="col-md-4 themed-grid-col"
>parroquia
<select
name="Datos_familiares_Direccion_Trabajo_Reprecentante_Parroquia"
class="form-control m-1"
>

</select>
</label>

<h4 class="text-primary">datos medicos</h4>

<label class="col-md-4 themed-grid-col"
>condicion medica
<select
name="Datos_familiares_Reprecentante_Condicion_Medica"
class="form-control m-1"
>

</select>
</label>

<label class="col-md-4 themed-grid-col"
>discapacidad
<select
name="Datos_familiares_Reprecentante_Discapacidad"
class="form-control m-1"
>

</select>
</label>
<button type="submit" class="btn btn-primary">
  registrar 
</button>

</form>