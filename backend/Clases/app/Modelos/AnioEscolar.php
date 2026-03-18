<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'anio_escolar';
  public $campos = [
    'id_anio_escolar' => '',
    'anio' => '',
    'id_periodo_escolar' => '',
    'id_aula' => '',
  'ci_escolar' => '' 
  ];
};