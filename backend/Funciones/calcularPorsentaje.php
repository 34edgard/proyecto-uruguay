<?php

function calcularPorcentaje($cantidadTotal, $cantidadCalcular) {
  // Validar que la cantidad total no sea cero para evitar división por cero
  if ($cantidadTotal == 0) {
    return 0; // O podrías manejarlo como un error, dependiendo de tu necesidad
  }

  $porcentaje = ($cantidadCalcular / $cantidadTotal) * 100;
  return $porcentaje;
}
