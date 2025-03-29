<form class="d-flex container  ">
          <input
          hx-get="/Codigo_php/Modulos/Gestionar_Docente.php"
          hx-trigger="input"
          hx-target="#tablaDeDocentes"
          name="ci"
          class="form-control me-2 w-50" type="number" placeholder="Search" aria-label="Search">
          <button class="btn btn-success" type="submit">Search</button>
        </form>
        <div class="table-responsive container">
          
<table class="table my-auto  "
hx-get="/Codigo_php/Modulos/Gestionar_Docente.php"
hx-trigger="load"
hx-target="#tablaDeDocentes"
  >
  <thead>
    <tr>
      <td>#</td>
      <td>Cedula</td>
      <td>Nombres</td>
      <td>Apellidos</td>
      <td>Fecha de nacimiento</td>
      <td>Edad</td>
      
    
     <!-- <td>aula</td>-->
      <td>telefono</td>
      <td  ></td>
      <td  ></td>
    </tr>
  </thead>
  <tbody class="
  
  " id="tablaDeDocentes">

  </tbody>
</table>
        </div>
<div id="mesajesDelServidor"></div>
</div>

<div class="modal fade" id="firefoxModal" tabindex="-1" aria-labelledby="firefoxModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-body " id="modal-form">



      </div>

    </div>
  </div>
</div>


<!--<script src="/Codigo_js/Funciones/consultarDocentes.js"></script>
-->