<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'estado_nutricional';
  public $campos = [
    'id_estado_nutricional' => '',
    'nombre_estado_nutricional' => ''    
  ];
};
