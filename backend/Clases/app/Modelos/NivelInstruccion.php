<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'nivel_instruccion';
  public $campos = [
      'id_nivel_instruccion' => '',
    'nombre_nivel_instruccion' => ''    
  ];
};