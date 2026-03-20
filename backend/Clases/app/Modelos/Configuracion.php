<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'configuracion';
  public $campos = [
    'id_configuracion' => '',
    'clave' => '',
    'valor' => ''
  ];
};