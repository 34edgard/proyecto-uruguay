
<div class=" px-0">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-0 border-bottom bg-primary text-white">
      <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
      
        <img src="<?php if($op > 0){
          echo ".";
        }
        ?>./Img/Logo.jpg" style="width:80px; height:80px" class=" rounded-circle bi me-2 m-3" style="border:1px solid black;">
        <span class="fs-5"> <h3 >dearroyo de un sistema de gestion escolar</h3></span>
      </a>
      <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <h5>
                <svg class="bi" width="1em" height="1em"><use xlink:href="#chevron-right"/></svg>
          <?php
          if(isset($_SESSION['usuario'])){
	
          echo $_SESSION['usuario'];
          }
          ?>
        </h5>
      </a>
    </header>
  </div>



<main class="mb-5 row">
	<div class="col-md-10 themed-grid-col">
