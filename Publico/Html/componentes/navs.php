<?php
// This component handles the main navigation when logged in

$menu = 'componentes/menu-desplegable';
?>
<ul class="nav col-8 col-md-auto mb-2 justify-content-center mb-md-0 gap-3">
    <li>
        <a href="/inicio" class="nav-link px-2 text-white">Inicio</a>
    </li>
    <li>
        <?php
        plantilla($menu, [
            'title' => 'Inscripciones',
            'items' => [
                ['label' => 'Nuevo Ingreso', 'hx_post' => '/Publico/Html/Inscripcion/InicioInscripcion.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Nuevo Ingreso'],
                ['label' => 'Promovidos', 'hx_post' => '/Publico/Html/EnConstruccion.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Promovidos'],
                ['label' => 'Inscritos', 'hx_post' => '/Publico/Html/Inscripcion/Inscritos.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Inscritos'],
            ]
        ]);
        ?>
    </li>
    <li>
        <?php
        plantilla($menu, [
            'title' => 'Docentes',
            'items' => [
                ['label' => 'Registrar', 'hx_post' => '/Publico/Html/Docente/Registrar.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Registrar'],
                ['label' => 'Consultar', 'hx_get' => '/src?html=Docente/Consultar', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Consultar'],
            ]
        ]);
        ?>
    </li>
    <li>
        <?php
        plantilla($menu, [
            'title' => 'Reportes',
            'items' => [
                ['label' => 'Matrícula', 'hx_get' => '/src/EnConstruccion', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Matricula'],
                ['label' => 'Planilla', 'hx_post' => '/Publico/Html/EnConstruccion.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Planilla'],
                ['label' => 'Diploma', 'hx_post' => '/Publico/Html/EnConstruccion.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Diploma'],
                ['label' => 'Estadística', 'hx_post' => '/Publico/Html/EnConstruccion.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Estadistica'],
            ]
        ]);
        ?>
    </li>
    <li>
        <?php
        plantilla($menu, [
            'title' => 'Plantel',
            'items' => [
                ['label' => 'Niveles', 'hx_post' => '/Publico/Html/plantel/Niveles.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Niveles'],
                ['label' => 'Secciones', 'hx_post' => '/Publico/Html/plantel/Secciones.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Secciones'],
                ['label' => 'Aulas', 'hx_post' => '/Publico/Html/plantel/Aulas.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Aulas'],
                ['label' => 'Periodo Escolar', 'hx_post' => '/Publico/Html/plantel/crearPeriodo.php', 'hx_target' => '#main', 'hx_swap' => 'innerHTML', 'hx_trigger' => 'click', 'onclick_title' => 'Periodo Escolar'],
            ]
        ]);
        ?>
    </li>
    <li>
        <div class="dropdown">
            <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="Publico/Img/images.png" alt="mdo" width="32" height="32" class="rounded-circle border border-white">
            </a>
            <ul class="dropdown-menu text-small shadow dropdown-menu-end ">
                <li><a href="/Administrar" class="dropdown-item text-warning">Administrar</a></li>
                <li><hr class="dropdown-divider"></li>
                <li>
                    <a type="button" class="dropdown-item text-danger" id="cerrarSesion"
                       hx-get="/Cerrar_Sesion"
                       hx-trigger="click"
                       hx-target="#cerrarSecion"
                    >Cerrar Sesión</a>
                    <div id="cerrarSecion"></div>
                </li>
            </ul>
        </div>
    </li>
</ul>