


  
    <header class="d-flex flex-wrap align-items-center bg-primary
    justify-content-center justify-content-md-between py-3 mb-4 border-bottom  px-1">
      <a href="/" class="d-flex align-items-center col-md-4 mb-2 mb-md-0 text-white  text-decoration-none">
   <img src="<?php if($op > 0){
          echo ".";
        }
        ?>./Img/Logo.jpg" style="width:80px; height:80px" class=" rounded-circle bi me-2 m-3" style="border:1px solid black;">
        	    <h2>    <?php
        Enunciado($op);
        ?></h2>
      </a>
          <?php
          if(isset($_SESSION['nombre'])){
	?>
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="/Paginas/pag_1.php" class="nav-link px-2 btn btn-outline-white link-secondary">inicio</a></li>
        <li><a href="/Paginas/pag_2.php" class="nav-link px-2 btn btn-outline-white ">inscripciones</a></li>
        <li><a href="/Paginas/pag_3.php" class="nav-link btn btn-outline-white px-2 ">Docentes</a></li>
        <li><a href="/Paginas/pag_4.php" class="nav-link btn btn-outline-white px-2 ">reportes</a></li>
        <li><a href="/Paginas/pag_5.php" class="nav-link btn btn-outline-white px-2 ">Aulas</a></li>
      </ul>

      <div class="col-md-3 text-end">
        <a href="/Paginas/pag_6.php" class="btn btn-outline-white me-2">cambiar contraseña</a>
        <button type="button" class="btn btn-primary" id="cerrarSesion">cerrarSesion</button>
        <script src="../Codigo_js/Funciones/Cerrar_Sesion.js"></script>
	<?php   } ?>


      </div>
    </header>
  


<main class="mb-5 row">
	<div class="col-md-10 themed-grid-col">
