<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'peso';
  public $campos = [
      'id_peso' => '',
    'ci_escolar' => '',
    'peso' => ''    
  ];
};