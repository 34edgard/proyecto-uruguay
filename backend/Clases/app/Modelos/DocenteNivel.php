<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'docente_nivel';
  public $campos = [
    'id_docente' => '',
    'id_nivel' => ''    
  ];
};