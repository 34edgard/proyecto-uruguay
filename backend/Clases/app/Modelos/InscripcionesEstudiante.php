<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'inscripciones_estudiante';
  public $campos = [
      'ci_escolar' => '',
    'id_inscripcion' => ''    
  ];
};