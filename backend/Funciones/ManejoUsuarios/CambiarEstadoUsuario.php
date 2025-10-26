<?php
namespace Funciones\ManejoUsuarios;
use App\Personas\Usuario;
use Liki\Plantillas\Plantilla;



class CambiarEstadoUsuario{
  public static function cambiarEstado() {
    $Extras = func_get_args();
    extract($Extras[0]);

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

Plantilla::HTML('componentes/button',[
    "contenido"=>$estado,
    "estilo"=>$estilo,
    "hx"=>[
        "url"=>"/usuario/cambiarEstadoUsuario?cambiarEstadoUsuario&ci={$estadoActual[0]['cedula']}",
        "target"=>"#estado{$estadoActual[0]['cedula']}",
        "trigger"=>'click'
        ]
]);

     }
}
