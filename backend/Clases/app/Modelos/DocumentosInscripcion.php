<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'documentos_inscripcion';
  public $campos = [
    'id_documento' => '',
    'ci_escolar' => '',
    'id_tipo_documento' => '',
    'estado' => '',
    'observaciones' => ''    
  ];
};