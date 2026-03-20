<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'discapacidad';
  public $campos = [
    'id_discapacidad' => '',
    'nombre_discapacidad' => ''    
  ];
};