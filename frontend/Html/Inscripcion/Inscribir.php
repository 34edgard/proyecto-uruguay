<!--<div class="container">
    <h2 class="text-primary text-center">
        Inscriba  al niño
    </h2>
   
<form
hx-post="/plantel/AnioEscolar/registrar"
hx-trigger="submit"
hx-target="#InicioInscripcion"
>


<label>
tipo de plantel 

<select name="tipo_plantel" class="form-control">
<option value="publico">publico</option>
<option value="privado">privado</option>

</select>
</label>

<label>
cedula escolar
<input type="number" name="ci_escolar" class="form-control"
value="<?= $ci_escolar ?>"
>
</label>
<label

hx-get="/plantel/aulas/select"
hx-trigger="load"
hx-target="#aula"
>

aula
<select name="aula"
id="aula"
class="form-control m-2"
>

</select>
</label>




<label
  hx-get="/plantel/periodo/escolar?periodo_escolar"
hx-trigger="load"
hx-target="#periodo_escolar"
>

periodo escolar
<select name="periodo_escolar" 
id="periodo_escolar"
class="form-control m-2"
>

</select>
</label>

<button type="submit"
class="btn btn-primary m-2"
>
Inscribir
</button>
</form>



</div>
-->





<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-primary text-white text-center py-3">
                    <h3 class="mb-0">
                        <i class="fas fa-user-graduate me-2"></i>Inscriba al niño
                    </h3>
                </div>
                <div class="card-body p-4">
                    <form 
                        hx-post="/plantel/AnioEscolar/registrar"
                        hx-trigger="submit"
                        hx-target="#InicioInscripcion"
                        class="needs-validation"
                        novalidate
                    >
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="tipo_plantel" class="form-label fw-semibold">
                                    <i class="fas fa-school me-1"></i>Tipo de plantel
                                </label>
                                <select name="tipo_plantel" id="tipo_plantel" class="form-select" required>
                                    <option value="" disabled selected>Seleccione una opción</option>
                                    <option value="publico">Público</option>
                                    <option value="privado">Privado</option>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor seleccione un tipo de plantel.
                                </div>
                            </div>
                            
                            <div class="col-md-6 mb-3">
                                <label for="ci_escolar" class="form-label fw-semibold">
                                    <i class="fas fa-id-card me-1"></i>Cédula escolar
                                </label>
                                <input 
                                    type="number" 
                                    name="ci_escolar" 
                                    id="ci_escolar" 
                                    class="form-control"
                                    value="<?= $ci_escolar ?>"
                                    required
                                >
                                <div class="invalid-feedback">
                                    Por favor ingrese la cédula escolar.
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label 
                                    for="aula" 
                                    class="form-label fw-semibold"
                                    hx-get="/plantel/aulas/select"
                                    hx-trigger="load"
                                    hx-target="#aula"
                                >
                                    <i class="fas fa-door-open me-1"></i>Aula
                                </label>
                                <select 
                                    name="aula"
                                    id="aula"
                                    class="form-select"
                                    required
                                >
                                    <option value="" disabled selected>Cargando aulas...</option>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor seleccione un aula.
                                </div>
                            </div>
                            
                            <div class="col-md-6 mb-3">
                                <label 
                                    for="periodo_escolar" 
                                    class="form-label fw-semibold"
                                    hx-get="/plantel/periodo/escolar?periodo_escolar"
                                    hx-trigger="load"
                                    hx-target="#periodo_escolar"
                                >
                                    <i class="fas fa-calendar-alt me-1"></i>Periodo escolar
                                </label>
                                <select 
                                    name="periodo_escolar" 
                                    id="periodo_escolar"
                                    class="form-select"
                                    required
                                >
                                    <option value="" disabled selected>Cargando periodos...</option>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor seleccione un periodo escolar.
                                </div>
                            </div>
                        </div>
                        
                        <div class="d-grid mt-4">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="fas fa-user-plus me-2"></i>Inscribir
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Script para validación del formulario -->
<script>
// Validación del formulario
(function() {
    'use strict';
    window.addEventListener('load', function() {
        var forms = document.getElementsByClassName('needs-validation');
        var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();
</script>
