<div class="container  p-2">
<h2>el registro a sido un éxito</h2>
<p>desea registrar a otro representante</p>
  <button 
  hx-get="/Publico/Html/Inscripcion/Representante.php"
  hx-trigger="click"
  hx-target="#InicioInscripcion"
  class="btn btn-primary"
  type="button">
    si
  </button>
  <button
  hx-get="/Publico/Html/Inscripcion/Niños.php"
  hx-trigger="click"
  hx-target="#InicioInscripcion"
  
  class="btn btn-info"
  type="button">
     registrar niño
  </button>
</div>