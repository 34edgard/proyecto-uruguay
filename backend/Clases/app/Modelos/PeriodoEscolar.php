<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'periodo_escolar';
  public $campos = [
    'id_periodo_escolar' => '',
    'periodo' => ''    
  ];
};