<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'estado';
  public $campos = [
    'id_estado' => '',
    'id_pais' => '',
    'nombre_estado' => ''    
  ];
};