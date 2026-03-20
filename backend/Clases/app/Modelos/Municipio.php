<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'municipio';
  public $campos = [
      'id_municipio' => '',
     'id_estado' => '',
    'nombre_municipio' => ''    
  ];
};