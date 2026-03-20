<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'condicion_medica_estudiante';
  public $campos = [
    'ci_escolar' => '',
    'id_condicion_medica' => ''
  ];
};