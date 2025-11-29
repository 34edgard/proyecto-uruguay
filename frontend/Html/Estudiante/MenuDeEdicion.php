<?php
use Liki\Plantillas\Plantilla;

?>

<div class="container mt-5">
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item" role="presentation">
      <button type="button" class="nav-link active" data-bs-toggle="tab" data-bs-target="#tablaUsuarios" role="tab"  >editar estudiante</button>
    </li>
    
      <li class="nav-item" role="presentation">
        <button type="button" class="nav-link  " data-bs-toggle="tab" data-bs-target="#general" role="tab" aria-selected="true">editar datos extra</button>
      </li>
      

  </ul>




  <div class="tab-content" role="tablist">



     <div class="tab-pane   table-responsive" id="general" role="tabpanel">
     
<?php
//print_r($estudiante);
Plantilla::HTML('Estudiante/Extras', $estudiante);
?>
       </div>
     

<div class="tab-pane active table-responsive"  role="tabpanel" id="tablaUsuarios">
 

<?php
//print_r($estudiante);
Plantilla::HTML('Estudiante/Editar',$estudiante);
?>


</div>



 
    

  </div>
</div>



