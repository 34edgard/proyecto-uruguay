<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'telefonos';
  public $campos = [
    'id_telefono' => '',
     'ci_escolar' => '',
     'id_representante' => '',
     'id_docente' => '',
     'tipo_telefono' => '',
     'codigo_area' => '',
    'operadora' => '',
    'numero_telefono' => ''    
  ];
};