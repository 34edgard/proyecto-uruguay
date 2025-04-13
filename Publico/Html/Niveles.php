<h2 class="text-center">
    crear nivel
</h2>

<form 
hx-get="/Codigo_php/Modulos/Gestion_plantel.php"
hx-trigger="submit"
hx-target="#nivel" 
>
     

     <label for="">
        nombre del nivel
        <input type="text" name="nombre_nivel" class="form-control">
     </label>

    <button type="submit" class="btn btn-primary">crear nivel</button>
</form>
<hr>
<div class="container">
<h2>
tabla de 
niveles 
</h2>
</div>
<div 
hx-get="/Codigo_php/Modulos/Gestion_plantel.php?id_nivel"
hx-trigger="load"
hx-target="#nivel"
class="container" id="nivel">

</div>
