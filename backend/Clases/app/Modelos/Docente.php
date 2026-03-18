<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'docente';
  public $campos = [
    'id_docente' => '',
  'cedula' => '' ,
'nombres'=>'',
'apellidos'=>'',
'fecha_nacimiento'=>'',
'estado'=>'',
  ];
};