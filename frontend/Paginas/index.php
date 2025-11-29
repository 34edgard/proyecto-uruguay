<?php
use Liki\Plantillas\Plantilla;
use Liki\Config\ConfigManager;



$config = ConfigManager::cargarConfig('Index');


Plantilla::HTML('estructura/pagina',$config);

