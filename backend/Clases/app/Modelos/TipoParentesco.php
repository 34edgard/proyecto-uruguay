<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'tipo_parentesco';
  public $campos = [
      'id_tipo_parentesco' => '',
    'nombre' => ''    
  ];
};