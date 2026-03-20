<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'tipo_procedencia';
  public $campos = [
      'id_tipo_procedencia' => '',
    'nombre_procedencia' => ''    
  ];
};