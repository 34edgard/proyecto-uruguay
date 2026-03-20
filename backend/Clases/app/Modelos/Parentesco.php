<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'parentesco';
  public $campos = [
      'id_tipo_parentesco' => '',
     'cedula' => '',
    'ci_escolar' => ''    
  ];
};