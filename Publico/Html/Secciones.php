<h2 class="text-center">
    crear seccion
</h2>

<form 
hx-post="/Codigo_php/Modulos/Gestion_plantel.php"
hx-trigger="submit"
hx-target="#secciones" 
>
     <label for="">
        nombre de la seccion
        <input type="text" name="nombre_seccion" class="form-control">
     </label>

     <label for=""
hx-get="/Codigo_php/Modulos/Gestion_plantel.php?id_niveles"
hx-trigger="load"
hx-target="#niveles"
>
        nivel de la seccion
        <select name="id_nivel" class="form-control" id="niveles">


        </select>
     </label>

    <button type="submit" class="btn btn-primary">crear periodo</button>
</form>
<hr>
<div class="container">
<h2>
tabla de 
secciones 
</h2>
</div>
<div 
hx-get="/Codigo_php/Modulos/Gestion_plantel.php?id_secciones"
hx-trigger="load"
hx-target="#secciones"
class="container" id="secciones">

</div>
