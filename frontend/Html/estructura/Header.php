<?php

$titulo =  Enunciado($op) ?? "";

// $op should be set before calling Enunciado() if it's used for the initial title
// For demonstration, let's assume $op is 'login' if not logged in


?>

<header class="d-flex flex-wrap align-items-center bg-primary justify-content-center justify-content-md-between py-3 mb-4 border-bottom px-3">
    <a href="/" class=" row   col-md-2 mb-2 mb-md-0 text-white text-decoration-none ">
        <img src="/frontend/Img/Logo.png" style="width:100px; height:80px" class="rounded-circle bi  ">
        <h3 class="col" id="titulo">
            <?= htmlspecialchars($titulo) ?>
        </h3>
        <div class="col" id='parrafo'></div>
    </a>

    <?php if (isset($_SESSION["nombres"])): ?>
       
        <?php plantilla('componentes/navs'); ?>
    <?php endif; ?>

</header>

<?php plantilla('componentes/modo-oscuro'); // Assuming this component exists ?>

<main id="main" class="container">
  
