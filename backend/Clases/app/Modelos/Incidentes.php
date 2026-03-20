<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'incidentes';
  public $campos = [
      'id_incidente' => '',
      'ci_escolar' => '',
    'fecha_incidente' => '',
    'descripcion'=>'',
    'acciones_tomadas' => ''    
  ];
};