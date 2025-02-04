<?php

include './includer.php';

//echo '<option> sexo</option>';
Peticion::metodo_get($optenerSexos,["Datos_Niño_Sexo"]);
Peticion::metodo_post($optenerSexos);
