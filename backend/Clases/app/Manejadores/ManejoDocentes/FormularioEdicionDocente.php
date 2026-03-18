<?php


use Liki\Plantillas\Flow;
use Liki\Database\FlowDB;
use App\Controladores\Personas\Docente;
use App\Controladores\DatosExtra\Telefono;



 return new class {
  public static function run($p){
   //formularioEdicion

extract($p);

   $datos = FlowDB::conf('Docente')
->campos(['cedula','nombres','apellidos','id_docente','fecha_nacimiento'])
->get(['cedula'=>$formularioEdicion])[0];

   $datosTel = FlowDB::conf('Telefono')
->campos(['id_docente','tipo_telefono','numero_telefono'])
     ->get(['id_docente'=>$datos['id_docente']])[0];
  //   print_r($datosTel);
     $datos['telefono'] = $datosTel['numero_telefono'];
     $datos['tipo_telefono'] = $datosTel['tipo_telefono'];
   //  print_r($datos);
    Flow::html('Docente/FormularioEdicion',$datos);
  }
};
