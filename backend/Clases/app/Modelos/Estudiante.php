<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'estudiante';
  public $campos = [
    'ci_escolar' => '',
    'nombres' => '',
    'apellidos' => '',
    'fecha_nacimiento' => '',
    'id_lugar_nacimiento' => '',
    'id_nacionalidad' => '',
    'edad_ano' => '',
    'edad_meses' => '',
    'sexo' => '',
    'id_ubicacion' => '',
    'id_procedencia' => '',
    'id_condicion_medica' => '',
    'id_discapacidad' => '',
    'id_estado_nutricional' => ''    
  ];
};