<form
hx-post="/Codigo_php/Modulos/Gestion_Info_Estudiante_Reprecentante.php"
hx-trigger="submit"
hx-target="#InicioInscripcion"
  > 
  <h2 class="text-center">
    Prendas
  </h2>

<label class="control-label m-1 p-1 ">
  Talla de camisa
  <input require
  type="text"
  name="talla_camisa"
  class="form-control m-1"
  id="talla_camisa"
  />
</label>
<label class="control-label m-1 p-1 ">
pantalón
<input require
type="text"
name="talla_pantalon"
class="form-control m-1"
id="pantalon"
/>
</label>
<label class="control-label m-1 p-1 ">
zapato
<input require
type="text"
name="talla_zapato"
id="zapato"
class="form-control m-1"
/>
</label>

<label class="control-label m-1 p-1 ">
peso

<input require
type="text"
name="peso"
class="form-control m-1"
id="peso"
/>
</label>



<label class="control-label m-1 p-1 ">
circunferencia braquial

<input require
type="text"
name="circunferencia_braquial"
class="form-control m-1"
id="cb"
/>
</label>


<h3 class="text-primary text-center">
  Documentos Presentados
</h3>

<h5 class="text-center">

1
Partida de nacimiento
</h5>
<label for="">

entregado
<input type="checkbox" name="partida_nacimiento" 
value="entregado"
>
</label>

<label for="">

pendiente
<input type="checkbox" name="partida_nacimiento" 
value="pendiente"
>
</label>
<br>

<h5>
  2
copia de la cedula de la madre
</h5>


<label for="">
entregado
<input type="checkbox" name="copia_cedula_madre" value="entregado">
</label>
<label for="">
pendiente
<input type="checkbox" name="copia_cedula_madre" value="pendiente">
</label>
<br>
<h5>
  3
copia de la cedula del padre
</h5>
<label for="">
  entregado
<input type="checkbox" name="copia_cedula_padre" value="entregado">
</label>
<label for="">
  pendiente
<input type="checkbox" name="copia_cedula_padre" value="pendiente">
</label>
<br>

<h5>
   4
4 fotos tipo carnet
</h5>

<label for="">
 entregado
<input type="checkbox" name="fotos_tipo_carnet" value="entragado">
</label>
<label for="">
 pendiente
<input type="checkbox" name="fotos_tipo_carnet" value="pendiente">
</label>
<br>

<h5>
   5
copia del certificado de vacuna
</h5>
<label for="">
 entragado
<input type="checkbox" name="copia_certificado_vacuna" value="entregado">
</label>
<label for="">
 pendiente
<input type="checkbox" name="copia_certificado_vacuna" value="pendiente">
</label>

<button
type="submit"
class="btn btn-primary"
name="cedula_escolar"
value="<?= $cedula_escolar  ?>"
  >guardar</button>
</form>