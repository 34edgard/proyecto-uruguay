<?php

interface iSql {
  public function generar_sql(array $propiedades, array $datos);
}

class centencias_sql {
  public function añadir_campo($campo) {
    $this->sql = $this->sql ." `$campo`";
  }
  public function añadir_valor($valor) {

    $this->sql = $this->sql. $this->determinar_tipo($valor);
  }
  public function determinar_tipo($valor):string {
    if (is_numeric($valor)) {

      return " $valor";
    } else if (is_string($valor)) {

      return " '$valor'";
    }
  }
  public function añadir_propiedades(array $propiedades, string $propiedad) {
    foreach ($propiedades[$propiedad] as $contenido) {

      if (sizeof($propiedades[$propiedad]) == 1) {
        if ($propiedad == 'campos') {
          $this->añadir_campo($contenido);
        } elseif ($propiedad == 'valores') {
          $this->añadir_valor($contenido);
        }

      } else if ($contenido != $propiedades[$propiedad][sizeof($propiedades[$propiedad])-1]) {

        if ($propiedad == 'campos') {
          $this->añadir_campo($contenido);
        } elseif ($propiedad == 'valores') {
          $this->añadir_valor($contenido);
        }

        $this->sql = $this->sql.',';
      } else {
        if ($propiedad == 'campos') {
          $this->añadir_campo($contenido);
        } elseif ($propiedad == 'valores') {
          $this->añadir_valor($contenido);
        }
      }
    }
  }
  public function añadir_tabla($tabla) {
    $this->sql = $this->sql ." `$tabla` ";
  }
}

class consultar extends centencias_sql implements iSql {
  public $sql = 'SELECT ';

  public function generar_sql(array $propiedades = ['tabla' => '', 'campos' => ['*']], array $datos = ['datos' => '']) {

    if ($propiedades['tabla'] == '') {
      return 'selecione una tabla';
    }
    $this->añadir_propiedades($propiedades, 'campos');

    $this->sql = $this->sql." FROM ";
    $this->añadir_tabla($propiedades['tabla']);

    return $this->sql;
  }
}
class registrar extends centencias_sql implements iSql {
  public $sql = "INSERT INTO ";
  public function generar_sql(array $propiedades, array $datos = ['datos' => '']) {
    if ($propiedades['tabla'] == '') {
      return 'selecione una tabla';
    } else if (sizeof($propiedades['campos']) != sizeof($propiedades['valores'])) {
      return 'los valores no son suficientes para los campos';
    }



    $this->añadir_tabla($propiedades['tabla']);
    $this->sql = $this->sql." (";
    $this->añadir_propiedades($propiedades, 'campos');

    $this->sql = $this->sql.") VALUES (";
    $this->añadir_propiedades($propiedades, 'valores');
    $this->sql = $this->sql.") ";
    return $this->sql;

  }
}

class editar extends centencias_sql implements iSql {
  public $sql = "UPDATE ";
  public function generar_sql(array $propiedades = ['tabla' => '', 'campos' => ['*']], array $datos = ['datos' => '']) {
    $this->añadir_tabla($propiedades['tabla']);
    $this->sql = $this->sql." SET ";
    for ($i = 0; $i < sizeof($propiedades['campos']); $i++) {
      $this->añadir_campo($propiedades['campos'][$i]);
      $this->sql = $this->sql." = ";
      $this->añadir_valor($propiedades['valores'][$i]);
      if (sizeof($propiedades['campos']) > 1 && $i+1 != sizeof($propiedades['campos'])) {
        $this->sql = $this->sql.", ";
      }

    }

    $this->sql = $this->sql." WHERE ";
    return $this->sql;
  }
}
class eliminar extends centencias_sql implements iSql {
  public $sql = "DELETE FROM ";
  public function generar_sql(array $propiedades, array $datos = ['datos' => '']) {
    $this->añadir_tabla($propiedades['tabla']);
    return $this->sql = $this->sql." WHERE ";

  }
}