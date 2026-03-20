<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'tallas';
  public $campos = [
      'id_talla' => '',
    'ci_escolar' => '',
    'id_prenda' => '',
    'talla' => ''    
  ];
};