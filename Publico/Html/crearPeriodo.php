<h2 class="text-center">
    crear periodo
</h2>

<form 
hx-post="/Codigo_php/Modulos/Gestion_plantel.php"
hx-trigger="submit"
hx-target="#periodos_escolares" 
>
     <label for="">
        inicio del periodo
        <input type="date" name="inicio_periodo" class="form-control">
     </label>

     <label for="">
        fin del periodo
        <input type="date" name="fin_periodo" class="form-control">
     </label>

    <button type="button" class="btn btn-primary">crear periodo</button>
</form>
<div 
hx-post="/Codigo_php/Modulos/Gestion_plantel.php"
hx-trigger="load"
hx-target="#periodos_escolares"
class="container" id="periodos_escolares">

</div>
