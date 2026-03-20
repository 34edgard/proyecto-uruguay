<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'lugar_nacimiento';
  public $campos = [
      'id_lugar_nacimiento' => '',
     'id_estado' => '',
     'id_municipio' => '',
    'id_parroquia' => ''    
  ];
};