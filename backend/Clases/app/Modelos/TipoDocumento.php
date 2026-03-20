<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'tipo_documento';
  public $campos = [
      'id_tipo_documento' => '',
    'nombre_documento' => ''    
  ];
};