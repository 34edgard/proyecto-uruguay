<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'notificaciones';
  public $campos = [
      'id_notificacion' => '',
    'id_representante' => '',
     'mensaje' => '',
     'fecha_envio' => '',
    'estado' => ''    
  ];
};