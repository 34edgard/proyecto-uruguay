<div class="container  p-2">
<div class="row justify-content-center">
  <div class="col-12 col-md-8 col-lg-6 col-xl-5">
   <div class="card p-4 p-md-5 shadow-lg custom-card">
     <div class="card-body text-center">
   

<h2 class="">El registro del representante a sido un éxito</h2>
<p>Desea registrar a otro representante</p>
  <button 
  hx-get="/frontend/Html/Inscripcion/Representante.php"
  hx-trigger="click"
  hx-target="#InicioInscripcion"
  class="btn btn-success"
  type="button">
    si
  </button>
  <button
  hx-get="/frontend/Html/Inscripcion/Niños.php"
  hx-trigger="click"
  hx-target="#InicioInscripcion"
  
  class="btn btn-primary"
  type="button">
     registrar niño
  </button>
</div>
</div>
</div>
</div>
</div>