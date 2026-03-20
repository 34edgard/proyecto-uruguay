<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'anio_escolar_estudiante';
  public $campos = [
    'ci_escolar' => '',
    'id_anio_escolar' => ''    
  ];
};