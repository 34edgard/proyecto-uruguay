<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'tipo_nivel';
  public $campos = [
    'id_tipo_nivel' => '',
    'nombre_nivel' => ''    
  ];
};