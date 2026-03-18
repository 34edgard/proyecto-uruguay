<?php

use App\Controladores\Personas\Docente;
use App\Controladores\DatosExtra\Telefono;
use Liki\Database\FlowDB;
use Funciones\Edad;
use Liki\Files\PDF;

return new class {
   public static function run($p){
        
            extract($p);
        
        
        
        $pdf = new PDF();
          $res = FlowDB::conf('Docente')
->campos(["cedula","id_docente", "nombres", "apellidos", "fecha_nacimiento"])
->get(['cedula'=>['LIKE',$ci.'%']]);
             
             $i=0;
          foreach ($res as $user) {
            $i++;
            $numero_telefono= FlowDB::conf('Telefono')
            ->campos(["id_docente","numero_telefono"])
            ->get(['id_docente'=>$user['id_docente']])[0]["numero_telefono"]; 
        
        
       
            $data[]=[$i, $user['cedula'], $user['nombres'],
            $user['apellidos'], 
            $user['fecha_nacimiento'],
            Edad::Edad($user['fecha_nacimiento']),
           $numero_telefono];
           
          }
        
        
        $pdf->AddPage();
         $pdf->SetFont('Arial','B',8);
         $pdf->BasicTable(
         ['id','cedula','nombres','apellidos','fecha_nacimiento','edad','telefono'],
         $data
         );
        $pdf->Output('D', 'docentes.pdf'); 
   }
};