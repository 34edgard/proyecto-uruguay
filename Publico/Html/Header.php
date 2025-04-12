<?php 
$titulo = isset($_SESSION['nombre'])   ? Enunciado($op) : ''; 
//echo "ti ".$titulo;
?>

<header class="d-flex flex-wrap align-items-center bg-primary
  justify-content-center justify-content-md-between py-3 mb-4 border-bottom  px-1">
  <a href="/" class="d-flex align-items-center col-md-4 mb-2 mb-md-0 text-white  text-decoration-none">
    <img src="/Publico/Img/Logo.jpg" style="width:80px; height:80px" class=" rounded-circle bi me-2 m-3" style="border:1px solid black;">
    <h2 id="titulo" >   
    <?= $titulo ?>
      </h2>
  </a>
<?php if(!isset($_SESSION['nombre'])): ?>
<h1 class="text-white text-center">
<?= Enunciado($op) ?>
</h1>
  <div class='col-2 col-md-auto mb-2   '><div class='text-white h1'>
  </div></div>
 <?php else: ?>
    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
      <li ><a href="/Publico/Paginas/pag_1.php" class="nav-link px-2 link-white">Inicio</a>
      </li >
      <li >
<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    Inscripciones
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#"
    hx-post="/Publico/Html/Inscripcion/InicioInscripcion.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click"
    onclick="cambiarTitulo('Nuevo Ingreso')"
    >Nuevo Ingreso</a></li>
    <li><a class="dropdown-item" href="#"
        hx-post="/Publico/Html/EnConstruccion.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click"
    onclick="cambiarTitulo('Promovidos')"
    >Promovidos</a></li>
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
    onclick="cambiarTitulo('Registrar')"
    hx-post="/Publico/Html/Docente/Registrar.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click"
    >Registrar</a></li>
    <li><a class="dropdown-item"
    onclick="cambiarTitulo('Consultar')"
    hx-post="/Publico/Html/Docente/Consultar.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click">Consultar</a></li>

   
  </ul>
</div>
      </li >
      <li >
        
<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    Reportes
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#" onclick="cambiarTitulo('Matricula')"
    hx-post="/Publico/Html/EnConstruccion.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click"
    >Matrícula </a></li>
    <li><a class="dropdown-item" href="#" onclick="cambiarTitulo('Planilla')"
   hx-post="/Publico/Html/EnConstruccion.php" hx-target="#main" hx-swap="innerHTML"
     hx-trigger="click" 
    >Planilla</a></li>
    <li><a class="dropdown-item" href="#" onclick="cambiarTitulo('Diploma')"  hx-post="/Publico/Html/EnConstruccion.php" hx-target="#main" hx-swap="innerHTML"     hx-trigger="click" >Diploma</a></li>
    <li><a class="dropdown-item" href="#" onclick="cambiarTitulo('Estadistica')"  hx-post="/Publico/Html/EnConstruccion.php" hx-target="#main" hx-swap="innerHTML"     hx-trigger="click" >Estadistica</a></li>
   
  </ul>
</div>
        </li>
      <li class="">
        
      
      
      
      
             
<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" 
          type="button" data-bs-toggle="dropdown" 
          aria-expanded="false">
    Gestion del Plantel
  </button>
  <ul class="dropdown-menu">
    <li> <a 
            hx-post="/Publico/Html/EnConstruccion.php"
            hx-target="#main" hx-swap="innerHTML"   
            hx-trigger="click"
            onclick="cambiarTitulo('Aulas')"
            class="nav-link link-white px-2 "
          >Aulas</a></li>
      <li>
      <div class="dropdown">
  <button 
                class="btn btn-primary dropdown-toggle"
                type="button" data-bs-toggle="dropdown" 
                aria-expanded="false">
        Periodo Escolar
  </button>
  <ul class="dropdown-menu">
    <li> 
                  <a  hx-post="/Publico/Html/crearPeriodo.php" 
                    hx-target="#main" hx-swap="innerHTML"     
                    hx-trigger="click"
      onclick="cambiarTitulo('Aulas')"
      class="nav-link link-white px-2 ">crear</a>

                </li>
      <li>
                  <a hx-post="/Publico/Html/AñoEscolar.php"
                    hx-target="#main" hx-swap="innerHTML"  
                    hx-trigger="click"
      onclick="cambiarTitulo('consultar periodo escolar')"
      class="nav-link link-white px-2 ">
                    consultar
                  </a>

                </li>
  </ul>
</div>
     </li>
  </ul>
</div>
      
      
      
      
      
      
     
      </li>
     
    </ul>
    <div class="col-md-2 text-end">
      <a href="/Publico/Paginas/pag_6.php" class="btn btn-warning m-2">Administrar</a>
      <button type="button" class="btn btn-danger" id="cerrarSesion">Cerrar Sesion</button>
      <script src="/Codigo_js/Funciones/Cerrar_Sesion.js"></script>
      <script src="/Codigo_js/Funciones/CambiarTitulo.js"></script>
      <?php endif; ?>
  </div>
</header>
<main id="main">
