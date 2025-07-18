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
    $estadoActual = $usuarios->consultar($datos);
   
   $estado = "activo";
   $estilo = "success";
 if ($estadoActual[0]["estado"] == "activo") {
      $estado = "inactivo";
      $estilo = "secondary";
    } 

    $datos["valores"] = [$ci, $estado];
    $usuarios->editar($datos);
//echo "<button class='btn btn-{$estilo}' 
 //  hx-target='#estado{$estadoActual[0]["cedula"]}'
    //     hx-get='/usuario/cambiarEstadoUsuario?cambiarEstadoUsuario&ci={$estadoActual[0]["cedula"]}'          hx-trigger='click'          >{$estado}</button>";

plantilla('componentes/button',[
    "contenido"=>$estado,
    "estilo"=>$estilo,
    "hx"=>[
        "url"=>"/usuario/cambiarEstadoUsuario?cambiarEstadoUsuario&ci={$estadoActual[0]['cedula']}",
        "target"=>"#estado{$estadoActual[0]['cedula']}",
        "trigger"=>'click'
        ]
]);

     };
})();
