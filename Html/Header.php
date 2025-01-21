<header class="d-flex flex-wrap align-items-center bg-primary
  justify-content-center justify-content-md-between py-3 mb-4 border-bottom  px-1">
  <a href="/" class="d-flex align-items-center col-md-4 mb-2 mb-md-0 text-white  text-decoration-none">
    <img src="/Img/Logo.jpg" style="width:80px; height:80px" class=" rounded-circle bi me-2 m-3" style="border:1px solid black;">
    <h2>    <?php
  if (isset($_SESSION['nombre']))     Enunciado($op);
      ?></h2>
  </a>
  
  <?php
  
  if (!isset($_SESSION['nombre'])) { echo "<div class='col-6 col-md-auto mb-2  '><div class='text-white h1 w-75'>";
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
    <li><a class="dropdown-item" href="/Paginas/pag_2_p1.php">inscribir</a></li>
    <li><a class="dropdown-item" href="#">planillas de inscripción</a></li>
    <li><a class="dropdown-item" href="#">promovidos</a></li>
    <li><hr class="dropdown-divider"></li>
    
  </ul>
</div>

        
       
      </li >
      <li >
        
               
<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    Docentes
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="/Paginas/pag_3.php">registrar</a></li>
    <li><a class="dropdown-item"
    hx-post="/Html/Reportes.php" hx-target="#main" hx-swap="innerHTML"
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
    <li><a class="dropdown-item" href="/Paginas/pag_4.php">matrícula </a></li>
    <li><a class="dropdown-item" href="#">planilla</a></li>
    <li><a class="dropdown-item" href="#">diploma</a></li>
   
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
      <?php
    } ?>


  </div>
</header>
<main id="main">