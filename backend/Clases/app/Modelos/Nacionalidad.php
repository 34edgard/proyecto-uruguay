<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'nacionalidad';
  public $campos = [
      'id_nacionalidad' => '',
    'nombre_nacionalidad' => ''    
  ];
};