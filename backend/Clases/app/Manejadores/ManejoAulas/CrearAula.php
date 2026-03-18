<?php
use App\Controladores\Plantel\Aulas;
use Liki\Database\FlowDB;

return new class {
  public static function run($p,$f) {
   extract($p);
    FlowDB::conf('Aulas')
    ->campos(['id_seccion','nombre_aula'])
    ->post([$id_seccion,$nombre_aula]);
   $f[0]();
  }
};