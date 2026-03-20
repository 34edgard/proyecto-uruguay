<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'sector';
  public $campos = [
      'id_sector' => '',
    'id_parroquia' => '',
    'nombre_sector' => ''    
  ];
};