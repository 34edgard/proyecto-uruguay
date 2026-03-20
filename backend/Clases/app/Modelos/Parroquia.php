<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'parroquia';
  public $campos = [
      'id_parroquia' => '',
    'id_municipio' => '',
    'nombre_parroquia' => ''    
  ];
};
