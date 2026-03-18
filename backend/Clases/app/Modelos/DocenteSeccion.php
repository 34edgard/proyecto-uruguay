<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'docente_seccion';
  public $campos = [
    'id_docente' => '',
    'id_seccion' => ''    
  ];
};