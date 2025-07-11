<h2 class="text-center">
    crear nivel
</h2>

<form 
hx-get="/plantel/nivel/crear"
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
hx-get="/plantel/nivele?id_nivel"
hx-trigger="load"
hx-target="#nivel"
class="container" id="nivel">

</div>
