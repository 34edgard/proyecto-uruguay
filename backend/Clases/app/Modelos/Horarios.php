<?php
use Liki\Modelo;
return new class extends Modelo{
  public $tabla = 'horarios';
  public $campos = [
      'id_horario' => '',
      'id_aula' => '',
    'dia_semana' => '',
    'hora_inicio'=>'',
    'hora_fin'=>'',
    'actividad' => ''    
  ];
};