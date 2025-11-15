<?php


use Liki\Plantillas\Plantilla;
use App\Personas\Docente;
use App\DatosExtra\Telefono;



 return new class {
  public static function run($p){
   //formularioEdicion

extract($p);

   $datos = (new Docente)->consultar([
     "campos"=>['cedula','nombres','apellidos','id_docente','fecha_nacimiento'],
     "where"=>[
     [  "campo"=>'cedula',"operador"=>'=',"valor"=>$formularioEdicion]
     ]
     ])[0];
   $datosTel = (new Telefono)->consultar([
     "campos"=>['id_docente','tipo_telefono','numero_telefono'],
     "where"=>[
       ["campo"=>'id_docente',"operador"=>'=',"valor"=>$datos['id_docente']]
     ]
    
     ])[0];
  //   print_r($datosTel);
     $datos['telefono'] = $datosTel['numero_telefono'];
     $datos['tipo_telefono'] = $datosTel['tipo_telefono'];
   //  print_r($datos);
    Plantilla::HTML('Docente/FormularioEdicion',$datos);
  }
};
