<?php

(function(){
   global $imprimirDocenteCI;
   $imprimirDocenteCI =function(){
          $DOCENTE = new Docente();
        $Extras = func_get_args();
          extract($Extras[0]);
        
        
        
        $pdf = new PDF();
          $res = $DOCENTE->consultar([
            "campos" => ["cedula","id_docente", "nombres", "apellidos", "fecha_nacimiento"],
            "where"=>[
              ["campo"=>'cedula',"operador"=>'LIKE',"valor"=>$ci.'%']
            ]
            
          ]);
             
             $i=0;
          foreach ($res as $user) {
            $i++;
            $numero_telefono= (new Telefono())->consultar([    "campos" => ["id_docente","numero_telefono"],
              "where"=>[
                ["campo"=>'id_docente',"operador"=>'=',"valor"=>$user['id_docente']]
              ]
          
          ])[0]["numero_telefono"]; 
        
        
       
            $data[]=[$i, $user['cedula'], $user['nombres'],
            $user['apellidos'], 
            $user['fecha_nacimiento'],
            Edad($user['fecha_nacimiento']),
           $numero_telefono];
           
          }
        
        
        $pdf->AddPage();
         $pdf->SetFont('Arial','B',8);
         $pdf->BasicTable(
         ['id','cedula','nombres','apellidos','fecha_nacimiento','edad','telefono'],
         $data
         );
        $pdf->Output('D', 'docentes.pdf'); 
   };
})();