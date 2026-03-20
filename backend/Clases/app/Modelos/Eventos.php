<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'eventos';
  public $campos = [
      'id_evento' => '',
      'nombre_evento' => '',
    'fecha_evento' => '',
    'descripcion' => ''    
  ];
};

