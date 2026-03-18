<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'secciones';
  public $campos = [
    'id_seccion' => '',
        'nombre_seccion' => '',
    'id_nivel' => ''    
  ];
};