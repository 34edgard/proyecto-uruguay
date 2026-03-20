<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'pagos';
  public $campos = [
      'id_pago' => '',
    'ci_escolar' => '',
    'id_concepto_pago' => '',
    'monto' => '',
    'fecha_pago' => '',
    'estado' => ''    
  ];
};