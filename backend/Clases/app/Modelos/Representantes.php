<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'representantes';
  public $campos = [
      'id_representante' => '',
    'cedula' => '',
    'nombres' => '',
    'apellidos' => '',
    'fecha_nacimiento' => '',
    'edad' => '',
    'id_nacionalidad' => '',
    'id_nivel_instruccion' => '',
    'id_ocupacion' => '',
    'id_direccion_habitacion' => '',
    'id_direccion_trabajo' => ''    
  ];
};