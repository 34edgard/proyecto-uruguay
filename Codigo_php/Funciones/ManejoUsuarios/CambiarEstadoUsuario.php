<?php
(function (){
  global $cambiarEstado;
  $cambiarEstado = function () {
    extract($_GET);

    $datos = ["campos" => ["cedula", "estado"], 
      "where"=>[
        ["campo"=>'cedula',"operador"=>'=',"valor"=>$ci]
      ]
      ];

    $usuarios = new Personal_Administrativo();
    $estadoActual = $usuarios->consultar_datos($datos);
    if ($estadoActual[0]["estado"] == "activo") {
      $estado = "inactivo";
      $estilo = "secondary";
    } else {
      $estado = "activo";
      $estilo = "success";
    }

    $datos["valores"] = [$ci, $estado];
    $usuarios->editar_datos($datos);



   echo "<button class='btn btn-{$estilo}' 
   hx-target='#estado{$estadoActual[0]["cedula"]}'
         hx-get='/Gestion_Usuario?cambiarEstadoUsuario&ci={$estadoActual[0]["cedula"]}'          hx-trigger='click'          >{$estado}</button>";
  };
})();
