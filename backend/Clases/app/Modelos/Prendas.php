<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'prendas';
  public $campos = [
      'id_prenda' => '',
    'nombre_prenda' => ''    
  ];
};
