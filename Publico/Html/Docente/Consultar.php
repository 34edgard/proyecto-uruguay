<form class="d-flex container  ">
          <input class="form-control me-2 w-50" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-success" type="submit">Search</button>
        </form>
<table class="table my-auto">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Cedula</th>
      <th scope="col">Nombres</th>
      <th scope="col">Apellidos</th>
      <th scope="col">Fecha de nacimiento</th>
      <th scope="col">Edad</th>
      
    
     <!-- <th scope="col">aula</th>-->
      <th scope="col">telefono</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody class="table-group-divider" id="tablaDeDocentes">

  </tbody>
</table>
<div id="mesajesDelServidor"></div>
</div>
<script src="/Codigo_js/Funciones/consultarDocentes.js"></script>