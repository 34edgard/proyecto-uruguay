<h2 class="text-center">
     Aulas
</h2>

<form 
hx-post="/plantel/aula/crear"
hx-trigger="submit"
hx-target="#Aulas" 
>
      <label for="">
        nombre del aula
        <input type="text" name="nombre_aula" class="form-control">
     </label>

     <label for=""
hx-get="/plantel/seccion?id_seccion"
hx-trigger="load"
hx-target="#secciones"
  >
        seccion del aula
        <select name="id_seccion" class="form-control" id="secciones">


        </select>
     </label>



    <button type="submit" class="btn btn-primary">crear aula</button>
</form>
<div 
hx-get="/plantel/aula?id_aula"
hx-trigger="load"
hx-target="#Aulas"
class="container" id="Aulas">

</div>
