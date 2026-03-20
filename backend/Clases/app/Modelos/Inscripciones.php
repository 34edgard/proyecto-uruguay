<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'inscripciones';
  public $campos = [
      'id_inscripcion' => '',
      'ci_escolar' => '',
    'fecha_inscripcion' => ''    
  ];
};