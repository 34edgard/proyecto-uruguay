<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'conceptos_pago';
  public $campos = [
    'id_concepto_pago' => '',
    'nombre_concepto' => ''    
  ];
};