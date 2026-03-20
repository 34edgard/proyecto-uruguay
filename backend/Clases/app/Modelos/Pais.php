<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'pais';
  public $campos = [
      'id_pais' => '',
    'nombre_pais' => ''    
  ];
};