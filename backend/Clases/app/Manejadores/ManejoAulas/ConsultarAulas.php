<?php
use Liki\Plantillas\Flow;
use App\Controladores\Plantel\Aulas;
use Liki\Database\FlowDB;

return new class {
  public static function run() {
 $periodos = FlowDB::conf('Aulas')
 ->campos(['id_aula','nombre_aula'])
 ->get();

   foreach ($periodos as $key => $dato) {
        Flow::html("componentes/option",[
            "value"=>$dato['id_aula'],
        "contenido"=>$dato['nombre_aula']
        ]);
      }
  }
};