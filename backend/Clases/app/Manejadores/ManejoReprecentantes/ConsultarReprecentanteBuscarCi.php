<?php
use Liki\Database\FlowDB;
use Liki\Plantillas\Flow;
use App\Controladores\Personas\Reprecentante;



return new class {
  public static function run($p) {
    extract($p);
 $r = FlowDB::conf(Reprecentante::class)->campos(['cedula'])->get(
        ['cedula'=>['LIKE',$buscar_ci.'%']
    ]);

    
      foreach ($r as $key => $dato) {
        Flow::html("componentes/option",[
            "value"=>$dato['cedula'],
            "contenido"=>$dato['cedula']
        ]);
      }
  }
};