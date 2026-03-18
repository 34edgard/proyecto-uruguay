<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'docente_aula';
  public $campos = [
    'id_docente' => '',
  'id_aula' => '' 
  ];
};