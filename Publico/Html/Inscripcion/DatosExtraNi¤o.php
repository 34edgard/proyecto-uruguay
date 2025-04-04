<form
hx-post="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="submit"
hx-target="#InicioInscripcion"
  >
  

<label class="control-label m-1 p-1 ">
  Talla de camisa
  <input require
  type="text"
  name="Datos_Niño_Talla_Camisa"
  class="form-control m-1"
  id="Talla_camisa"
  />
</label>
<label class="control-label m-1 p-1 ">
pantalón
<input require
type="text"
name="Datos_Niño_Talla_PadrendaPantalon"
class="form-control m-1"
id="pantalon"
/>
</label>
<label class="control-label m-1 p-1 ">
zapato
<input require
type="text"
name="Datos_Niño_Talla_Zapato"
id="zapato"
class="form-control m-1"
/>
</label>

<label class="control-label m-1 p-1 ">
peso

<input require
type="text"
name="Datos_Niño_Talla_Peso"
class="form-control m-1"
id="peso"
/>
</label>

<label class="control-label m-1 p-1 ">
talla
<input require
type="text"
name="Datos_Niño_Talla"
class="form-control m-1"
id="talla"
/>
</label>

<label class="control-label m-1 p-1 ">
circunferencia braquial

<input require
type="text"
name="Datos_Niño_Talla_Circunferencia_Braquial"
class="form-control m-1"
id="cb"
/>
</label>


<button
type="submit"
class="btn btn-primary"
  >guardar</button>
</form>