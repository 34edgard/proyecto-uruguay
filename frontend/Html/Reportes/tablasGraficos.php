    <div class="col">
            <div class="card h-100 shadow-sm">
     <div class="card-body">
       <h5 class="card-title text-primary"><i class="fas fa-user-check me-2"></i> Niños/ñas Inscritos</h5>
       <table class="table table-striped table-hover table-bordered" id="tablaInscritos">
         <thead class="table-primary">
           <tr>
             <th>Inscritos</th>
             <th>Cantidad</th>
           </tr>
         </thead>
         <tbody>
           <!-- Data will be added here dynamically by HTMX -->
           <tr><td colspan="2" class="text-center text-muted">No hay datos para mostrar.</td></tr>
         </tbody>
       </table>
     </div>
            </div>
          </div>
    
          <!-- Card for Promovidos -->
          <div class="col">
            <div class="card h-100 shadow-sm">
     <div class="card-body">
       <h5 class="card-title text-primary"><i class="fas fa-trophy me-2"></i> Promovidos</h5>
       <table class="table table-striped table-hover table-bordered" id="tablaPromovidos">
         <thead class="table-primary">
           <tr>
             <th>Promovidos</th>
             <th>Cantidad</th>
             <th>M</th>
             <th>F</th>
           </tr>
         </thead>
         <tbody>
           <!-- Data will be added here dynamically by HTMX -->
           <tr><td colspan="4" class="text-center text-muted">No hay datos para mostrar.</td></tr>
         </tbody>
       </table>
     </div>
            </div>
          </div>
    
          <!-- Card for Niños por edad -->
          <div class="col">
            <div class="card h-100 shadow-sm">
     <div class="card-body">
       <h5 class="card-title text-primary"><i class="fas fa-birthday-cake me-2"></i> Niños por Edad</h5>
       <table class="table table-striped table-hover table-bordered" id="tablaEdad">
         <thead class="table-primary">
           <tr>
             <th>Edad</th>
             <th>Total</th>
             <th>M</th>
             <th>F</th>
           </tr>
         </thead>
         <tbody>
        <?php foreach($niñosEdad as $n ):  ?>
        <tr>
          <td><?= $n['edad'] ?> Años</td>
          <td><?= $n['total'] ?> </td>
          <td><?= $n['nM'] ?></td>
          <td><?= $n['nF'] ?></td>
        </tr>
        <?php endforeach; ?>
           <!-- Data will be added here dynamically by HTMX -->
     </tbody>
       </table>
     </div>
            </div>
          </div>
    
    
    
    
    
          <!-- Card for Planteles -->
          <div class="col">
            <div class="card h-100 shadow-sm">
     <div class="card-body">
       <h5 class="card-title text-primary"><i class="fas fa-school me-2"></i> Estadísticas por Plantel</h5>
       <table class="table table-striped table-hover table-bordered" id="tablaPlanteles">
         <thead class="table-primary">
           <tr>
             <th>Plantel</th>
             <th>Total</th>
           </tr>
         </thead>
         <tbody>
          <tr>
            <th>Privados</th>
            <th><?= $nPrivados ?></th>
          </tr>
          <tr>
            <th>Publicos</th>
            <th><?= $nPublicos ?></th>
          </tr>
           <!-- Data will be added here dynamically by HTMX -->
          <!-- <tr><td colspan="2" class="text-center text-muted">No hay datos para mostrar.</td></tr>-->
         </tbody>
       </table>
     </div>
            </div>
          </div>
        
     <div class="col">
     <div class="card h-100 shadow-sm">
       <div class="card-body">
         <h5 class="card-title text-primary"><i class="fas fa-school me-2"></i>  niños/as por sexo</h5>
        
        
        
        <div class="container mt-5">
            <h2 class="text-center mb-4">Porcentaje de Niños y Niñas por Sexo</h2>
            <div class="row justify-content-center">
       <div class="col-md-6">
           <canvas id="graficoPastelSexo"></canvas>
       </div>
            </div>
        </div>
        
        
        
    </div>
        </div>
    </div>
    
    
    <script
    
    ></script>
    
  <script>
 


    pastel( <?= $porcentajeNinos ?>,<?= $porcentajeNinas ?>);
      
  </script>  
    