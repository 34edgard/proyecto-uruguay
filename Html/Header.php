


  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-4 mb-2 mb-md-0 text-dark text-decoration-none">
   <img src="<?php if($op > 0){
          echo ".";
        }
        ?>./Img/Logo.jpg" style="width:80px; height:80px" class=" rounded-circle bi me-2 m-3" style="border:1px solid black;">
        	        <?php
        Enunciado($op);
        ?>
      </a>
          <?php
          if(isset($_SESSION['nombre'])){
	?>
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
      </ul>

      <div class="col-md-3 text-end">
        <a href="../Paginas/pag_9.php" class="btn btn-outline-primary me-2">ajustes</a>
        <button type="button" class="btn btn-primary" id="cerrarSesion">cerrarSesion</button>
        <script src="../Codigo_js/Funciones/Cerrar_Sesion.js"></script>
	<?php   } ?>


      </div>
    </header>
  </div>


<main class="mb-5 row">
	<div class="col-md-10 themed-grid-col">
