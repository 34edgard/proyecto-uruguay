<form class="d-flex container  "
action="/docente/ci/imprimir"
>
          <input
          hx-get="/docente/ci"
          hx-trigger="input"
          hx-target="#tablaDeDocentes"
          name="ci"
          class="form-control me-2 w-50" type="number" placeholder="Search" aria-label="Search">
        <button type="submit" class="btn btn-success">imprimir</button>
        </form>
        <div class="table-responsive container">
          
<table class="table my-auto  "
hx-get="/docente"
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
      <td>aula asignada</td>
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

