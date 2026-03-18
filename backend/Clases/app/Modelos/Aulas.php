<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'aulas';
  public $campos = [
    'id_aula' => '',
    'nombre_aula' => '',
    'id_seccion' => ''    
  ];
};