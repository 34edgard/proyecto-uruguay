<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'discapacidad_estudiante';
  public $campos = [
    'ci_escolar' => '',
    'id_discapacidad' => ''    
  ];
};