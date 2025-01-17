
<?php






?>

	
<div class="container-fluid">

      <h1><small>ajustes</small></h1>

      

      <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item" role="presentation">
          <button type="button" class="nav-link active" data-bs-toggle="tab" data-bs-target="#general" role="tab" aria-selected="true">docentes</button>
        </li>
        <li class="nav-item" role="presentation">
          <button type="button" class="nav-link" data-bs-toggle="tab" data-bs-target="#crear" role="tab"> registrar docente</button>
        </li>
        

      </ul>

      <div class="tab-content container-fluid" role="tablist">
    <div class="tab-pane" id="crear" role="tabpanel">
      
    <form method="post" action="Pag_5.php">
      <input type="text" placeholder="Nombre" name="nombre" class="form-control w-75" >
      <input type="text" placeholder="Apellidos" name="apellido" class="form-control w-75" >
      <input type="number" placeholder="cedula" name="ci" class="form-control w-75" >
      <input type="date" placeholder="fecha de nacimiento" name="f_nacimiento" class="form-control w-75" >
      
      
      <input type="tel" placeholder="telefono" name="numero_telefono" class="form-control w-75" >
    <!--  <select name="aula" class="form-control w-75">
        <option value="1">aula 1</option>
        <option value="2">aula 2</option>
        <option value="3">aula 3</option>
      </select>-->
    <button type="button" class="btn btn-primary" id="crearDocente" name="registrarDocente" value="crear">registrar</button>

    </form>
    <div id="mensaje"></div>
    <script src="../Codigo_js/Funciones/CrearDocente.js"></script>
</div>
        <div class="tab-pane table-responsive active" id="general" role="tabpanel">
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
      
    
      <th scope="col">aula</th>
      <th scope="col">telefono</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody class="table-group-divider" id="tablaDeDocentes">

  </tbody>
</table>
<div id="mesajesDelServidor"></div>
</div>
</div>

</div>


<!--<script src="../Codigo_js/Funciones_js/consultarDocentes.js"></script>
    <script src="../Codigo_js/Funciones_js/EditarDocente.js"></script>-->