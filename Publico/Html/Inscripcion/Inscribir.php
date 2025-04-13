<div class="container">
    <h2 class="text-primary text-center">
        Inscriba  al niño
    </h2>
   
<form
hx-get="/Codigo_php/Modulos/Gestion_plantel.php"
hx-trigger="submit"
hx-target="#InicioInscripcion"
>

<label

hx-get="/Codigo_php/Modulos/Gestion_plantel.php?id_aula"
hx-trigger="load"
hx-target="#aula"
>

aula
<select name="aula"
id="aula"
class="form-control m-2"
>

</select>
</label>


<label
  hx-get="/Codigo_php/Modulos/Gestion_plantel.php?periodo_escolar"
hx-trigger="load"
hx-target="#periodo_escolar"
>

periodo escolar
<select name="periodo_escolar" 
id="periodo_escolar"
class="form-control m-2"
>

</select>
</label>

<button type="submit"
class="btn btn-primary m-2"
>
Inscribir
</button>
</form>



</div>
