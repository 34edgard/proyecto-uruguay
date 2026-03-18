<?php
use App\Controladores\Plantel\Secciones;
use App\Controladores\Plantel\Niveles;
use Liki\Database\FlowDB;

return new class {
  public static function run($p,$f) {
    extract($p);
    FlowDB::conf('Secciones')
  ->campos(['id_nivel','nombre_seccion'])
  ->post([$id_nivel,$nombre_seccion]);
    $f[0]();
  }
};