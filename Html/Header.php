<header class="d-flex flex-wrap align-items-center bg-primary
  justify-content-center justify-content-md-between py-3 mb-4 border-bottom  px-1">
  <a href="/" class="d-flex align-items-center col-md-4 mb-2 mb-md-0 text-white  text-decoration-none">
    <img src="/Img/Logo.jpg" style="width:80px; height:80px" class=" rounded-circle bi me-2 m-3" style="border:1px solid black;">
    <h2 id="titulo"
    >    <?php
  if (isset($_SESSION['nombre']))     Enunciado($op);
      ?></h2>
  </a>
  
  <?php
  
  if (!isset($_SESSION['nombre'])) { echo "<div class='col-4 col-md-auto mb-2  '><div class='text-white h1'>";
  Enunciado($op);
  echo "</div></div>";
  }
  if (isset($_SESSION['nombre'])) {
    ?>
    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
      <li ><a href="/Paginas/pag_1.php" class="nav-link px-2 link-white">inicio</a>
      </li >
      <li >
        
        
<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    inscripciones
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#"
    hx-post="/Html/Inscripcion/RegistrarDatos.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click"
    onclick="cambiarTitulo('inscribir')"
    >inscribir</a></li>
 
    <li><a class="dropdown-item" href="#"
        hx-post="/Html/Inscripcion/Promovidos.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click"
    
    onclick="cambiarTitulo('promovidos')"
    >promovidos</a></li>
    
    
  </ul>
</div>

        
       
      </li >
      <li >
        
               
<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    Docentes
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#"
    onclick="cambiarTitulo('registrar')"
    hx-post="/Html/Docente/Registrar.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click"
    >registrar</a></li>
    <li><a class="dropdown-item"
    onclick="cambiarTitulo('Reportes')"
    hx-post="/Html/Docente/Consultar.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click">reportes</a></li>

   
  </ul>
</div>

        
        
        
        
       
      </li >
      <li >
        
<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    reportes
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#" onclick="cambiarTitulo('Matricula')"
    hx-post="/Html/Reportes/Matricula.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click"
    >Matrícula </a></li>
    <li><a class="dropdown-item" href="#" onclick="cambiarTitulo('Planilla')"
   hx-post="/Html/Reportes/Planilla.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click" 
    >planilla</a></li>
    <li><a class="dropdown-item" href="#" onclick="cambiarTitulo('Diploma')"  hx-post="/Html/Reportes/Diploma.php" hx-target="#main" hx-swap="innerHTML"     hx-trigger="click" >Diploma</a></li>
    <li><a class="dropdown-item" href="#" onclick="cambiarTitulo('Estadistica')"  hx-post="/Html/Reportes/Estadisticas.php" hx-target="#main" hx-swap="innerHTML"     hx-trigger="click" >Estadistica</a></li>
   
  </ul>
</div>

        </li>
      
      <li class=""><a href="/Paginas/pag_5.php" class="nav-link link-white px-2 ">Aulas</a>
      </li>
    </ul>

    <div class="col-md-2 text-end">
      <a href="/Paginas/pag_6.php" class="btn btn-warning me-2">Administrar</a>
      <button type="button" class="btn btn-danger" id="cerrarSesion">Cerrar Sesion</button>
      <script src="/Codigo_js/Funciones/Cerrar_Sesion.js"></script>
      <script src="../Codigo_js/Funciones/CambiarTitulo.js"></script>
      <?php
    } ?>


  </div>
</header>
<main id="main">