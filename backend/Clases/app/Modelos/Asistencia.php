<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'asistencia';
  public $campos = [
    'id_asistencia' => '',
    'ci_escolar' => '',
    'fecha' => '',
    'asistio' => '',
    'observaciones' => ''    
  ];
};