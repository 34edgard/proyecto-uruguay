<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'direccion';
  public $campos = [
    'id_direccion' => '',
     'id_ubicacion' => '',
    'tipo_direccion' => ''    
  ];
};