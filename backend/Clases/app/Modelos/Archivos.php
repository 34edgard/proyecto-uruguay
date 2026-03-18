<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'archivos';
  public $campos = [
    'id_archivo' => '',
    'ci_escolar' => '',
    'nombre_archivo' => '',
    'ruta_archivo' => '',
    'tipo_archivo' => ''    
  ];
};