<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'tratamiento';
  public $campos = [
      'id_tratamiento' => '',
    'id_condicion_medica' => '',
    'nombre_tratamiento' => ''    
  ];
};
