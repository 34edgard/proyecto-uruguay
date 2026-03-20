<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'salud_estudiante';
  public $campos = [
      'id_salud' => '',
    'ci_escolar' => '',  
    'alergias' => '',
    'medicamentos' => '',
    'observaciones' => ''    
  ];
};