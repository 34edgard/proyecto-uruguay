<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'estado_nutricional_estudiante';
  public $campos = [
    'ci_escolar' => '',
    'id_estado_nutricional' => ''    
  ];
};