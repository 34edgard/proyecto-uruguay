<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'ubicacion';
  public $campos = [
      'id_ubicacion' => '',
     'id_sector' => '',
    'nro_vivienda' => '',
    'calle_vereda_avenida' => ''    
  ];
};