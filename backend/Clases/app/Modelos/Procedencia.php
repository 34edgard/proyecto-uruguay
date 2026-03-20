<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'procedencia';
  public $campos = [
      'id_procedencia' => '',
    'id_tipo_procedencia' => '',
    'nombre_procedencia' => ''    
  ];
};