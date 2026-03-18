<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'niveles';
  public $campos = [
    'id_nivel' => '',
    'id_tipo_nivel' => ''    
  ];
};