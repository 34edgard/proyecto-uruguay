<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'condicion_medica';
  public $campos = [
    'id_condicion_medica' => '',
    'nombre_condicion_medica' => ''    
  ];
};