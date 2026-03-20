<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'ocupacion';
  public $campos = [
      'id_ocupacion' => '',
    'nombre_ocupacion' => ''    
  ];
};